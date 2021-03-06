<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>出库仓单列表</title>
	</head>
	<body onload="getFocus('id');"> 
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_cx">
							<form name="frm"
								action="${basePath}/stock/exitlist/stockListHxx.action?sortColumns=order+by+stockId&isQueryDB=true"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style" >
									<tr>
										<td class="table2_td_width" style="width: 100%">
											<div class="div2_top" style="margin-left: 0px">
												<table class="table3_style" border="0" cellspacing="0" 
													cellpadding="0" width="100%">
													<tr >
														<td class="table3_td_1" align="right">
															所属交易商：
															<label>
																<input id="id" type="text" class="input_text"  style="width:100px;"
																maxLength="<fmt:message key='ownerFirm_q' bundle='${PropsFieldLength}'/>" 
																	name="${GNNT_}primary.ownerFirm[allLike]"
																	value="${oldParams['primary.ownerFirm[allLike]'] }" />
															</label>
														</td>
														<td class="table3_td_1" align="right">
															仓单号：
															<label>
																<input type="text" class="input_text"  style="width:100px;"
																maxLength="<fmt:message key='stockId_q' bundle='${PropsFieldLength}'/>" 
																	name="${GNNT_}primary.stockId[=][String]"
																	value="${oldParams['primary.stockId[=][String]']}" />
															</label>
														</td>
														<td class="table3_td_1" align="right">
															仓库编号：
															<label>
																<input type="text" class="input_text"  style="width:100px;"
																maxLength="<fmt:message key='warehouseId_q' bundle='${PropsFieldLength}'/>"
																	name="${GNNT_}primary.warehouseId[allLike]"
																	value="${oldParams['primary.warehouseId[allLike]'] }" />
															</label>
														</td>
														<td class="table3_td_1" align="right">
															<button class="btn_sec" onclick=select1();>
																查询
															</button>
															&nbsp;&nbsp;
															<button class="btn_cz" onclick=myReset();>
																	重置
															</button>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="div_gn">
							
						</div>
						<div class="div_list" >
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
									<ec:table items="pageInfo.result" var="stock"
											action="${basePath}/stock/exitlist/stockListHxx.action?sortColumns=order+by+stockId&isQueryDB=true"
											autoIncludeParameters="${empty param.autoInc}"
											xlsFileName="stock.xls" csvFileName="stock.csv" 
											showPrint="true" listWidth="100%" minHeight="345" style="table-layout: fixed"
											>
										<ec:row>
											<ec:column width="7%" property="_0" title="序号" style="text-align:center;"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<ec:column property="stockId" width="5%" title="仓单号"
													style="text-align:left; ">
													<rightHyperlink:rightHyperlink href="#" className="blank_a" action="/stock/list/stockDetails.action" id="detail" text="<font color='#880000'>${stock.stockId}</font>" onclick="details(${stock.stockId})"/>
												</ec:column>
												<ec:column property="breedName" width="5%" title="品名"
													style="text-align:left; " ellipsis="true">
												</ec:column>
												<ec:column property="warehouseId" width="6%" title="仓库编号"
													style="text-align:left; " ellipsis="true">
												</ec:column>
												<ec:column property="quantity" width="8%" title="数量" style="text-align:right; " ellipsis="true">
												<fmt:formatNumber value="${stock.quantity}" pattern="#,##0.00" />(${stock.unit})
												</ec:column>
												<ec:column property="ownerFirm" width="8%" title="所属商"
													style="text-align:left; " ellipsis="true">
												</ec:column>
												<ec:column property="lastTime" width="12%" title="最后变更时间"
													style="text-align:center; ">
													<fmt:formatDate value="${stockList.lastTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												</ec:column>
												<ec:column property="createTime" width="12%" title="创建时间"
													style="text-align:center; ">
													<fmt:formatDate value="${stockList.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												</ec:column>
												<ec:column property="lastTime" width="12%" title="发货时间"
													style="text-align:center; ">
													<fmt:formatDate value="${stockList.lastTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
												</ec:column>
												<ec:column property="logisticsorder" width="9%" title="快递单号"
													style="text-align:center; " ellipsis="true">
													${stock.logisticsorder }
												</ec:column>
												<ec:column property="company" width="6%" title="快递公司"
													style="text-align:center; " ellipsis="true">
													${stock.company }
												</ec:column>
												<ec:column property="receivedDate" width="6%" title="收货时间"
													style="text-align:center; " ellipsis="true">
													${stock.receivedDate }
												</ec:column>
												<!-- 确认收货 -->
												<ec:column property="operate" width="9%" title="操作 " 
													style="text-align:center; "  sortable="false" filterable="false">
													<c:if test="${stock.received eq 0 }">
														<rightHyperlink:rightHyperlink href="#" className="blank_a" action="/stock/exitlist/stockConfirm.action" id="forward${stock.stockId}" 
														text="<font color='#880000'>确认收货
														</font>" onclick="stockConfirm('${stock.stockId}','${stock.invoiceStatus}');"/>
													</c:if>
													<c:if test="${stock.received eq 1 }">
														<rightHyperlink:rightHyperlink href="#" className="blank_a"  id="forward${stock.stockId}" 
														text="<font color='#880000'>已收货
														</font>"/>
													</c:if>
													<c:if test="${empty stock.received }">
														<rightHyperlink:rightHyperlink href="#" className="blank_a"  id="##" 
														text="<font color='#880000'>--
														</font>"/>
													</c:if>
												</ec:column>
												
												<%--<ec:column property="stockStatus" width="5%" title="Stock.stockStatus"
													style="text-align:center; " ellipsis="true">
													${stockStatusMap[stock.stockStatus] }
												</ec:column>--%>
											</ec:row>
										</ec:table>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>


			<!-- 编辑和过滤所使用的 通用的文本框模板 -->
			<textarea id="ecs_t_input" rows="" cols="" style="display: none">
		<input type="text" class="inputtext" value=""
					onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
					name="" /></textarea>

<SCRIPT type="text/javascript">
	
	function select1() {
		frm.submit();
	}
	function details(stockid){
		var a=document.getElementById("detail").action;
		var url="${basePath}"+a+"?isQueryDB=true&num=2&entity.stockId="+stockid;
		var result = showDialogRes(url, '', 800, 450);
	}
	/* 未修改的方法：确认收货 */
	function stockConfirm(stockid,invoiceStatus){
		if(invoiceStatus==0){
			var result = confirm("确定买家收到足够的货物了吗？点击确认将付清卖家尾款！");
		}else{
			var result = confirm("确定买家发票和足够的货物了吗？点击确认将付清卖家尾款！");
		}
		if(result){
			var a=document.getElementById("forward"+stockid).action;
			frm.action = "${basePath}"+a+"?stockId=" + stockid;
			frm.submit();
			//alert(${ReturnValue.result});
		}
		
		
		/* var a=document.getElementById("forward"+stockid).action;
		var url="${basePath}"+a+"?stockId="+stockid;
		if(confirm) */
		
		//document.location.href=url;
		/* var result = showDialogRes(url, '', 500, 400);
		if(result){
			select1();
		} */
	}
</SCRIPT>
	</body>
</html>