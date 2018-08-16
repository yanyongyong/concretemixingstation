

/**
 * 光标选中事件
 */
function addHoverDom(treeId, treeNode) {
    var aObj = $("#" + treeNode.tId + "_a");
    if ($("#diyBtn_"+treeNode.id).length>0) return;
    var editStr = "<span class='button add' id='diyBtn_" +treeNode.id+ "'onfocus='this.blur();> </span>"
        + "<button type='button' class='diyBtn1' title='"+treeNode.name+"' '></button>";
    aObj.append(editStr);
    var btn = $("#diyBtn_"+treeNode.id);
    if (btn) btn.bind("click", function(){
        var zTree = $.fn.zTree.getZTreeObj("treeProject");
        // zTree.addNodes(treeNode, {id:4, pId:treeNode.id, name:treeNode.name+"—分支"});
        zTree.addNodes(treeNode, {pId:treeNode.id, name:treeNode.name+"—分支"}); //页面上添加节点
        // var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点
        // zTree.selectNode(node); //让新添加的节点处于选中状态
        var data = {"parentId":treeNode.id,"name":treeNode.name+"—分支"};
        yyAjax("/project/add",data,"添加成功","添加失败");
        alert("diy Button for " + treeNode.name);
    });
};

/**
 * 光标移开事件
 * @param treeId
 * @param treeNode
 */
function removeHoverDom(treeId, treeNode) {
    $("#diyBtn_"+treeNode.id).unbind().remove();
    $("#diyBtn_space_" +treeNode.id).unbind().remove();
}


/**
 *删除前触发
 */
function beforeRemove(treeId, treeNode) {
    if (treeNode.isParent) {
        toastr.warning("请先删除子节点");
        return false;
    }
    return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}

/**
 * 删除事件
 * @param event
 * @param treeId
 * @param treeNode
 */
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

/**
 * 编辑事件
 * @param event
 * @param treeId
 * @param treeNode
 * @param isCancel
 */
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

function yyAjax(url,data,successMessage,errorMessage) {
    $.ajax({
        url:url,    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        data:data,    //参数值
        type:"GET",   //请求方式
        success:function(data){
            if (data == "成功")toastr.success(successMessage);
            toastr.success(errorMessage);
        },
        error:function(){
            toastr.success(errorMessage);
        }
    });
}