<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<script type="text/javascript">
/* 
 * 参数1:递减或者递增后的购买数量
      参数2：对应商品的库存量
      备注： 购买数量和库存量要笔记
     参数3： 对应商品的id
   备注： 购买的商品数量发生变化，购物车map中对应的内容要修改
 */

function changeProductNum(buyNum,pnum,id){ 
	var buyNum1=  parseInt(buyNum);
	var pnum1=  parseInt(pnum);
	
	if(buyNum1<0){
		alert("至少购买一件商品!");
		buyNum1=1;
	}
	
	if(buyNum1>pnum1){
		alert("库存量不足!");
		buyNum1=pnum1;
	}
	window.location.href="UpdateCartNumServlet?id="+id+"&buyNum="+buyNum1;
}

/* 处理购买数量输入的内容 */
function HanldeInputNum(){
	/* 获取输入的数量内容 */
	var inputNum = document.getElementById("inputNum");
	alert(inputNum.value);
	/*获取输入的数量跟库存量比较
	      1. 超过库存量，直接弹窗提示，并且把购买数量改成最大存库
	      2. 在库存量的范围内，跳转到UpdateCartNumServlet去修改购物车存储的数
	*/
}
</script>


</head>

<body class="main">

	<jsp:include page="/WEB-INF/pages/head.jsp" />

	<jsp:include page="/WEB-INF/pages/menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td><img src="images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="30%">商品名称</td>
													<td width="10%">价格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%">库存</td>
													<td width="10%">小计</td>
													<td width="10%">取消</td>
												</tr>
											</table> 
											
												<table width="100%" border="0" cellspacing="0">
												<!--  varStatus="vs":  表示遍历的状态
												    vs.count:计数，从1开始
												    vs.index 索引  从1开始
												    vs.first  是否是第一个
												    vs.last  是否是最后一个
												   -->
												<c:forEach var="item" items="${cart}" varStatus="vs">
													<tr>
														<td width="10%">${vs.count}</td>
														<td width="30%">${item.key.name }</td>

														<td width="10%">${item.key.price }</td>
														<td width="20%"><input type="button" value='-'
															style="width:20px"
															onclick="changeProductNum('${item.value-1}','${item.key.pnum}','${item.key.id}')">

															<input name="text" type="text" value="${item.value}"
															 id="inputNum"
															style="width:40px;text-align:center"  onblur="HanldeInputNum()"/>
															 <input
															type="button" value='+' style="width:20px"
															onclick="changeProductNum('${item.value+1}','${item.key.pnum}','${item.key.id}')">

														</td>
														<td width="10%">${item.key.pnum}</td>
														<td width="10%">${item.key.price*item.value}</td>

														<td width="10%"><a href="${pageContext.request.contextPath}/DeleteCartShopServlet?id=${item.key.id}"
															style="color:#FF0000; font-weight:bold">X</a></td>
													</tr>
													<%-- 
													示例：类似于：
													int sum=0;
													for(int i=0;i<10;i++){
													   sum+=i;
													
													   }
													
													sum综合
													 --%>
													 <!--  声明一个变量sum，value是赋值，每次累加每个商品的价格总和-->
													<c:set var="sum" value="${sum+item.key.price*item.value}"></c:set>
													</c:forEach>
												</table>
												


											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${sum}元</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
												<a
													href="${pageContext.request.contextPath}/showProductByPage"><img
													src="images/gwc_jx.gif" border="0" /> </a>

												&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}/order.jsp"><img
													src="images/gwc_buy.gif" border="0" /> </a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="/WEB-INF/pages/foot.jsp" />


</body>
</html>
