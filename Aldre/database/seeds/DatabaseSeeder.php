<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        $this->call(DatabaseSeeder::class);
        DB::table('user_apps')->insert([[
            'name' => 'Somdee',
            'surname' => 'Deeja',
            'nickname' => 'Dee',
            'birthday' => '1997-09-23',
            'gender' => 'female',
            'tel' => '0882323923',
            'evaluated_id' => 1,
        ],
            [
                'name' => 'Veevi',
                'surname' => 'Deeja',
                'nickname' => 'Doo',
                'birthday' => '1996-09-22',
                'gender' => 'male',
                'tel' => '0809039203',
                'evaluated_id' => 1,
            ],
            [
                'name' => 'Mearai',
                'surname' => 'Maime',
                'nickname' => 'Dee',
                'birthday' => '1997-02-23',
                'gender' => 'female',
                'tel' => '093743949',
                'evaluated_id' => 1,
            ]
        ]);
    }
}
