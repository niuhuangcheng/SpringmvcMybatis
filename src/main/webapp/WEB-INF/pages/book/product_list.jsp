<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<script type="text/javascript">

function ShowShopInfo(id){
	//alert(id+"------"+arguments[0]);
	//EL表达式等价于域对象调用findAttribute(name);  java代码
	//相对地址和绝对地址
	 window.location.href="FindShopByIdServlet?id="+id; 
}

</script>
</head>

<body class="main">

<%@include file="/WEB-INF/pages/head.jsp"%>
<%@include file="/WEB-INF/pages/menu_search.jsp" %>

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align: right; margin: 5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${pageBean.category==null ? "全部商品目录":pageBean.category}&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${pageBean.category==null ?"全部商品目录": pageBean.category}</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${pageBean.totalCount }种商品
								<hr />
								<div style="margin-top: 20px; margin-bottom: 5px">
									<img src="images/productlist.gif" width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach var="bean" items="${pageBean.list}">
											<td>

												<div class="divbookpic">
													<p>
														<a href="javascript:void(0);" onclick="ShowShopInfo('${bean.id}')">
														<img src="${bean.imgurl}"
															width="115" height="129" border="1" /> </a>
													</p>
												</div>

												<div class="divlisttitle">
													<a href="javascript:void(0);" onclick="ShowShopInfo('${bean.id}')">书名:${bean.name}<br />售价:${bean.price }
													</a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>

								<div class="pagination">
									<ul>
        	                            <li class="disablepage"><a href='${pageContext.request.contextPath}/showProductByPage?pageNo=${pageBean.pageNo== 1? 1:pageBean.pageNo-1}&pageSize=4&category=${pageBean.category}'>上一页&lt;&lt;</a>&lt;&lt;</li>
        	                            
        	                            <c:forEach begin="${pageBean.startPos}" end="${pageBean.endPos}" 
        	                            var="i"  step="1">
        	                             <c:if test="${pageBean.pageNo==i}">
        	                             <li class="currentpage">${i}</li>
        	                             </c:if>
        	                             <c:if test="${pageBean.pageNo!=i}">
        	                             <li><a href="${pageContext.request.contextPath}/showProductByPage?pageNo=${i}&pageSize=4&category=${pageBean.category}">${i}</a></li>
        	                             </c:if>
        	                            </c:forEach>
										<li>第${pageBean.pageNo}页/共${pageBean.totalPage}页</li>
										<li class="nextpage"><a href="${pageContext.request.contextPath}/showProductByPage?pageNo=${pageBean.pageNo== pageBean.totalPage?pageBean.pageNo:pageBean.pageNo+1}&pageSize=4&category=${pageBean.category}">下一页&gt;&gt;</a>
										</li>

									</ul>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



<jsp:include page="/WEB-INF/pages/foot.jsp"/>


</body>
</html>
