<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/my.js">
	
</script>
</head>

<body class="main" onload="startSecond();">

<%@include file="/WEB-INF/pages/head.jsp"%>
<%@include file="/WEB-INF/pages/menu_search.jsp" %>
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98px"><img
								src="${pageContext.request.contextPath}/static/images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000">帐户激活成功</font><br /> <br />
								<a href="index.html"><span id="second" style="color: red;">5</span>秒后自动为您转跳回登录页面</a></td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>



	<jsp:include page="/WEB-INF/pages/foot.jsp"/>


</body>
</html>
