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
                        addHoverDom: addHoverDom,
                        removeHoverDom: removeHoverDom
                    },
                    edit: {
                        enable: true,
                        removeTitle:"删除",
                        renameTitle:"修改",
                        showRemoveBtn:true,
                        showRenameBtn:true
                        // addHoverDom: addHoverDom,
                        // removeHoverDom: removeHoverDom,
                    },
                    data: {
                        simpleData: {
                            enable:true,
                        }
                    },
                    callback: {
                        onClick: zTreeOnClick, //单击事件
                        beforeRemove: beforeRemove,
                        onRename: zTreeOnRename,
                        onRemove: zTreeOnRemove
                    }
                };
                var tree = $.fn.zTree.init($("#treeProject"), setting, data);
                console.log(tree);
                // tree.expandAll(true);//全部展开
            }
        });
    });

    // var newCount = 1;

//     function addHoverDom(treeId, treeNode) {
//         var sObj = $("#" + treeNode.tId + "_span");
//         var addBtn = $("#addBtn_" + treeNode.tId)
//         if (treeNode.editNameFlag || addBtn.length > 0) return;
//         var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='新增' onfocus='this.blur();'></span>";
//
//         sObj.after(addStr);
//         var btn = $("#addBtn_" + treeNode.tId);
//
//         if (btn) btn.bind("click", function() {
// //		var zTree = $.fn.zTree.getZTreeObj("ztree1");
//             var name = "新增节点" + (newCount++);
//             $.post('addClassification.action', {
//                 'classification.perId': treeNode.id,
//                 'classification.classification': name
//             }, function(data, textStatus, xhr) {
//                 /*optional stuff to do after success */
//                 if (textStatus == "success") {
//                     var newID = data;
//                     zTreeObj.addNodes(treeNode, {
//                         id: newID,
//                         pId: treeNode.id,
//                         name: name
//                     });
//                     var node = zTreeObj.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
//                     zTreeObj.selectNode(node); //让新添加的节点处于选中状态+
//                 } else {
//                     toastr.error("加载错误");
//                 }
//             });
//
//             return false;
//         });
//     }

    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    }

    // function addHoverDom(treeId, treeNode) {
    //     var sObj = $("#" + treeNode.tId + "_span"); //获取节点信息
    //     if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    //     var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>"; //定义添加按钮
    //     sObj.after(addStr); //加载添加按钮
    //     var btn = $("#addBtn_"+treeNode.tId);
    //
    //     //绑定添加事件，并定义添加操作
    //     if (btn) btn.bind("click", function(){
    //         var zTree = $.fn.zTree.getZTreeObj("treeProject");
    //         zTree.addNodes(treeNode, {id:newID, pId:treeNode.id, name:name}); //页面上添加节点
            //将新节点添加到数据库中
            // var name='NewNode';
            // $.post('./index.php?r=data/addtree&pid='+treeNode.id+'&name='+name,function (data) {
            //     var newID = data; //获取新添加的节点Id
            //     zTree.addNodes(treeNode, {id:newID, pId:treeNode.id, name:name}); //页面上添加节点
            //     var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
            //     zTree.selectNode(node); //让新添加的节点处于选中状态
            // });
        // });
    // };

    function addHoverDom(treeId, treeNode) {
        var aObj = $("#" + treeNode.tId + "_a");
        if ($("#diyBtn_"+treeNode.id).length>0) return;
        var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' > </span>"
                + "<button type='button' class='diyBtn1' id='diyBtn_" + treeNode.id
                + "' title='"+treeNode.name+"' onfocus='this.blur();'></button>";
        aObj.append(editStr);
        var btn = $("#diyBtn_"+treeNode.id);
        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeProject");
                zTree.addNodes(treeNode, {id:4, pId:treeNode.id, name:treeNode.name}); //页面上添加节点
                var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
                zTree.selectNode(node); //让新添加的节点处于选中状态
            alert("diy Button for " + treeNode.name);
        });
    };

    function removeHoverDom(treeId, treeNode) {
        $("#diyBtn_"+treeNode.id).unbind().remove();
        $("#diyBtn_space_" +treeNode.id).unbind().remove();
    };

    function zTreeOnClick() {
         // alert("00000");
     }

    function beforeRemove(treeId, treeNode) {
        if (treeNode.isParent) {
            toastr.warning("请先删除子节点");
            return false;
        }
        return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
    }

    function zTreeOnRemove(event, treeId, treeNode) {
        $.post('deleteNode.action', {
            'classification.id': treeNode.id,
        }, function(data, textStatus, xhr) {
            // optional stuff to do after success
            if (textStatus == "success") {
                toastr.success("删除成功");
            } else {
                toastr.error("删除失败");
            }
        });
    }

    function zTreeOnRename(event, treeId, treeNode, isCancel) {
        console.log(treeId);
        // $.post('updateNode.action', {
        //     'classification.id': $.trim(treeNode.id),
        //     'classification.perId': $.trim(treeNode.pId),
        //     'classification.classification': treeNode.name
        // }, function(data, textStatus, xhr) {
        //     /*optional stuff to do after success */
        //     if (textStatus == "success") {
        //         toastr.success("修改成功");
        //     } else {
        //         toastr.error("修改失败");
        //     }
        // });
    }

</script>