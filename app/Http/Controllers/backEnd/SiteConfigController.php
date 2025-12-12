<?php

namespace App\Http\Controllers\backEnd;

use App\Http\Controllers\Controller;
use App\Models\SiteConfig;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Session;
use Stevebauman\Purify\Facades\Purify;


class SiteConfigController extends Controller
{

    public function index(): \Illuminate\Http\JsonResponse
    {
        return response()->json(SiteConfig::first());
    }

    public function config(Request $request): \Illuminate\Contracts\View\View|\Illuminate\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\Contracts\Foundation\Application
    {

        if ($request->isMethod('POST')) {

            $request['logo'] = in_array($request['logo'], ['logo.png', 'logo.jpeg', 'logo.jpg']) ? null : $request['logo'];
            $request->validate([
                'title' => 'required',
                'short_title' => 'required',
                'logo' => 'nullable|mimes:jpeg,jpg,png|max:500'
            ]);
            $config = SiteConfig::firstOrNew();
            $reqData = Purify::clean($request->except('_token', '_method'));
            config(['settings.title' => $reqData['title']]);
            config(['settings.short_title' => $reqData['short_title']]);
            config(['settings.web' => $reqData['web']]);
            config(['settings.venue' => $reqData['venue']]);
            config(['settings.email' => $reqData['email']]);
            config(['settings.mobile' => $reqData['mobile']]);
            config(['settings.maps' => $reqData['maps']]);
            config(['settings.social_fb' => $reqData['social_fb']]);
            config(['settings.social_linkedin' => $reqData['social_linkedin']]);
            config(['settings.social_youtube' => $reqData['social_youtube']]);
            config(['settings.social_twitter' => $reqData['social_twitter']]);
            config(['settings.copyright' => $reqData['copyright']]);
            config(['settings.deadline' => $reqData['deadline']]);
            config(['settings.start_date' => $reqData['start_date']]);

            if ($request->hasFile('logo')) {
                $extension = $request->logo->getClientOriginalExtension();
                $logo = 'logo.' . $extension;
                $request->logo->move(public_path('uploads/images/'), $logo);
                config(['settings.logo' => $logo]);
                $reqData['logo'] = $logo;
            }
            if ($request->hasFile('favicon')) {
                $extension = $request->favicon->getClientOriginalExtension();
                $favicon = 'favicon.' . $extension;
                $request->favicon->move(public_path('uploads/images/'), $favicon);
                config(['settings.favicon' => $favicon]);
                $reqData['favicon'] = $favicon;
            }
            config(['settings.address' => $reqData['address']]);
            $fp = fopen(base_path() . '/config/settings.php', 'wb');
            fwrite($fp, '<?php return ' . var_export(config('settings'), true) . ';');
            fclose($fp);
            // Convert empty datetime fields to null
            $datetimeFields = [
                'video30sstart_date', 'video30send_date',
                'video240sstart_date', 'video240send_date',
                'project_linkstart_date', 'project_linkend_date'
            ];

            foreach ($datetimeFields as $field) {
                if (isset($reqData[$field]) && $reqData[$field] === '') {
                    $reqData[$field] = null;
                }
            }
            $config->fill($reqData)->save();

            Artisan::call('optimize:clear');
            Artisan::call('view:clear');
            Artisan::call('config:clear');
            Artisan::call('cache:clear');
            Artisan::call('optimize');

            Artisan::call('view:cache');
            Artisan::call('config:cache');

            /*   return redirect()->back();*/

            return response()->json([
                'msg' => 'Site Configuration has been updated.'
            ]);

        }

        return view("backEnd.pages.config");
    }


    public function summaryYear(Request $request): \Illuminate\Http\RedirectResponse
    {
        $years = [];
        for ($year = date('Y'); $year >= date('Y') - 3; $year--) {
            $years[] = (int)$year;
        }
        in_array((int)$request->year, $years, true) ? Session::put('summaryYear', $request->year) : Session::forget('summaryYear');
        return back()->with('success', 'Summary Year has been changed.');
    }
}
