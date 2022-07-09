<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@page import="cn.edu.bzu.dao.tradeDAO,cn.edu.bzu.entity.trade,java.util.List"%>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script
	src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>	
<script>  
/*function isValid(form)  
{  
if (form.thing.value=="")  
 {  
 alert("商品名不能为空！");  
 return false;  
 }  
if (form.number.value=="")  
{  
alert("数量不能为空！");  
return false;  
}
else if (form.price.value=="")  
{  
alert("价格不能为空！");  
return false;  
}  
else return true;  
}*/
 /*插入记录 */
function popInsert() {
	$(document).ready(function() {
		$("#layer").show();
	});
}
/* 更新记录 */
function popUpdate() {
	$(document).ready(function() {
		$("#layer2").show();
	});
}
/* 删除记录 */
function popDelete() {
	var thing = prompt("请输入您要删除的产品？");
	if(!isNaN(parseInt(thing))) {  // isNaN(NaN) == true
		window.location.href = "check4.jsp?thing="+thing;
	}else {
		return false;
	}
}
/* 关闭插入记录的表单 */
function closeForm() {
	$(document).ready(function() {
		$("#layer").hide();
	});
}
/* 关闭更新记录的表单 */
function closeForm2() {
	$(document).ready(function() {
		$("#layer2").hide();
	});
}
/* 检查表单是否填满 */
function checkIfEmpty() {
	for(var i=0;i<document.paper.elements.length-1;i++)  // elements 集合可返回包含表单中所有元素的数组
    {
       if(document.paper.elements[i].value=="")
       {
          alert("当前表单不能有空项");
          document.paper.elements[i].focus();
          return false;
       }
    }
}
/* AJAX刷新页面 */
$("#window2").submit(function() {
	alert("开始刷新界面");
	parent.layer.close(index); //再执行关闭
	$.ajax({
		async: false, // 同步
		type: "POST",
		url: '${pageContext.request.contextPath}/check5.jsp',  // ${pageContext.request.contextPath}是JSP取得绝对路径的方法，也就是取出当前的项目名称	
		data: $("#window2").serialize(),  // 发送给服务器的数据
		contentType: "application/x-www-form-urlencoded; charset=utf-8",  // 发送信息至服务器时内容编码类型，第一个参数表明为key/value类型
		dataType: "text",  // 预期服务器返回的数据类型
		success: function(msg) { // 请求成功后的回调函数
			
		},
		error: function(msg) { // 请求失败时调用此函数
			alert("请求失败");
		}
	})
})
</script>

</head>
<body>
<table border="1" align="center">
	<tr>
           <td>thing</td>
           <td>number</td>
           <td>price</td>
       </tr>
         <%
            tradeDAO dao=new tradeDAO();
            List<trade> list =dao.readFirstTitle();    
            for(trade tl:list)
            {%>
           <tr>
               <td><%=tl.getThing() %></td>         
               <td><%=tl.getPrice() %></td>
                <td><%=tl.getNumber() %></td>
           </tr>
             <%}
        %>
   </table>
   
 <center>
   <body bgcolor="#e3e3e3">
  <h2>商品</h2>
<table>
<!-- 功能窗口 -->
	<table>
		<tr><td><input type="button" onclick="popInsert()" value="添加" /></td></tr>
		<tr><td><input type="button" onclick="popUpdate()" value="更新" /></td></tr>
		<tr><td><input type="button" onclick="popDelete()" value="删除" /></td></tr>
	</table>

  <!-- 新增商品记录弹窗 -->
  <div id="layer" style="display: none;">
		<form id="window" name="paper" action="check3.jsp" method="post"
			onSubmit="return checkIfEmpty()">
			<table align="center">
				<tr><td>商品：</td>
					<td><input type="text" name="thing" /></td></tr>
				<tr><td>数量：</td>
					<td><input type="text" name="number" /></td></tr>
				<tr><td>价格：</td>
					<td><input type="text" name="price" /></td></tr>
				<tr><td><input type="submit" value="添加" /></td>
					<td><input type="reset" value="重置" /></td>
					<td><input type="button" onclick="closeForm()" value="关闭" /></td>
				</tr>
			</table>		
		</form>
	</div>
	<!-- 更新商品记录弹窗 -->
	<div id="layer2" style="display: none;">
		<form id="window2">
			<table align="center">
				<tr>
					<td>商品：</td>
					<td><input type="text" name="thing2" /></td>
				</tr>
				<tr>
					<td>数量：</td>
					<td><input type="text" name="number2" /></td>
				</tr>
				<tr>
					<td>价格：</td>
					<td><input type="text" name="price2" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="更新" /></td>
					<td><input type="reset" value="重置" /></td>
					<td><input type="button" onclick="closeForm2()" value="关闭" /></td>
				</tr>
			</table>
		</form>
	</div>
</form>
  </center>
   <br>   
</body>
</html>