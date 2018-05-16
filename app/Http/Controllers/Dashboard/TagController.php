<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\IController;
use App\Models\Tag as IModel;
use Func;
class TagController extends IController
{
    var $metaTitle="Post Tags";
    public $model=IModel::class;
    var $methods=[];
 }
