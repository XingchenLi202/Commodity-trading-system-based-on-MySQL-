<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>检验商品提交页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
   <br>
   <%
   request.setCharacterEncoding("utf-8");
   String thing=request.getParameter("thing");
   String number=request.getParameter("number");
   String price =request.getParameter("price");
   %>
   <% 
    String driver = "com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://localhost:3306/T2"; 
    String use = "root";  
    String password = "aptx4869";  
    Class.forName(driver);  
    Connection conn= DriverManager.getConnection(url,use,password);  
    PreparedStatement sql =conn.prepareStatement("insert into trade(thing,number,price)values(?,?,?)");
    sql.setString(1,thing);
    sql.setString(2,number); 
    sql.setString(3,price);
    int rtn=sql.executeUpdate();
    sql.close();
    conn.close();
    %> 
    <!-- 判断是否是正确的登录用户 -->
	<%
		if (rtn >= 1) {
	%>
	<jsp:forward page="tradeList.jsp" />
	<%
		} else if (rtn == 0) {
			System.out.println("添加失败！");
		}
	%>  
  </body>
</html>
