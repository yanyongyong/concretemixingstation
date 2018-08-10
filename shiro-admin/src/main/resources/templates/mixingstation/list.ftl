<#include "/layout/header.ftl"/>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">用户管理</li>
        </ol>
        <div class="x_panel  ">
            <div class="x_content">
                <div class="<#--table-responsive-->">
                    <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="mixingstations:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增用户">
                            <i class="fa fa-plus"></i> 新增用户
                        </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="mixingstations:batchDelete">
                            <button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">
                                <i class="fa fa-trash-o"></i> 批量删除
                            </button>
                        </@shiro.hasPermission>
                    </div>
                    <table id="tablelist">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="x_panel">
            <h2>生产明细</h2>
            <div class="x_content">
                <div class="<#--table-responsive-->">
                    <table id="tablelistdetail">
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="x_panel">
            <h2>生产明细</h2>
            <div class="x_content">
                <div class="<#--table-responsive-->" id="app">
                    <table id="tablelistvolume">
                        <#--<tr>-->
                            <#--<td>-->
                                <#--ID-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--圈主ID-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--耗卡-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--开房数-->
                            <#--</td>-->
                        <#--</tr>-->
                        <#--<tr v-for="item in items">-->
                            <#--<td>-->
                                <#--{{item.id}}-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--{{item.hid}}-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--{{item.haoka}}-->
                            <#--</td>-->
                            <#--<td>-->
                                <#--{{item.kaifa}}-->
                            <#--</td>-->
                        <#--</tr>-->
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/layout/footer.ftl"/>

<script>
    $(function () {
        var options = {
            url: "/mixingstation/list",
            // getInfoUrl: "/user/get/{id}",
            // updateUrl: "/user/edit",
            // removeUrl: "/user/remove",
            // createUrl: "/user/add",
            // saveRolesUrl: "/user/saveUserRoles",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'projectName',
                    title: '项目名',
                    editable: false,
                }, {
                    field: 'tenders',
                    title: '标段',
                    editable: true
                }, {
                    field: 'lineNumber',
                    title: '生产线编号',
                    editable: true
                }, {
                    field: 'designStrength',
                    title: '设计强度',
                    editable: true
                }, {
                    field: 'constructionSite',
                    title: '施工部位',
                    editable: false
                }, {
                    field: 'productionVolume',
                    title: '生产方量',
                    editable: false
                }, {
                    field: 'operate',
                    title: '操作',
                    // formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
            modalName: "用户"
        };
        var detail  = {
            url: "/mixingstation/list",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'projectName',
                    title: '项目名',
                    editable: false,
                }, {
                    field: 'tenders',
                    title: '标段',
                    editable: true
                }, {
                    field: 'lineNumber',
                    title: '生产线编号',
                    editable: true
                }, {
                    field: 'designStrength',
                    title: '设计强度',
                    editable: true
                }, {
                    field: 'constructionSite',
                    title: '施工部位',
                    editable: false
                }, {
                    field: 'productionVolume',
                    title: '生产方量',
                    editable: false
                }, {
                    field: 'operate',
                    title: '操作',
                    // formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
            modalName: "用户"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);
        $.tableUtilme.init(options,'tablelistdetail');
        $.tableUtilme.init(options,'tablelistvolume');

    });
</script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            items: [
                {id: "1" , hid: "123" , haoka: "12414" , kaifa: "454454"},
                {id: "1" , hid: "123" , haoka: "12414" , kaifa: "454454"},
                {id: "1" , hid: "123" , haoka: "12414" , kaifa: "454454"},
                {id: "1" , hid: "123" , haoka: "12414" , kaifa: "454454"},
            ]
        }
    })
</script>