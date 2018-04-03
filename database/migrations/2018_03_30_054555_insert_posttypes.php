<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
//use DB;
class InsertPosttypes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        DB::table('posttypes')->insert(
            [
              ['id'=>1,'name' => 'Pages','created_at'=>date("Y-m-d H:i:n")],
              ['id'=>2,'name' => 'Posts','created_at'=>date("Y-m-d H:i:n")],
              ['id'=>3,'name' => 'Research','created_at'=>date("Y-m-d H:i:n")],
            ]
          );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
      DB::table('posttypes')->whereIn('id',[1,2,3])->delete();

    }
}
