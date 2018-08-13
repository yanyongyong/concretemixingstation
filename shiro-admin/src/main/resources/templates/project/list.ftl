<#include "/layout/header.ftl"/>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="selectRoleLabel">分配资源权限</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm">
                        <div class="zTreeDemoBackground left">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/layout/footer.ftl"/>


<!--/添加角色弹框-->
<script>

    $(function () {
        var rolesId = $this.attr("data-id");
        $.ajax({
            async: false,
            type: "POST",
            data: {rid: rolesId},
            url: '/resources/resourcesWithSelected',
            dataType: 'json',
            success: function (json) {
                var data = json.data;
                console.log(data);
                var setting = {
                    check: {
                        enable: true,
                        chkboxType: {"Y": "ps", "N": "ps"},
                        chkStyle: "checkbox"
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    callback: {
                        onCheck: function (event, treeId, treeNode) {
                            console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                            var treeObj = $.fn.zTree.getZTreeObj(treeId);
                            var nodes = treeObj.getCheckedNodes(true);
                            var ids = new Array();
                            for (var i = 0; i < nodes.length; i++) {
                                //获取选中节点的值
                                ids.push(nodes[i].id);
                            }
                            console.log(ids);
                            console.log(rolesId);
                            $.post(options.saveRolesUrl, {"roleId": rolesId, "resourcesId": ids.join(",")}, function (obj) { }, 'json');
                        }
                    }
                };
                var tree = $.fn.zTree.init($("#treeDemo"), setting, data);
                tree.expandAll(true);//全部展开

                $('#selectRole').modal('show');
            }
        });
    });
</script>