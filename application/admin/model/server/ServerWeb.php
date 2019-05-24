<?php
/**
 *
 * @author: honor<763569752@qq.com>
 * @day: 2017/11/13
 */

namespace app\admin\model\server;

use traits\ModelTrait;
use basic\ModelBasic;

/**
 * 身份管理 model
 * Class SystemRole
 * @package app\admin\model\system
 */
class ServerWeb extends ModelBasic
{
    use ModelTrait;

    public static function systemPage($where)
    {

        $model = new self;
        if($where['status'] != '')  $model = $model->where('status',$where['status']);
        if($where['name'] != '') {
            $model = $model->where(array('name|https|ip|version'=>array('like','%'.$where['name'].'%')));
        }
        if($where['data'] !== ''){
            list($startTime,$endTime) = explode(' - ',$where['data']);
            $model = $model->where('add_time','>',strtotime($startTime));
            $model = $model->where('add_time','<',strtotime($endTime));
        }
        $model = $model->order('id desc');

        return self::page($model,$where);
    }
    public static function isAuth($ip,$https){
        if(empty($ip) || empty($https)) return false;
        return self::where(['ip'=>$ip,'https'=>$https])->value('status');
    }

}