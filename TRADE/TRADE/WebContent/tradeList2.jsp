<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.bzu.dao.tradeDAO,cn.edu.bzu.entity.trade,java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}
</style>

<title>小卖场</title>
</head>
<body>
	<script language="javascript" type="text/javascript">
		function change(productNumber) {
			var value;
			var value2;
			if(productNumber==1) {
				value = parseInt(value2 = prompt("请输入购买数量："));
				if(isNaN(value2)) {
					alert("请输入数字！");
				}checkValue(value, productNumber);
			}else if(productNumber==2) {
				value = parseInt(prompt("请输入购买数量："));
				checkValue(value, productNumber);
			}else if(productNumber==3) {
				value = parseInt(prompt("请输入购买数量："));
				checkValue(value, productNumber);
			}else if(productNumber==4) {
				value = parseInt(prompt("请输入购买数量："));
				checkValue(value, productNumber);
			}
		};
		function checkValue(value, productNumber) {
			if(isNaN(value)) {
				return false;
			}else {
				window.location.href = "update2.jsp?para="+value+"&productNumber="+productNumber;
			}
		};
		function ChatRoom() {
				window.location.href = "ChatRoom.jsp";
		};
    </script>
	<table border="1" align="center">
		<caption>小卖场</caption>
		<tr>
			<td align="center">thing</td>
			<td align="center">number</td>
			<td align="center">price</td>
		</tr>
		<%
			tradeDAO dao = new tradeDAO();
			List<trade> list = dao.readFirstTitle();
			for (trade tl : list) {
		%>
		<tr>
			<td><%=tl.getThing()%></td>
			<td><%=tl.getPrice()%></td>
			<td><%=tl.getNumber()%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<tr><a href="#" onclick="change(1)"><img 
					src="http://img3.99114.com/group1/M00/ED/C0/wKgGMFkTDi2AdtHoAALkOaA9lpQ254_600_600.jpg" />
			</a></tr>
			<tr><a href="#" onclick="change(2)"><img 
					src="http://img2.imgtn.bdimg.com/it/u=404527339,3129376999&fm=26&gp=0.jpg" />
			</a></tr>
			<tr><a href="#" onclick="change(3)"><img 
					src="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3974330728,791969883&fm=26&gp=0.jpg "/>
			</a></tr>
			<tr><a href="#" onclick="change(4)"><img 
					src="http://img3.imgtn.bdimg.com/it/u=2059924591,3709043736&fm=26&gp=0.jpg" />
			</a></tr>
			<tr><a href="#" onclick="change(5)"><img 
					src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=14256267,2822599701&fm=26&gp=0.jpg" />
			</a></tr>
			<tr><a href="#" onclick="change(6)"><img 
					src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2878363950,3708696848&fm=26&gp=0.jpg" />
			</a></tr>
		</tr>	
	</table>
	<table  align="center">
		<tr>
	<td><input type="button" onclick="ChatRoom()" value="联系卖家" /></td>
	</tr>
	</table>
</body>
</html>