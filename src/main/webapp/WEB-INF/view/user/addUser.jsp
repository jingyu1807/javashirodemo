<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .row{
       margin-bottom:10px
    }
  
</style>

</head>
<body>
   <div style="width:550px">
		 <form id="myForm">
			 <input type="hidden" name="id" id="id" >
		  <div class="row">
		   <div  class="col-md-2">
		      <label >姓名</label>
		    </div>
		    <div  class="col-md-4">
		      <input type="text" class="form-control" id="name" name="sname">
		    </div>
		   </div>
		 <div class="row">
		   <div  class="col-md-2">
		      <label >性别</label>
		    </div>
		    <div  class="col-md-4">
		    <label class="radio-inline">
        	  <input type="radio" name="sex"  value="1"> 男
        	</label>
        	<label class="radio-inline">
        	  <input type="radio" name="sex"  value="2">女
        	</label>
		    </div>
		    <div  class="col-md-2">
		      <label >生日</label>
		    </div>
		    <div  class="col-md-4">
		      <input type="text" class="form-control date" id="birthday" name="birthday">
		    </div>
		  </div> 
		  <div class="row">
		   <div  class="col-md-2">
		      <label >密码</label>
		    </div>
		    <div  class="col-md-4">
		      <input type="password" class="form-control" id="spassword" name="spassword">
		    </div>
		  </div>

			 <div class="row">
				 <div  class="col-md-2">
					 <label >学校</label>
				 </div>
				 <div  class="col-md-4">
					 <select name="schoolId" id="schoolId">
					 </select>
				 </div>
			 </div>
	  </form>
 </div>


</body>
<script type="text/javascript">
$(function(){
	querySchool()
	$('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  format: 'yyyy-mm-dd HH:mm:ss ',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 });

   })



  function querySchool(){
	$.ajax({

			url:"<%=request.getContextPath()%>/student/querySchool",
			success:function(data){
              //alert(data)
				var op = "<option value='0'>请选择</option>";
				for(var i=0;i<data.length;i++){

					op += "<option value='"+data[i].id+"'>"+data[i].schoolName+"</option>";
				}
				$("#schoolId").html(op);
			},
			error:function(){


			}
	})


  }




</script>
</html>