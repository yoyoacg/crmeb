<?php/** * * @author: xaboy<365615158@qq.com> * @day: 2017/11/11 */namespace app\admin\controller\user;use app\admin\controller\AuthController;use service\FormBuilder as Form;use service\UtilService as Util;use service\JsonService as Json;use think\Request;use think\Url;use basic\ModelBasic;use app\admin\model\user\UserLevel as UserLevelModel;/** * 用户管理控制器 * Class User * @package app\admin\controller\user */class UserLevel extends AuthController{    /**     * 显示资源列表     *     * @return \think\Response     */    public function index(){        if($this->request->isAjax()){            $where=Util::getMore([                ['page',1],                ['limit',20]            ]);            return Json::successlayui(UserLevelModel::getList($where));        }else{            return $this->fetch();        }    }    /**     * 添加会员等级     * @param $id     * @return mixed|\think\response\Json|void     */    public function create()    {        $f = array();        $f[] = Form::input('level_name','等级名称')->required('不能为空');        $f[] = Form::input('ico','等级图标');        $f[] = Form::number('level','等级',1)->min(0)->max(12);        $f[] = Form::number('integral','满足积分',0)->min(0)->col(8);        $f[] = Form::number('monetary','消费金额',0)->min(0)->col(8);        $f[] = Form::number('orders','消费次数',0)->min(0)->col(8);        $f[] = Form::number('discount','享受折扣',1)->min(0)->max(20)->precision(2);        $f[] = Form::textarea('explain','等级说明')->col(24);        $f[] = Form::radio('status','状态',1)->options([['value'=>1,'label'=>'开启'],['value'=>0,'label'=>'锁定']]);        $form = Form::make_post_form('添加会员等级',$f,Url::build('update'));        $this->assign(compact('form'));        return $this->fetch('public/form-builder');    }    /**     * 编辑模板消息     * @param $id     * @return mixed|\think\response\Json|void     */    public function edit($id)    {        if(!$id) return $this->failed('参数错误');        $userLevel = UserLevelModel::get($id);        if(!$userLevel) return Json::fail('数据不存在!');        $f = array();        $f[] = Form::input('level_name','等级名称',$userLevel->getData('level_name'))->required('不能为空');        $f[] = Form::input('ico','等级图标',$userLevel->getData('ico'));        $f[] = Form::number('level','等级',$userLevel->getData('level'))->min(0)->max(12);        $f[] = Form::number('integral','满足积分',$userLevel->getData('integral'))->min(0)->col(8);        $f[] = Form::number('monetary','消费金额',$userLevel->getData('monetary'))->min(0)->col(8);        $f[] = Form::number('orders','消费次数',$userLevel->getData('orders'))->min(0)->col(8);        $f[] = Form::number('discount','享受折扣',$userLevel->getData('discount'))->min(0)->max(20)->precision(2);        $f[] = Form::textarea('explain','等级说明',$userLevel->getData('explain'))->col(24);        $f[] = Form::radio('status','状态',$userLevel->getData('status'))->options([['value'=>1,'label'=>'开启'],['value'=>0,'label'=>'锁定']]);$form = Form::make_post_form('添加用户通知',$f,Url::build('update',array('id'=>$id)));        $form = Form::make_post_form('编辑会员等级',$f,Url::build('update',['id'=>$id]));        $this->assign(compact('form'));        return $this->fetch('public/form-builder');    }    public function update(Request $request, $id = null)    {        $data = Util::postMore([            ['level_name',''],            ['ico',''],            ['level',0],            ['integral',0],            ['monetary',0],            ['orders',0],            ['discount',0],            ['explain',''],            ['status',0],        ],$request);        if(!UserLevelModel::be(['id'=>$id])){            $res = UserLevelModel::create($data);            if($res) return Json::successful('添加成功!');            else return Json::fail('添加失败');        }else{            if(isset($id) && !empty($id))$res = UserLevelModel::edit($data,$id);            if($res) return Json::successful('修改成功!');            else return Json::fail('修改失败');        }    }}