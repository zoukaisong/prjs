<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK"%>
<html>
	<head>
		<LINK REL="stylesheet" type="text/css" href="<c:url value="/timebargain/styles/common.css"/>" />
		<c:import url="/timebargain/statquery/customerID_change.jsp"/>
		<c:import url="/timebargain/common/date.jsp"/>
		<script language="VBScript" src="<c:url value="/timebargain/scripts/vbfunction.vbs"/>"></script>
		<title>
		</title>
		<script type="text/javascript"> 
function window_onload()
{
    highlightFormElements();
 //   statQueryForm.groupID.focus();
    query_onclick();
}
//query_onclick
function query_onclick()
{
if(statQueryForm.isQryHis.checked)
{
  if(statQueryForm.beginDate.value=="")
  {
    alert("开始日期不能为空！");
    statQueryForm.beginDate.focus();
    return false;
  }
  if(statQueryForm.endDate.value=="")
  {
    alert("结束日期不能为空！");
    statQueryForm.endDate.focus();
    return false;
  }
  if(!isDateFormat(statQueryForm.beginDate.value))
  {
    alert("开始日期格式不正确！");
    statQueryForm.beginDate.focus();
    return false;
  }
  if(!isDateFormat(statQueryForm.endDate.value))
  {
    alert("结束日期格式不正确！");
    statQueryForm.endDate.focus();
    return false;
  }

  var day = new Date();
  var Year = 0;
  var Month = 0;
  var Day = 0;
var CurrentDate = "";
  Year       = day.getFullYear();
  Month      = day.getMonth()+1;
  Day        = day.getDate();   
  CurrentDate += Year + "-";
  if (Month >= 10 )
  {
   CurrentDate += Month + "-";
  }
  else
  {
   CurrentDate += "0" + Month + "-";
  }
  if (Day >= 10 )
  {
   CurrentDate += Day ;
  }
  else
  {
   CurrentDate += "0" + Day ;
  }
  var begin = statQueryForm.beginDate.value;
  var end = statQueryForm.endDate.value;
  var b = begin.replace("","-");
  var e = end.replace("","-");
  var c = CurrentDate.replace("","-");
	if(c < b){
		alert("开始日期大于当前日期！");
		return false;
	}
	if(c < e){
		alert("结束日期大于当前日期！");
		return false;
	}
	if(e < b){
		alert("结束日期小于开始日期！");
		return false;
	}
}
  wait.style.visibility = "visible";
  statQueryForm.submit();
  statQueryForm.query.disabled = true;  
}
//requery_onclick
function requery_onclick()
{
  top.MainFrame.location.href = "<c:url value="/timebargain/statquery/holdPosition.jsp"/>";
}
function isQryHis_onclick()
{
  if(statQueryForm.isQryHis.checked)
  {
    setReadWrite(statQueryForm.beginDate);
    setReadWrite(statQueryForm.endDate);
    statQueryForm.isQryHis.value = true;
  }
  else
  {
    setReadOnly(statQueryForm.beginDate);
    setReadOnly(statQueryForm.endDate);
    statQueryForm.isQryHis.value = false;
  }
  statQueryForm.isQryHisHidd.value = statQueryForm.isQryHis.value;
}
</script>
	</head>

	<body leftmargin="6" topmargin="0" onLoad="return window_onload()"
		onkeypress="keyEnter(event.keyCode);">
		<c:import url="/timebargain/common/waitbar.jsp" charEncoding="GBK"/>
		<table border="0" height="100%" width="100%" cellpadding="0" cellspacing="0" class="common" align="center">
			<tr>
				<td>
					<html:form action="/timebargain/statquery/statQuery.do?funcflg=listHoldPosition"
						method="POST" styleClass="form" target="ListFrame">
						<fieldset class="pickList" >
							<legend class="common">
								<b>查询条件
								</b>
							</legend>
							<table border="0" align="center" cellpadding="0" cellspacing="0"
								class="common" width="80%">

								<tr>
									<td align="right">
											二级代码：
									</td>
									<td>
										<input type="text" id="customerID" name="_a.CustomerID[=]" style="width:111" maxlength="16" title=""
											styleClass="text" />
									</td>
			                        <td align="right"><label>&nbsp;&nbsp;买卖：</label></td>
			                        <td>
				                        <select id="BS_Flag" name="_a.BS_Flag[=]" style="width:111">
				                          <option value="">全部</option>
				                          <option value="1">买</option>
					                      <option value="2">卖</option>
			                            </select>
			                        </td>
			                        <td align="right">
											商品代码：
									</td>
									<td>
										<input type="text" id="uni_Cmdty_Code" name="_a.commodityid[like]" title="可输入模式匹配符查询" style="width:111" maxlength="24"
											styleClass="text" />
									</td>	
									
									<td align="right">
											交易商代码：
									</td>
									<td>
										<input type="text" id="firmID" name="_a.firmID[=]" style="width:111" maxlength="16" title=""
											styleClass="text" />
									</td>
									<td></td>
			                        	                           																	
								</tr>
								<tr>
			                        <td></td>	
									<td>
			                            <input type="checkbox" name="isQryHis" id="isQryHis" onclick="isQryHis_onclick()" value="false" class="NormalInput"/><label for="isQryHis" class="hand">查历史</label>
										<input type="hidden" id="isQryHisHidd" name="_isQryHis[=]" value="false">
			                        </td>	
									<td align="right">
										开始日期：
									</td>
									<td>
										<input type="text" id="beginDate" name="_ClearDate[>=][date]" ondblclick="if(!this.readOnly){setRq(this);}" value="<c:out value='${lastDay}'/>" title="双击选择日期" readonly="true" styleId="beginDate" maxlength="10" style="ime-mode:disabled;width:111" onkeypress="return numberPass()" class="ReadOnlyString"/>
									</td>
									<td align="right">
										结束日期：
									</td>
									<td>
										<input type="text" id="endDate" name="_ClearDate[<=][datetime]" ondblclick="if(!this.readOnly){setRq(this);}" value="<c:out value='${lastDay}'/>" title="双击选择日期" readonly="true" styleId="endDate" maxlength="10" style="ime-mode:disabled;width:111" onkeypress="return numberPass()" class="ReadOnlyString"/>
									</td>	
									<td align="right">
											交易商类别：
									</td>
									<td>
										<select name="_m.firmCategoryId[=]" id="firmCategoryId">
											<option value="">全部</option>
											<c:forEach items="${firmCategoryList }" var="result">
												<option value="${result.id}">${result.name}</option>
											</c:forEach>
										</select>
									</td>
									<td align="left">
										<html:button property="query" style="width:60" styleClass="button"
											onclick="javascript:return query_onclick();">
											查询
										</html:button>
										<html:reset property="reset" style="width:60" styleClass="button">
											重置
										</html:reset>
									</td>
									<td></td>
									<td></td>																		
								</tr>
							</table>
						</fieldset>
					</html:form>
				</td>
			</tr>
		</table>

		<%@ include file="/timebargain/common/messages.jsp"%>
	</body>
</html>
