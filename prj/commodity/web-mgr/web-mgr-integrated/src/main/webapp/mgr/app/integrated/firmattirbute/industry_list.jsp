<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>
	<head>
		<title>行业维护列表</title>
	</head>
	<body  onload="getFocus('code');">
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_cx">
							<form name="frm"
								action="${basePath}/mfirmAttribute/mainTenance/industryList.action?sortColumns=order+by+sortNo"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table5_td_width">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td class="table3_td_1" align="left">
															行业编号:&nbsp;
															<label>
																<input type="text" class="input_text" id="code"
																	name="${GNNT_}primary.code[allLike]" 
																	value="${oldParams['primary.code[allLike]'] }" maxLength="<fmt:message key='code_q' bundle='${PropsFieldLength}'/>"/>
															</label>
														</td>
														<td class="table3_td_1" align="left">
															是否可选择:&nbsp;
															<label>
																<select id="isvisibal" name="${GNNT_}primary.isvisibal[=][String]"  class="normal" style="width: 120px">
																	<option value="">全部</option>
																	<c:forEach items="${isvisibalMap}" var="map">
																		<option value="${map.key }">${map.value }</option>
																	</c:forEach>
																	
																</select>
															</label>
															 <script >
																frm.isvisibal.value = "<c:out value='${oldParams["primary.isvisibal[=][String]"] }'/>"
					  										</script>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onclick=select1();
>
																查询
															</button>
															&nbsp;&nbsp;
															<button class="btn_cz" onclick=
	myReset();
>
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
						<rightButton:rightButton name="添加" onclick="addIndustry();"
								className="anniu_btn" action="/mfirmAttribute/mainTenance/addForwardIndustry.action" id="add"></rightButton:rightButton>
						&nbsp;&nbsp;
							<rightButton:rightButton name="删除" onclick="deleteIndustrys()" className="anniu_btn" action="/mfirmAttribute/mainTenance/deleteIndustrys.action" id="deletes"></rightButton:rightButton>
						</div>
						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="pageInfo.result" var="industry"
											action="${basePath}/mfirmAttribute/mainTenance/industryList.action?sortColumns=order+by+sortNo"											
											autoIncludeParameters="${empty param.autoInc}"
											xlsFileName="industry.xls" csvFileName="industry.csv"
											showPrint="true" listWidth="100%"
											minHeight="345"  style="table-layout:fixed;">
											<ec:row>
												<ec:column cell="checkbox" headerCell="checkbox" alias="ids"
													style="text-align:center; " value="${industry.code}"
													width="5%" viewsAllowed="html" />
												<ec:column width="5%" property="_0" title="序号"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<ec:column property="code" width="10%" title="行业编号"
													style="text-align:left;">
													<rightHyperlink:rightHyperlink href="#" className="blank_a" action="/mfirmAttribute/mainTenance/updateForwardIndustry.action" id="detail" text="<font color='#880000'>${industry.code}</font>" onclick="return update('${industry.code}');"/>
												</ec:column>
												<ec:column property="name" title="行业名称" width="10%"
													style="text-align:left;"  ellipsis="true">
												</ec:column>
												<ec:column property="isvisibal" title="是否可选择" width="10%"
													style="text-align:left;"  ellipsis="true">
													<c:set var="key">
														<c:out value="${industry.isvisibal}" />
													</c:set>
													${isvisibalMap[key]}
												</ec:column>
												<ec:column property="sortNo" title="排序号" width="10%"
													style="text-align:left;"  ellipsis="true">
												</ec:column>
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
					name="" />
	</textarea>


<SCRIPT type="text/javascript">
	function addIndustry(){
	var a=document.getElementById('add').action;
		var url = "${basePath}"+a;
		if(showDialog(url, "", 650, 350)){
			frm.submit();
		};
	}
	//修改行业信息
	function update(id){
		var a=document.getElementById("detail").action;
		var url = "${basePath}"+a+"?entity.code="+id;
		if(showDialog(url, "", 650, 350)){
			frm.submit();
		};
	}
	//修改行业是否可选择
	function updateIsvisibal(id,value){
		var valid =affirm("您确定要进行行业【"+value+"】的操作？")
		if(valid){
			var url = "${basePath}/mfirmAttribute/mainTenance/updateIsvisibalIndustry.action?entity.code="+id;
			frm.action =url;
			frm.submit();
		}
	}
	function deleteIndustry(id){
		var  valid=affirm("您确认要删除？");
		if(valid){
			var a=document.getElementById('delete').action;
			var url = "${basePath}"+a+"?entity.code="+id;
			frm.action=url;
			frm.submit();
		}
	}
	function deleteIndustrys(){
		var a =document.getElementById('deletes').action;
	  	var url="${basePath}"+a+"?autoInc=false";
	  	var collCheck=document.getElementsByName("ids");
	  	deleteEcside(collCheck,url);
	}
	function select1() {
		frm.submit();
	}
</SCRIPT>
	</body>
</html>