<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateMenulinks extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        $menu_links = array(
            array('id' => '8','menu_id' => '1','customlink' => '/magazine','category_id' => '2','parent_id' => NULL,'hasSubs' => '1','created_at' => '2018-05-07 09:01:30','updated_at' => '2018-05-11 13:14:11'),
            array('id' => '10','menu_id' => '1','customlink' => '/anual_events','category_id' => '5','parent_id' => NULL,'hasSubs' => '1','created_at' => '2018-05-07 09:04:20','updated_at' => '2018-05-11 13:47:05')
        );

        DB::table('menu_links')->whereIn('id',[8,10])->delete();
        DB::table('menu_links')->insert($menu_links);

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
