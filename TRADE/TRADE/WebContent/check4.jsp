<%@ page language="java" import="java.sql.*"
	contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>检验商品删除界面</title>
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
	<%
			request.setCharacterEncoding("utf-8");
		   String thing=request.getParameter("thing");
	%>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/T2";
		String use = "root";
		String password = "aptx4869";
		Class.forName(driver);
		 Connection conn= DriverManager.getConnection(url,use,password);  
	    PreparedStatement sql =conn.prepareStatement("delete from trade where thing=?");
	    sql.setString(1,thing);
	    int total=sql.executeUpdate();
	    sql.close();
	    conn.close();
	%>
	<!-- 判断是否是正确的登录用户 -->
	<%
		if (total >= 1) {
	%>
			<jsp:forward page="tradeList.jsp" />
	<%
		} else if (total == 0) {
			out.println("删除失败");
		   response.setHeader("refresh", "2;url=tradeList.jsp");
		}
	%>
</body>
</html>