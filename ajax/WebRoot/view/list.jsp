<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-3.3.1.min.js"></script></head>
  <script type="text/javascript">
    $(function(){
      
   queryList();
   });
   function queryList(){
   var n = $("#aa").val();
   $.ajax({
           url:"<%=basePath%>demo!queryList.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"text", // 期待返回值类型
           data:{"stu.name":n},//传送的数据 
           async:true, //是否开启异步加载
           success:function(data){  //成功回调函数
                 $("#dd").html(data);
           },
           error:function(){//失败回调函数
           alert("请求失败");
           }
         });
   }
  </script>
  <body>
       姓名：<input type="text" id="aa"><br>
       年龄：<input type="text" id="cc" ><br>
    <input type="button" value="搜索" onclick="queryList()">
   <div id="dd"></div>
  </body>
</html>
