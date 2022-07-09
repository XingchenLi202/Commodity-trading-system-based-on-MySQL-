<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<!-- 连接数据库 -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/T2"
		user="root" password="aptx4869" />
<title>修改数据</title>
</head>
<body>
	<!-- 接收CommodityList.jsp传来的参数value -->
	
	<%
		String para = request.getParameter("value");
	%>
	<script type="text/javascript">
		
	</script>
	<!-- 修改表中单元格数据 -->
	<c:set var="SiteId" value="3" />
	<sql:update dataSource="${db}" var="count">
  		UPDATE trade SET number = 30 WHERE thing = ?;
  	<sql:param value="${SiteId}" />
	</sql:update>
	<!-- 遍历表 -->
	<sql:query dataSource="${db}" var="rs">
		SELECT * from trade;
	</sql:query>
	<table>
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td><c:out value="${row.thing}" /></td>
				<td><c:out value="${row.price}" /></td>
				<td><c:out value="${row.number}" /></td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>
