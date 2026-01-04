<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Carbon\Carbon;


Route::group([ 'prefix' => 'import'], function () {

    Route::get('/registration', function () {

        // Load JSON as collections
        $registrations = collect(json_decode(
            File::get(public_path('jsondatabase/team-topic-registrations.json')),
            true
        ))->unique('team_id')->values();

        $teams = collect(json_decode(
            File::get(public_path('jsondatabase/teams.json')),
            true
        ))->keyBy('id');

        $users = collect(json_decode(
            File::get(public_path('jsondatabase/users.json')),
            true
        ))->map(fn($user) => array_merge($user, ['email' => strtolower($user['email'])]))->unique('email')->keyBy('id');

        $teamMembers = collect(json_decode(
            File::get(public_path('jsondatabase/team-members.json')),
            true
        ));

        // Prepare dataset
        $result = $registrations->map(function ($registration) use ($teams, $users, $teamMembers) {

            $team = $teams->get($registration['team_id']);
            if (!$team) return null;

            $leader = $users->get($team['leader_id']);
            if (!$leader) return null;

            $members = $teamMembers
                ->where('team_id', $registration['team_id'])
                ->where('role', 'member');

            $year  = date('Y');
            $regId = sprintf('%04d', $registration['id']);

            $registrationData = [
                'id' => $registration['id'],
                'registration_no' => "MillionX-{$year}-{$regId}",
                'team_member' => $members->count() + 1,
                'reg_id' => $regId,
                'zone_id' => $team['team_region'] ?? null,
                'app_challenge_id' => 1,
                'session' => $year,
                'category_id' => $registration['topic_id'],
                'team_name' => $team['team_name'],
                'team_type' => $team['team_type'],
                'team_leader_name' => $leader['first_name'].' '.$leader['last_name'],
                'team_leader_mobile' => $leader['phone'] ?? null,
                'team_leader_email' => $leader['email'],
                'university_id' => $leader['university_id'] ?? null,
                'image' => $team['team_group_photo'] ?? null,
                'created_at' => Carbon::parse($registration['created_at'])->toDateTimeString(),
                'updated_at' => Carbon::parse($registration['updated_at'])->toDateTimeString(),
            ];

            $participantData = [
                'id' => $leader['id'],
                'email' => $leader['email'],
                'password' => $leader['password_hash'],
                'registration_id' => $registration['id'],
            ];

            $teamMembersData = $members->map(fn ($m) => [
                'registration_id' => $registration['id'],
                'name' => $m['first_name'].' '.$m['last_name'],
                'email' => $m['email'] ?? null,
                'mobile' => $m['phone'] ?? null,
            ])->values()->toArray();

            return [
                'registration' => $registrationData,
                'participant' => $participantData,
                'team_members' => $teamMembersData
            ];
        })->filter()->values();

        // Insert into DB safely
        DB::transaction(function () use ($result) {
            DB::table('registrations')->delete();
            DB::table('participants')->delete();
            DB::table('team_members')->delete();

            $registrations = $result->pluck('registration')->toArray();
            $participants  = $result->pluck('participant')->toArray();
            $members       = $result->pluck('team_members')->flatten(1)->toArray();

            DB::table('registrations')->insert($registrations);
            DB::table('participants')->insert($participants);
            DB::table('team_members')->insert($members);
        });

        return response()->json([
            'message' => 'All registrations inserted successfully'
        ]);
    });

    Route::get('/universities', function () {

        $path = public_path('jsondatabase/universities.json');

        if (!File::exists($path)) {
            return response()->json(['message' => 'File not found'], 404);
        }

        $universities = json_decode(File::get($path), true);
        if (!is_array($universities)) {
            return response()->json(['message' => 'Invalid JSON'], 422);
        }

        DB::table('universities')->delete();

        DB::table('universities')->insertOrIgnore(
            collect($universities)->map(fn ($u) => [
                'id'       => $u['id'],
                'name'       => $u['name'],
                'code'       => $u['code'],
                'address'    => $u['address'],
                'city'       => $u['city'],
                'country'    => $u['country'],
                'logo_url'   => $u['logo_url'],
                'is_active'  => (bool) $u['is_active'],
                'created_at' => $u['created_at'] ?? now(),
                'updated_at' => $u['updated_at'] ?? now(),
                'deleted_at' => $u['deleted_at'],
            ])->toArray()
        );

        return response()->json(['message' => 'Universities inserted']);
    });

    Route::get('/categories', function () {

        $path = public_path('jsondatabase/competition-topics.json');

        if (!File::exists($path)) {
            return response()->json(['message' => 'File not found'], 404);
        }

        $categories = json_decode(File::get($path), true);
        if (!is_array($categories)) {
            return response()->json(['message' => 'Invalid JSON'], 422);
        }

        // Reset table
        DB::table('app_challenge_categories')->truncate();

        // Insert categories
        DB::table('app_challenge_categories')->insert(
            collect($categories)->map(fn ($c) => [
                'id'    => $c['id'],
                'title' => $c['topic_category'],
                'created_at'=> now(),
                'updated_at'=> now(),
            ])->toArray()
        );

        // Challenges data (PHP array)
        $challengesData = [
            'EdTech' => [
                'Adaptive AI Tutor (Bangla & English curricula)',
                'Exam preparation recommender with mock tests',
                'Personalized remedial learning for struggling subjects',
                'Multimodal learning assistant (text, voice, visuals)',
                'Learning analytics dashboard for educators/parents',
                'Custom: User-defined EdTech challenge',
            ],
            'AgriTech' => [
                'Crop health detection via satellite/drone imagery',
                'Pest/disease early-warning system',
                'Fertilizer / irrigation recommendation engine',
                'Real-time farmer dashboard (weather, soil, yield forecast)',
                'Farm-to-market supply chain & price forecasting tool',
                'Custom: User-defined AgriTech challenge',
            ],
            'HealthTech' => [
                'Maternal health companion (nutrition, pregnancy care)',
                'Health worker assistant for community health & patient triage',
                'Telehealth + offline mode for rural clinics',
                'Nutrition & diet recommender using local food data',
                'Health risk early-warning system (e.g. pregnancy complications)',
                'Custom: User-defined HealthTech challenge',
            ],
            'E-commerce' => [
                'Demand forecasting for SMEs in Bangladesh',
                'Dynamic pricing & inventory optimization engine',
                'Product recommendation & personalization for SMEs',
                'SME business dashboard: sales, trends, analytics',
                'Integration with local e-commerce / payment / delivery platforms',
                'Custom: User-defined E-commerce challenge',
            ],
            'FinTech' => [
                'Alternative-data credit scoring for micro-lending',
                'Real-time fraud / anomaly detection for digital lenders',
                'Dashboard for MFIs and credit analysts',
                'Explainable AI for credit decisions',
                'Inclusive lending tool for underserved/rural populations',
                'Custom: User-defined FinTech challenge',
            ],
        ];

        // Update challenges column by title
        foreach ($challengesData as $title => $challenges) {
            DB::table('app_challenge_categories')
                ->where('title', $title)
                ->update([
                    'challenges' => implode(' | ', $challenges),
                ]);
        }

        return response()->json([
            'message' => 'Categories inserted and challenges updated successfully'
        ]);
    });

    Route::get('/sub-categories', function () {

        // Challenges data (PHP array)
        $challengesData = [
            'EdTech' => [
                [   "title" => "Adaptive AI Tutor (Bangla & English)",
                    "challenges" =>
                    'Build an AI tutor that personalizes lessons, practice, and feedback based on student level, pace, and learning gaps.'
                ],
                [   "title" => "Exam Preparation Recommender",
                    "challenges" =>
                    'Create a system that generates mock tests, predicts readiness, and recommends targeted study plans aligned with curriculum.'
                ],
                [   "title" => "Personalized Remedial Learning",
                    "challenges" =>
                    'Identify weak subjects for students and deliver focused remedial lessons, exercises, and assessments.'
                ],
                [   "title" => "Multimodal Learning Assistant",
                    "challenges" =>
                    'Develop a learning assistant using text, voice, and visuals to improve engagement and accessibility.'
                ],
                [   "title" => "Learning Analytics Dashboard",
                    "challenges" =>
                    'Build analytics for teachers and parents to track progress, identify risks, and improve learning outcomes.'
                ],
                [   "title" => "Custom EdTech Challenge",
                    "challenges" =>
                    'Define your own EdTech problem while staying within the education domain.'
                ],
            ],
            'AgriTech' => [
                [   "title" => "Crop Health Detection",
                    "challenges" =>
                    'Use satellite or drone imagery to detect crop stress, disease, or growth anomalies'
                ],
                [   "title" => "Pest & Disease Early Warning",
                    "challenges" =>
                    'Predict pest or disease outbreaks and generate early alerts and preventive recommendations'
                ],
                [   "title" => "Fertilizer & Irrigation Recommender",
                    "challenges" =>
                    'Optimize fertilizer and irrigation schedules based on soil, weather, and crop data.'
                ],
                [   "title" => "Farmer Decision Dashboard",
                    "challenges" =>
                    'Provide farmers with real-time insights on weather, soil, yield forecasts, and advisories.'
                ],
                [   "title" => "Farm-to-Market Price Forecasting",
                    "challenges" =>
                    'Forecast crop prices and recommend optimal selling and supply-chain strategies.'
                ],
                [   "title" => "Custom AgriTech Challenge",
                    "challenges" =>
                    'Define a new agriculture-focused AI solution within the AgriTech domain.'
                ],
            ],
            'HealthTech' => [
                [   "title" => "Maternal Health Companion",
                    "challenges" =>
                    'Build an AI assistant for pregnancy care, nutrition guidance, and health reminders.'
                ],
                [   "title" => "Health Worker Assistant",
                    "challenges" =>
                    'Support community health workers with patient triage, summaries, and care recommendations.'
                ],
                [   "title" => "Telehealth with Offline Mode",
                    "challenges" =>
                    'Design a telehealth system that works reliably in low-connectivity rural environments'
                ],
                [   "title" => "Nutrition & Diet Recommende",
                    "challenges" =>
                    'Recommend personalized diets using local food availability, prices, and health needs.'
                ],
                [   "title" => "Health Risk Early Warning",
                    "challenges" =>
                    'Predict high-risk health events (e.g., pregnancy complications) and trigger alerts.'
                ],
                [   "title" => "Custom HealthTech Challenge",
                    "challenges" =>
                    'Define a new AI healthcare challenge within HealthTech boundaries.'
                ],
            ],
            'E-commerce' => [
                [   "title" => "SME Demand Forecasting",
                    "challenges" =>
                    'Predict product demand to reduce overstock and stockouts for small merchants.'
                ],
                [   "title" => "Dynamic Pricing & Inventory",
                    "challenges" =>
                    'Optimize pricing and inventory levels using demand and market signals.'
                ],
                [   "title" => "Product Recommendation Engine",
                    "challenges" =>
                    'Personalize product recommendations to increase conversions and retention.'
                ],
                [   "title" => "SME Business Intelligence Dashboard",
                    "challenges" =>
                    'Provide actionable analytics on sales, trends, customers, and inventory.'
                ],
                [   "title" => "Platform Integration Tool",
                    "challenges" =>
                    'Build integrations with local e-commerce, payment, and delivery platforms.'
                ],
                [   "title" => "Custom E-Commerce Challenge",
                    "challenges" =>
                    'Define a new AI commerce problem within the E-Commerce domain.'
                ],
            ],
            'FinTech' => [
                [   "title" => "Alternative-Data Credit Scoring",
                    "challenges" =>
                    'Detect fraud, identity abuse, or suspicious transactions in real time.'
                ],
                [   "title" => "Fraud & Anomaly Detection",
                    "challenges" =>
                    'Optimize pricing and inventory levels using demand and market signals.'
                ],
                [   "title" => "MFI & Credit Analyst Dashboard",
                    "challenges" =>
                    'Build dashboards for portfolio risk, repayment trends, and inclusion metrics.'
                ],
                [   "title" => "Explainable Credit Decisions",
                    "challenges" =>
                    'Create transparent AI models that explain why credit is approved or denied.'
                ],
                [   "title" => "Inclusive Lending Platform",
                    "challenges" =>
                    'Design end-to-end lending solutions for rural or unbanked populations'
                ],
                [   "title" => "Custom FinTech Challenge",
                    "challenges" =>
                    'Define a new AI finance problem within the FinTech domain.'
                ],
            ],
        ];

        foreach ($challengesData as $categoryTitle => $subCategories) {

                // Get parent category
                $parentCategory = DB::table('app_challenge_categories')
                    ->where('title', $categoryTitle)
                    ->first();

                // Skip if parent not found
                if (! $parentCategory) {
                    continue;
                }

                foreach ($subCategories as $subCategory) {
                    DB::table('app_challenge_categories')->insert([
                        'parent_id'  => $parentCategory->id,
                        'title'      => $subCategory['title'],
                        'challenges' => $subCategory['challenges'],
                        'created_at'=> now(),
                        'updated_at'=> now(),
                    ]);
                }
            }

        return response()->json([
            'message' => 'Sub-Categories inserted and challenges updated successfully'
        ]);
    });

    Route::get('/add-new-categories', function () {
        try {
            // Use a transaction to ensure both inserts succeed, or neither does.
            DB::transaction(function () {
                $now = now(); // Capture time once for consistency

                // 1. Insert Parent and get the auto-generated ID
                // We use insertGetId so we don't have to hardcode '36'
                $parentId = DB::table('app_challenge_categories')->insertGetId([
                    'parent_id'  => null, // Use NULL, not '' for root items
                    'title'      => 'Your Own Competition Topic',
                    'challenges' => 'This section allows participants to select or design their own competition topic based on their interests, creativity, and skills.',
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);

                // 2. Insert Child using the dynamic Parent ID
                DB::table('app_challenge_categories')->insert([
                    'parent_id'  => $parentId,
                    'title'      => 'Your Own Challenge Topic',
                    'challenges' => 'Design a unique challenge that reflects your creativity and skills.',
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            });

            return response()->json([
                'success' => true,
                'message' => 'New Categories inserted successfully'
            ], 200);

        } catch (\Exception $e) {
            // Handle potential errors (e.g., database connection issues)
            return response()->json([
                'success' => false,
                'message' => 'Failed to insert categories: ' . $e->getMessage()
            ], 500);
        }
    });


    Route::get('/new-universities', function () {

        $path = public_path('jsondatabase/all-universities.json');

        if (!File::exists($path)) {
            return response()->json(['message' => 'File not found'], 404);
        }

        $universities = json_decode(File::get($path), true);

        if (!is_array($universities)) {
            return response()->json(['message' => 'Invalid JSON'], 422);
        }

        // 🔹 Get existing university names (lowercase for safety)
        $existingNames = DB::table('universities')
            ->pluck('name')
            ->map(fn ($name) => strtolower(trim($name)))
            ->toArray();

        // 🔹 Filter only new universities
        $newUniversities = collect($universities)
            ->filter(fn ($u) => !in_array(strtolower(trim($u['name'])), $existingNames))
            ->map(fn ($u) => [
                'name'       => $u['name'],
                'code'       => '',
                'address'    => $u['location'],
                'city'       => $u['location'],
                'country'    => 'Bangladesh',
                'logo_url'   => '',
                'is_active'  => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ])
            ->values()
            ->toArray();

        if (!empty($newUniversities)) {
            DB::table('universities')->insert($newUniversities);
        }

        return response()->json([
            'message' => 'Universities processed successfully',
            'inserted' => count($newUniversities),
        ]);
    });

});



