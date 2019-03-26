<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>bookStore注册页面</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" />
<script type="text/javascript">
	function changeImage() {

		document.getElementById("img").src = "${pageContext.request.contextPath}/kaptcha";

	}
</script>
</head>


<body class="main">
<%@include file="/WEB-INF/pages/head.jsp"%>
<%@include file="/WEB-INF/pages/menu_search.jsp" %>

	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/user/doRegister"
			method="post">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>新会员注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${register_error_msg}</font></h1>
						
						<table width="90%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">会员邮箱：</td>
								<td style="width:40%">
								<input type="text" class="textinput"
									name="email"  value="${error_user.email }"/></td>
								<td><font color="red">${register_msg.email_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right">会员名：</td>
								<td>
									<input type="text" class="textinput" name="username" 
									value="${error_user.username }"/>
								</td>
								<td><font color="red">${register_msg.username_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right">密码：</td>
								<td><input type="password" class="textinput"
									name="password" 
									value="${error_user.password }"/></td>
								<td><font color="red">${register_msg.password_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right">重复密码：</td>
								<td><input type="password" class="textinput"
									name="repassword"
value="${error_user.repassword }"/></td>
								<td><font color="red">${register_msg.repassword_msg}</font></td>
							</tr>
							<tr>
							<!-- 单选和多选中如果要回显默认状态，使用三目运算符，其中只写值，而且值用引号引起来 -->
								<td style="text-align:right">性别:</td>
								<td>&nbsp;&nbsp;<input type="radio" 
									name="gender" value="男" ${error_user.gender=='男'? 'checked':''} /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="女" ${error_user.gender=='女'?  'checked':''}/> 女</td>
									<td><font color="red">${register_msg.gender_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right">联系电话：</td>
								<td ><input type="text" class="textinput"
									style="width:350px" name="telephone"
									value="${error_user.telephone}" /></td>
								<td><font color="red">${register_msg.telephone_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right">个人介绍：</td>
								<td>
								<textarea class="textarea" name="introduce">${error_user.introduce}</textarea>
								</td>
								<td><font color="red">${register_msg.introduce_msg}</font></td>
							</tr>

						</table>



						<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">输入校验码：</td>
								<td style="width:50%"><input type="text" class="textinput" name="code"
								 value="${error_user.code}" />
								</td>
								<td><font color="red">${register_msg.code_msg}</font></td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img
									src="${pageContext.request.contextPath}/kaptcha" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>



						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center"><input
									type="image" src="${pageContext.request.contextPath}/static/images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="${pageContext.request.contextPath}/static/images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; eShop All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div>


</body>
</html>
