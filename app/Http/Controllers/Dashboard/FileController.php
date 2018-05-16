<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\File as IModel;
use Func;
class FileController extends IController
{
    var $metaTitle="الملفات";
    public $model=IModel::class;
    var $methods=[];

}
