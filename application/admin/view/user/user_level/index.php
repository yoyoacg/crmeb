{extend name="public/container"}
{block name="content"}
<div class="layui-fluid">
    <div class="layui-row layui-col-space15"  id="app">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">会员等级列表</div>
                <div class="layui-card-body">
                    <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-sm" onclick="$eb.createModalFrame(this.innerText,'{:Url('create')}')">添加会员等级</button>
                    </div>
                    <table class="layui-hide" id="List" lay-filter="List"></table>


                    <script type="text/html" id="act">
                        <button type="button" class="layui-btn layui-btn-xs" onclick="dropdown(this)">操作 <span class="caret"></span></button>
                        <ul class="layui-nav-child layui-anim layui-anim-upbit">

                            <li>
                                <a href="javascript:;"  onclick="$eb.createModalFrame('编辑','{:Url('edit')}?id={{d.id}}')"><i class="fa fa-paste"></i> 编辑</a>
                            </li>

                            <li>
                                <a href="javascript:;" lay-event='warning'><i class="fa fa-warning"></i> 删除</a>
                            </li>
                        </ul>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
{/block}
{block name="script"}
<script>
    layList.tableList('List',"{:Url('index')}",function (){
        return [
            {field: 'id', title: '编号', sort: true,event:'id'},
            {field: 'level_name', title: '等级名称'},
            {field: 'ico', title: '图标'},
            {field: 'level', title: '等级'},
            {field: 'integral', title: '满足积分'},
            {field: 'monetary', title: '消费金额'},
            {field: 'orders', title: '消费次数'},
            {field: 'discount', title: '折扣'},
            {field: 'explain', title: '说明'},
            {field: 'right', title: '操作',align:'center',toolbar:'#act',width:'10%'},
        ];
    });
    //下拉框
    $(document).click(function (e) {
        $('.layui-nav-child').hide();
    })
    function dropdown(that){
        var oEvent = arguments.callee.caller.arguments[0] || event;
        oEvent.stopPropagation();
        var offset = $(that).offset();
        var top=offset.top-$(window).scrollTop();
        var index = $(that).parents('tr').data('index');
        $('.layui-nav-child').each(function (key) {
            if (key != index) {
                $(this).hide();
            }
        })
        if($(document).height() < top+$(that).next('ul').height()){
            $(that).next('ul').css({
                'padding': 10,
                'top': - ($(that).parents('td').height() / 2 + $(that).height() + $(that).next('ul').height()/2),
                'min-width': 'inherit',
                'position': 'absolute'
            }).toggle();
        }else{
            $(that).next('ul').css({
                'padding': 10,
                'top':$(that).parents('td').height() / 2 + $(that).height(),
                'min-width': 'inherit',
                'position': 'absolute'
            }).toggle();
        }
    }
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'send':
                var url =layList.U({c:'user.user_notice',a:'send',p:{id:data.id}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                            obj.update({is_send:1,send_time:'{:date("Y-m-d H:i:s",time())}'});
                        }else
                            return Promise.reject(res.data.msg || '发送失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                },{
                    title:"您确定要发送这条信息吗",
                    text:"发送后将无法修改通知信息，请谨慎操作！",
                    confirm:"是的，我要发送！",
                    cancel:"让我再考虑一下"
                })
                break;
            case 'warning':
                window.t = $(this);
                var _this = obj,url =layList.U({a:'delete',p:{id:data.id}});
                $eb.$swal('delete',function(){
                    $eb.axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            $eb.$swal('success',res.data.msg);
                            _this.del();
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        $eb.$swal('error',err);
                    });
                })
                break;
        }
    })
    $('.head_image').on('click',function (e) {
        var image = $(this).data('image');
        $eb.openImage(image);
    })
</script>
{/block}
