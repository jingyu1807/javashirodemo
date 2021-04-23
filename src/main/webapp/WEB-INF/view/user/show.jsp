<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入jquery js文件 -->
<script src="<%=request.getContextPath()%>/static/js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap3/css/bootstrap.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap3/js/bootstrap.js"></script>
<!-- 引入table js、css文件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-table/bootstrap-table.css">
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<!-- 引入日期 js、css文件 -->
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<!-- 引入bootbox 弹框 -->
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-bootbox/bootbox.js"></script>
<!-- 引入图片 弹框 -->
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-fileinput/js/locales/zh.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-fileinput/css/fileinput.css">
</head>
<body>
 <div id="toolbar">
   <form class="form-inline">
			  <div class="form-group">
                  <label >用户名</label>
                  <input type="text" class="form-control" id="sname" >
              </div>
       <div class="form-group">
           <%--<label >生日</label>--%>
			  <%--<input type="text" class="form-control date" id="sdate">-- <input type="text" class="form-control date" id="edate">--%>
			  </div>
			  <button type="button" onclick="searchUser()"  class="btn btn-info glyphicon glyphicon-search">搜索</button>
			  <button type="button" onclick="openAdd()"  class="btn btn-warning glyphicon glyphicon-plus">新增</button>
			  <button type="button" onclick="delUser()"  class="btn btn-danger glyphicon glyphicon-minus">批量删除</button>
   </form>
 </div>

  <table  class="table" id="myTable"></table>

</body>
<script type="text/javascript">
$(function(){
	
	initUserTable();
	$('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  format: 'yyyy-mm-dd ',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 });
   })
   
   //打开修改弹框
   function openUpdate(id){
	bootbox.dialog({
		title:'修改用户信息',
	    message: createAddContent("<%=request.getContextPath()%>/menu/toAdd"),
	    closeButton: true,
	    buttons : {
	        "success" : {
	            "label" : "<i class='glyphicon glyphicon-fire'></i> 保存",
	            "className" : "btn-sm btn-success",
	            "callback" : function() {
	            	$.ajax({
	            		url:'<%=request.getContextPath()%>/student/saveStudent',
	            		type:'post',
	            		data:$("#myForm").serialize(),
	            		dataType:'json',
	            		success:function(data){
	            			$('#myTable').bootstrapTable('refresh');
	            		}
	            	}); 
		        }
	        },
	        "cancel" : {
	            "label" : "<i class='icon-info'></i> 取消",
	            "className" : "btn-sm btn-danger",
	            "callback" : function() {
	            	
	             }
	         }
	      }

	   });



       //querySchool()

	
	//修改回显
	 $.ajax({
		  url:"<%=request.getContextPath() %>/student/queryStudentById",
		  type:"post",
		  data:{"id":id},
		  success:function(data){
			 //alert(data.birthday)
			 $("#id").val(data.id);
			 $("#birthday").val(data.birthday);
			 $("#name").val(data.sname);
			 $("#spassword").val(data.spassword);
			 $("#schoolId").val(data.schoolId);
			 $("input[name='sex']").each(function(){
				 var sexId=$(this).val();
				 if(sexId==data.sex){
					 $(this).prop("checked",true)
				 }
			    })
			    //回显图片
			    //uploadImg(data.head_img)
				  }

		   })
 

  }
   
   
   
   
   //图片
   <%--function uploadImg(url){--%>
	<%--$('#headImg').fileinput({--%>
		<%--//初始化 预览：图片http地址--%>
		<%--initialPreview:url,--%>
		<%--//初始化图片配置：--%>
				<%--initialPreviewConfig: [--%>
		   	        <%--{key: 1, showDelete: false}--%>
				 <%--],--%>
		<%--//是否初始化图片显示--%>
		<%--initialPreviewAsData: true,--%>

		<%--language: 'zh', //设置语言--%>
		<%--uploadUrl: '<%=request.getContextPath()%>/user/uploadUserImg.do', //上传的地址--%>
		<%--allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀--%>
		<%--showUpload: true, //是否显示上传按钮--%>
		<%--showCaption: false,//是否显示标题--%>
		<%--browseClass: "btn btn-primary", //按钮样式 --%>
		<%--//dropZoneEnabled: false,//是否显示拖拽区域--%>
		<%--//minImageWidth: 50, //图片的最小宽度--%>
		<%--//minImageHeight: 50,//图片的最小高度--%>
		<%--//maxImageWidth: 1000,//图片的最大宽度--%>
		<%--//maxImageHeight: 1000,//图片的最大高度--%>
		<%--//maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小--%>
		<%--//minFileCount: 0,--%>
		<%--maxFileCount: 2, //表示允许同时上传的最大文件个数--%>
		<%--enctype: 'multipart/form-data',--%>
		<%--validateInitialCount:true,--%>
		<%--previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",--%>
		<%--msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",--%>
		<%----%>
	<%--}).on('fileuploaded', function(event, data, previewId, index) {--%>
		<%--var imgval = $('#testimg').val();--%>
		<%--if(imgval == null || imgval == "" || imgval == undefined){--%>
			<%--imgval = "http://<%= request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"+data.response;--%>
		<%--}else{--%>
			<%--imgval += ","+"http://<%= request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"+data.response;--%>
		<%--}--%>
		<%--$('#testimg').val(imgval);--%>
	<%--});--%>
	
	
    <%--}--%>
   
   
   var res;
	function createAddContent(url){
		$.ajax({
			url:url,
			async:false,
			success:function(data){
				res = data;
			}
		});
		return res;
	}



  //打开新增
  function openAdd(){
	
	bootbox.dialog({
		title:'添加用户信息',
	    message: createAddContent("<%=request.getContextPath()%>/menu/toAdd"),
	    closeButton: true,
	    buttons : {
	        "success" : {
	            "label" : "<i class='glyphicon glyphicon-fire'></i> 保存",
	            "className" : "btn-sm btn-success",
	            "callback" : function() {
	            	$.ajax({
	            		url:'<%=request.getContextPath()%>/student/saveStudent',
	            		type:'post',
	            		data:$("#myForm").serialize(),
	            		//dataType:'json',
                        success:function(data){

                            bootbox.alert({
                                size: "small",
                                title: "提示",
                                message: data,
                                buttons: {
                                    ok: {
                                        label: '确定',
                                        className: 'btn-success'
                                    }
                                },

                                callback: function(){ /* your callback code */ }
                            })

                            $('#myTable').bootstrapTable('refresh');
	            		},error:function(XMLHttpRequest, textStatus, errorThrown){
                            // $("#p_test").innerHTML = "there is something wrong!";
                            // alert(XMLHttpRequest.status);
                            // alert(XMLHttpRequest.readyState);
                            // alert(textStatus);
                            $('#myTable').bootstrapTable('refresh');

                        }
	            	});

	            	 }
	        },
	        "cancel" : {
	            "label" : "<i class='icon-info'></i> 取消",
	            "className" : "btn-sm btn-danger",
	            "callback" : function() {
	            	
	            }
	        }
	    }
	    
	});


	
}
  
  


   //批量删除
   function delUser(){
	
	bootbox.confirm({ 
		  size: "small",
		  message: "是否确认删除?", 
		  buttons: {
		        confirm: {
		            label: '确定',
		            className: 'btn-success'
		        },
		        cancel: {
		            label: '取消',
		            className: 'btn-danger'
		        }
		    },	  
		  callback: function(result){ 
			  if(result){
				  var arr=$('#myTable').bootstrapTable("getSelections");
					var ids="";
					for(var i=0;i<arr.length;i++){
						//alert(arr[i].id);
						if(ids==""){
							ids += arr[i].id;
						}else{
							ids += ","+arr[i].id;
						}
					}
					alert(ids)
					
		 $.ajax({ 
					
				  url:"<%=request.getContextPath() %>/student/deleteAll",
				  type:"post",
				  data:{"ids":ids},
				  success:function(){
				  	bootbox.alert({ 
						  size: "small",
						  title: "提示",
						  message: "删除成功", 
						  buttons: {
						        ok: {
						            label: '确定',
						            className: 'btn-success'
						        }
						    },
						
						  callback: function(){ /* your callback code */ }
						})
						  	searchUser();
						  },error:function(){
						  	alert("删除失败");
						  	
						    }
				        })      
			  }
			  
		  }
		})
		
	
}



 //条件查询
  function searchUser(){
	 $('#myTable').bootstrapTable("refresh");//刷新表格
	
  }

   


//列表展示

  function initUserTable(){
	
   $('#myTable').bootstrapTable({
	toolbar:'#toolbar',
	url:'<%=request.getContextPath()%>/student/queryStudent',//获取数据地址
	pagination:true, //是否展示分页
	pageList:[5, 10, 20, 50],//分页组件
	pageNumber:1,
	pageSize:5,//默认每页条数
	search:true,//是否显示搜索框
	//searchText:'试试',//初始化搜索文字
	   //showColumns:false,//是否显示 内容列下拉框
	   //showToggle:false,//是否显示 切换试图（table/card）按钮
	   //showPaginationSwitch:false,//是否显示 数据条数选择框
	   //showRefresh:false,//是否显示刷新按钮
	   //detailView:false,//设置为 true 可以显示详细页面模式。
	   //showFooter:false,//是否显示列脚
	clickToSelect: true, //是否启用点击选中行
	sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
    dataField:'student',
    striped:true,
	queryParams:function(){
		var name=$("#sname").val()
			var sdate=$("#sdate").val()
			var edate=$("#edate").val()
		
		return {
			page: this.pageNumber,
			rows: this.pageSize,
		     sname:name,
		     sdate:sdate,
		     edate:edate,
			};
	},
	columns:[
			{field:'check',checkbox:true},//显示复选框   field：字段必须唯一，不能重复
			{field:'id',title:'ID'},
			{field:'sname',title:'学生姓名'},
		    {field:'schoolName',title:'学校'},
		    {field:'level',title:'学生等级'},
			{field:'sex',title:'性别',formatter:function(value,row,index){
				if(value==1){
					return"男";
				}else if(value==2){
					return"女";
				}
			}},
			{field:'birthday',title:'生日'},
			// {field:'head_img',title:'头像',formatter:function(value,row,index){
			// 	  return "<img width='50px' height='50px' src='"+value+"'>";
			// }},
			//{field:'cityName',title:'市名称'},
			//{field:'proName',title:'省名称'},
			{field:'tools',title:'操作',width:100,align:'center',formatter:function(value,row,index){
				 
				  //var str = "<a href='javascript:deleteUser("+row.id+")'>删除</a>";
                    var str=" <a href='javascript:openUpdate("+row.id+")'>修改</a>";
				  return str;
			}}
          ]
     })
}

   function deleteUser(id){

   }



</script>
</html>