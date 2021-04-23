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
<!-- 引入bootstrap 树 css、js文件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-treeview/bootstrap-treeview.min.css">
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<!-- 引入bootstrap  选项卡css、js文件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/bootStrap-addTabs/bootstrap.addtabs.css">
<script src="<%=request.getContextPath()%>/static/js/bootstrap/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">
	                            yhsx后台系统
	      </a>
	    </div>
	  </div>
	</nav>
	
	
	  <div class="container-fluid" style="margin-top:70px">
	   <div class="row">
		  <div class="col-md-2">
		    <div id="myTree"></div>
		  
		  </div>
		  <div class="col-md-10">
		       <div id="myTabs">
					<!-- 新选项卡 -->
					<ul class="nav nav-tabs" id="tablist">
					 <li role="presentation" class="active">
						<a href="#home" role="tab" data-toggle="tab">欢迎</a>
					 </li>
					</ul>
				
					<!-- 选项卡下内容 -->
					<div class="tab-content">
					 <div role="tabpanel" class="tab-pane active" id="home">
					 </div>
					</div>
				</div>
						      
		  
		  </div>
		 
		</div>
	  
 
     </div>

</body>

<script type="text/javascript">
   $(function(){
	   initTree();
	   
	   
   })
   function initTree(){
	       $.ajax({
	    	 url:"<%=request.getContextPath()%>/tree/queryTreeList",
	    	 type:"post",
	    	 success:function(data){

	    		  $('#myTree').treeview({
	    		   		data:data,
					    enableLinks : true,
	    		   		onNodeSelected:function(event, node) {
	    		   			if (node.url!=null&node.url!="") {
								$.addtabs({iframeHeight: 550});
								$.addtabs.add({
									id:node.id,
									title:node.text,
									url:"<%=request.getContextPath()%>"+node.url,
								});
							}

	    		         		
	    		      	}
	    		   });
	    		 
	    	 }
	    	   
	       })
	       
	     
	   
	   
	   
	   
	   
   }



</script>
</html>