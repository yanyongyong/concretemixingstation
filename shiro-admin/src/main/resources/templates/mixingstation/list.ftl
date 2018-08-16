<#include "/layout/header.ftl"/>
<style>
    .el-table .warning-row {
        background: oldlace;
    }

    .el-table .success-row {
        background: #f0f9eb;
    }
</style>
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
                        <div id="MainSelect">
                            <div class="block">
                                <span class="demonstration">选择标段：</span>
                                <el-cascader expand-trigger="hover" :options="options" v-model="selectedOptions2" @change="handleChange">
                                </el-cascader>
                            </div>
                        </div>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="mixingstations:batchDelete">
                            <#--<button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">-->
                                <#--<i class="fa fa-trash-o"></i> 批量删除-->
                            <#--</button>-->
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
                    <template>
                        <el-table :data="tableData" border style="width: 100%">
                            <el-table-column prop="date" label="日期" width="180">
                            </el-table-column>
                            <el-table-column prop="name" label="姓名" width="180">
                            </el-table-column>
                            <el-table-column prop="address" label="地址">
                            </el-table-column>
                        </el-table>
                    </template>
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
            // modalName: "用户"
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
        //表格加载成功后触发
        $('#tablelist').on('load-success.bs.table', function (data) {
            var allTableData = $('#tablelist').bootstrapTable('getData');
            // detailTabel(allTableData[0].id);
        });
    });

    //点击事件
    $(function () {
        $('#tablelist').on('click-row.bs.table', function (e, row, element) {
            // $(element).css({"color":"blue","font-size":"16px;"});
            console.log(row);
            var allTableData = $('#tablelist').bootstrapTable('getData');
            console.log(allTableData);

        });
    })


    function detailTabel(id) {
        var detailsList = {
            url: "/mixingstation/detailList",
            columns: [
                {
                    checkbox: true
                }, {
                    field: 'diskCount',
                    title: '盘数',
                    editable: false,
                }, {
                    field: 'produceTime',
                    title: '生产时间',
                    editable: true,
                    formatter: function (code) {
                        return new Date(code).format("yyyy-MM-dd hh:mm:ss")
                    }
                }, {
                    field: 'uploadTime',
                    title: '上传时间',
                    editable: true,
                    formatter: function (code) {
                        return new Date(code).format("yyyy-MM-dd hh:mm:ss")
                    }
                }, {
                    field: 'stirTime',
                    title: '搅拌时间',
                    editable: true
                }, {
                    field: 'productionVolume',
                    title: '生产方量',
                    editable: false
                }]
        };
        var params = {
            mixProductionRecordsId:id
        };


        // $.tableUtilme.queryParams(params);
        $.tableUtilme.init(detailsList,'tablelistdetail');
    }




</script>


<script>


    var MainSelect = {
        data() {
            return {
                options: [{
                    value: 'zhinan',
                    label: '指南',
                    children: [{
                        value: 'shejiyuanze',
                        label: '设计原则',
                        children: [{
                            value: 'yizhi',
                            label: '一致'
                        }, {
                            value: 'fankui',
                            label: '反馈'
                        }, {
                            value: 'xiaolv',
                            label: '效率'
                        }, {
                            value: 'kekong',
                            label: '可控'
                        }]
                    }, {
                        value: 'daohang',
                        label: '导航',
                        children: [{
                            value: 'cexiangdaohang',
                            label: '侧向导航'
                        }, {
                            value: 'dingbudaohang',
                            label: '顶部导航'
                        }]
                    }]
                }, {
                    value: 'zujian',
                    label: '组件',
                    children: [{
                        value: 'basic',
                        label: 'Basic',
                        children: [{
                            value: 'layout',
                            label: 'Layout 布局'
                        }, {
                            value: 'color',
                            label: 'Color 色彩'
                        }, {
                            value: 'typography',
                            label: 'Typography 字体'
                        }, {
                            value: 'icon',
                            label: 'Icon 图标'
                        }, {
                            value: 'button',
                            label: 'Button 按钮'
                        }]
                    }, {
                        value: 'form',
                        label: 'Form',
                        children: [{
                            value: 'radio',
                            label: 'Radio 单选框'
                        }, {
                            value: 'checkbox',
                            label: 'Checkbox 多选框'
                        }, {
                            value: 'input',
                            label: 'Input 输入框'
                        }, {
                            value: 'input-number',
                            label: 'InputNumber 计数器'
                        }, {
                            value: 'select',
                            label: 'Select 选择器'
                        }, {
                            value: 'cascader',
                            label: 'Cascader 级联选择器'
                        }, {
                            value: 'switch',
                            label: 'Switch 开关'
                        }, {
                            value: 'slider',
                            label: 'Slider 滑块'
                        }, {
                            value: 'time-picker',
                            label: 'TimePicker 时间选择器'
                        }, {
                            value: 'date-picker',
                            label: 'DatePicker 日期选择器'
                        }, {
                            value: 'datetime-picker',
                            label: 'DateTimePicker 日期时间选择器'
                        }, {
                            value: 'upload',
                            label: 'Upload 上传'
                        }, {
                            value: 'rate',
                            label: 'Rate 评分'
                        }, {
                            value: 'form',
                            label: 'Form 表单'
                        }]
                    }, {
                        value: 'data',
                        label: 'Data',
                        children: [{
                            value: 'table',
                            label: 'Table 表格'
                        }, {
                            value: 'tag',
                            label: 'Tag 标签'
                        }, {
                            value: 'progress',
                            label: 'Progress 进度条'
                        }, {
                            value: 'tree',
                            label: 'Tree 树形控件'
                        }, {
                            value: 'pagination',
                            label: 'Pagination 分页'
                        }, {
                            value: 'badge',
                            label: 'Badge 标记'
                        }]
                    }, {
                        value: 'notice',
                        label: 'Notice',
                        children: [{
                            value: 'alert',
                            label: 'Alert 警告'
                        }, {
                            value: 'loading',
                            label: 'Loading 加载'
                        }, {
                            value: 'message',
                            label: 'Message 消息提示'
                        }, {
                            value: 'message-box',
                            label: 'MessageBox 弹框'
                        }, {
                            value: 'notification',
                            label: 'Notification 通知'
                        }]
                    }, {
                        value: 'navigation',
                        label: 'Navigation',
                        children: [{
                            value: 'menu',
                            label: 'NavMenu 导航菜单'
                        }, {
                            value: 'tabs',
                            label: 'Tabs 标签页'
                        }, {
                            value: 'breadcrumb',
                            label: 'Breadcrumb 面包屑'
                        }, {
                            value: 'dropdown',
                            label: 'Dropdown 下拉菜单'
                        }, {
                            value: 'steps',
                            label: 'Steps 步骤条'
                        }]
                    }, {
                        value: 'others',
                        label: 'Others',
                        children: [{
                            value: 'dialog',
                            label: 'Dialog 对话框'
                        }, {
                            value: 'tooltip',
                            label: 'Tooltip 文字提示'
                        }, {
                            value: 'popover',
                            label: 'Popover 弹出框'
                        }, {
                            value: 'card',
                            label: 'Card 卡片'
                        }, {
                            value: 'carousel',
                            label: 'Carousel 走马灯'
                        }, {
                            value: 'collapse',
                            label: 'Collapse 折叠面板'
                        }]
                    }]
                }, {
                    value: 'ziyuan',
                    label: '资源',
                    children: [{
                        value: 'axure',
                        label: 'Axure Components'
                    }, {
                        value: 'sketch',
                        label: 'Sketch Templates'
                    }, {
                        value: 'jiaohu',
                        label: '组件交互文档'
                    }]
                }],
                selectedOptions: [],
                selectedOptions2: []
            };
        },
        methods: {
            handleChange(value) {
                console.log(value);
            }
        }
    };
    var Ctor = Vue.extend(MainSelect)
    new Ctor().$mount('#MainSelect')


    var Main = {
        data() {
            return {
                tableData: [{
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-08',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-06',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-07',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }]
            }
        }
    }
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
