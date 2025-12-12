<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GlobalWinnerResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Initialize counts
        $merit = 0;
        $champion = 0;
        $meritList = [];
        $championList = [];
        // Calculate counts
        foreach ($this->applications as $app) {
            if ($app->global_position === 'first') {
                $champion++;
                $championList[] = $this->modifyProject($app);

            } elseif (isset($app->global_position)) {
                $merit++;
                $meritList[] = $this->modifyProject($app);
            }
        }
        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'session' => (int)$this->session,
            'cover' => '/uploads/images/' . $this->cover,
            'description' => $this->description,
            'championList' => $championList,
            'meritList' => $meritList,
            'summary' => [
                'totalApply' => count($this->applications),
                'champion' => $champion,
                'merit' => $merit
            ]
        ];
    }

    private function modifyProject($app): array
    {
        return [
          'id'=>$app->id,
          'project_name'=>$app->project_name,
          'team_name'=>$app->team_name,
          'image'=>!empty($app->image)?'/uploads/group/'.$app->image:'/uploads/images/about-img.png',
        ];
    }
}
