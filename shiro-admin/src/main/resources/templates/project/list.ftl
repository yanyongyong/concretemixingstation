<#include "/layout/header.ftl"/>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">项目管理</li>
        </ol>
        <div class="x_panel">
            <div class="x_content">
                <h4 class="modal-title" id="selectRoleLabel">项目管理</h4>
                <div class="left">
                    <ul id="treeProject" class="ztree"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/layout/footer.ftl"/>


<!--/添加角色弹框-->
<script>
    $(function () {
        $.ajax({
            async: false,
            type: "POST",
            url: '/project/tree',
            dataType: 'json',
            success: function (json) {
                var data = json.data;
                var setting = {
                    view: {
                        addHoverDom: addHoverDom,//光标选中事件
                        removeHoverDom: removeHoverDom
                    },
                    edit: {
                        enable: true,
                        removeTitle:"删除",
                        renameTitle:"修改",
                        showRemoveBtn:true,
                        showRenameBtn:true
                    },
                    data: {
                        simpleData: {
                            enable:true,
                        }
                    },
                    callback: {
                        beforeRemove: beforeRemove,
                        onRename: zTreeOnRename,
                        onRemove: zTreeOnRemove
                    }
                };
                var tree = $.fn.zTree.init($("#treeProject"), setting, data);
                tree.expandAll(true);//全部展开
            }
        });
    });
</script>
<script src="/assets/js/yy.ztree.js"></script>