<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  		 function sendajax(){
    var  aname = $("#a").val();
    var age = $("#b").val();
      $.ajax({
           url:"<%=basePath%>demo!test1.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"text", // 期待返回值类型
           data:{"name":aname,"age":age},//传送的数据 
           async:true, //是否开启异步加载
           success:function(one){  //成功回调函数
                  alert(one);
           },
           error:function(){//失败回调函数
           }
         });
         }
         
         function getajax(){
      $.ajax({
           url:"<%=basePath%>demo!test2.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"text", // 期待返回值类型
           async:true, //是否开启异步加载
           success:function(aaa){  //成功回调函数
                // alert(typeof(aaa));
            //   var o = eval("("+aaa+")");
               var o =  JSON.parse(aaa);
                 //alert(typeof(o));
                 $("#c").val(o.name);
                $("#d").val(o.age);
           },
           error:function(){//失败回调函数
           }              
         });   
    }
    
        function getlist(){
      $.ajax({
           url:"<%=basePath%>demo!test3.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"json", // 期待返回值类型
           async:true, //是否开启异步加载
           success:function(aaa){ //成功回调函数
             var table = "<table border='1'>"+
                        "<tr>"+
                        "<td>id</td>"+
                        "<td>name</td>"+
                        "<td>age</td>"+
                        "</tr>";
                        
            for ( var i = 0; i < aaa.length; i++) {
				//alert(aaa[i].name+""+aaa[i].age)
				 table += "<tr>"+
				        "<td>"+aaa[i].id+"</td>"+
                        "<td>"+aaa[i].name+"</td>"+
                        "<td>"+aaa[i].age+"</td>"+
                        "</tr>";
			}
			 table += "</table>";
			 $("#div").html(table);
           },
           error:function(){//失败回调函数
           }              
         });   
    }
     function appendq(){
      $.ajax({
           url:"<%=basePath%>demo!test3.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"json", // 期待返回值类型
           success:function(aaa){ //成功回调函数
             var b = "";
            for ( var i = 0; i < aaa.length; i++) {
				//alert(aaa[i].name+""+aaa[i].age)
				 b += "<tr>"+
				        "<td>"+aaa[i].id+"</td>"+
                        "<td>"+aaa[i].name+"</td>"+
                        "<td>"+aaa[i].age+"</td>"+
                        "</tr>";
			}
			 $("#a2").append(b);
           },
           error:function(){//失败回调函数
           }              
         });   
    }
    
    function jsptz(){
      $.ajax({
           url:"<%=basePath%>demo!tset4.action",   //配置请求的路径
           type:"post",//请求方式  默认get
           dataType:"text", // 期待返回值类型
           success:function(b){ //成功回调函数
			 $("#jspd").html(b);
           },
                       
         });   
    }
  </script>
  <body>
    姓名：<input id="a" type="text">
    年龄：<input id="b" type="text"><br>
     <input value="发送ajax请求" type="button" onclick="sendajax()">
     -----------------------------------------------><br>
     姓名：<input id="c" >
    年龄：<input id="d" >
    
     <input value="回显" onclick="getajax()" type="button"><br>
     -----------------------------------------------><br>
     <input value="查询表格数据" onclick="getlist()" type="button">
     <div id="div"></div>
     <input value="追加表格数据" onclick="appendq()" type="button">
     <table border="1" id="a2">
     		<tr>
     			<td>id</td>
     			<td>姓名</td>
     			<td>年龄</td>
     		</tr>
     </table>
     -----------------------------------------------><br>
     <input value="获取jsp页面" onclick="jsptz()" type="button">
     <div id="jspd"></div>
  </body>
</html>
