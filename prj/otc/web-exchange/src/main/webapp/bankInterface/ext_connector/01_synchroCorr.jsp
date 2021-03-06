<%@ page contentType="text/html;charset=GBK" %>
<jsp:directive.page import="java.util.Date"/>
<%@ include file="../globalDef.jsp"%>
<%@ include file="../session.jsp"%>

<%
	BankDAO dao = BankDAOFactory.getDAO();
	String firmID = request.getParameter("firmID");
	//System.out.println("***01_synchroCorr****************1****"+firmID);
	CorrespondValue corr = new CorrespondValue();
	if(firmID.length()>0){
		//System.out.println("***01_synchroCorr****************2****"+firmID);
		FirmValue firmValue = dao.getFirm(firmID);
		corr.firmID = firmValue.firmID;
		corr.cardType = firmValue.cardType;
		corr.card = firmValue.card;
		corr.contact = firmValue.contact;
		corr.name = firmValue.firmName;
	}
	String bankIdAndUrls[][]={
	{"006","../ext_connector/ext_hxb_006/firmUserList.jsp"},
	{"013","../ext_connector/ext_ccb_013/firmUserList.jsp"},
	{"015","../ext_connector/ext_ccb_015/firmUserList.jsp"}
	};
	String sql=" and bankid in (";
	String BankUrl="";
	for(int i=0;i<bankIdAndUrls.length;i++){
		sql+="'"+bankIdAndUrls[i][0]+"',";
		BankUrl+=bankIdAndUrls[i][0]+","+bankIdAndUrls[i][1]+";";
	}
		sql=sql.substring(0,sql.length()-1);
		sql+=")";
	
%>
<html xmlns:MEBS>
  <head>
	<META http-equiv="Content-Type" content="text/html; charset=GBK">
	<script language="javascript" src="../lib/tools.js"></script>
    <title>查看和发起预签约信息</title>
  </head>
  
  <body style="overflow-y: hidden">
  	<form id="frm" action="" method="post">
	<div style="overflow:auto;height:355;">
	 <table border="0" width="95%" align="center">
		<tr>
		  <td>
			<div class="st_title"><img src="<%=skinPath%>/cssimg/st_ico1.gif" width="43" height="40" align="absmiddle" />&nbsp;查看和发起预签约信息</div>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="35" class="st_bor">
				<tr>
					<td align="right" width="110">&nbsp;</td>
					<td align="left" width="100">
						<input type="hidden" name="firmID" value="<%=firmID%>" class="input_text" maxlength="10" style="width: 140px">
						<input type="hidden" name="firmContact" value="<%=Tool.delNull(corr.contact)%>" class="input_text" maxlength="10" style="width: 140px">
					</td>
				</tr>
				<tr height="35" id="contactFalg">
					<td align="right"><%=CONTACTTITLE%>：&nbsp;</td>
					<td align="left">
						<input name="contact" disabled='disabled' readonly value="<%=Tool.delNull(corr.contact)%>" type=text  class="input_text" maxlength="10" style="width: 140px">
					</td>
				</tr>
				<tr height="35" id="frimNameFlag">
					<td align="right">名称：&nbsp;&nbsp;</td>
					<td align="left">
						<input name="frimName" disabled='disabled' readonly value="<%=Tool.delNull(corr.name)%>" type=text  class="input_text" maxlength="10" style="width: 140px">
					</td>
				</tr>
				<tr height="35">
					<td align="right">签约银行：&nbsp;</td>
					<td align="left">
						<%
						Vector bankList = dao.getBankList(sql);
						%>
						<select onblur="myblur('bankID');" id="bankID" name="bankID" class="normal" style="width:140px"  >
								 <option value="">请选择银行</option> 
							<%
							for(int i=0;i<bankList.size();i++){
								BankValue bank = (BankValue)bankList.get(i);
								%>
								<option value="<%=bank.bankID%>" ><%=bank.bankName%></option>
								<%
							}
							%>
						</select>
					</td>
					<td><div id="bankIDTip" class=""></div></td>
					<td><font color='#FF0000'>(仅有列出的银行支持此功能)</font></td>
				</tr>
				<tr height="35" id="cardTypeFlag">
					<td align="right">证件类型：&nbsp;</td>
					<td align="left">
						<select id="cardType" name="cardType" disabled="disabled"  style="width: 140px">
							<option value="">其他证件</option>
							<option value="1" <%=(corr.cardType!=null && corr.cardType.equals("1")) ? "selected" : ""%>>身份证</option>
							<option value="8" <%=(corr.cardType!=null && corr.cardType.equals("8")) ? "selected" : ""%>>组织机构代码</option>
							<option value="9" <%=(corr.cardType!=null && corr.cardType.equals("9")) ? "selected" : ""%>>营业执照</option>
							<option value="a" <%=(corr.cardType!=null && corr.cardType.equals("a")) ? "selected" : ""%>>法人代码证</option>
						</select>
					</td>
				</tr>
				<tr height="35" id="cardFlag">
					<td align="right">证件号码：&nbsp;</td>
					<td align="left">
						<input id="card" name="card" readonly disabled="disabled" value="<%=Tool.delNull(corr.card)%>" type=text  class="text" maxlength="18"  style="width: 140px">
					</td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
		</div>
		<table border="0" cellspacing="0" cellpadding="0" width="100%" height="35">
			<tr height="35">					
				<td align="center" colspan=2>
					<button id="sub_btn" class="btn_sec" onclick="doAdd('<%=BankUrl%>');">下一步</button>&nbsp;
					<button id="bak_btn" class="btn_cz" onclick="window.close();">返回</button>&nbsp;
					<input type="hidden" id="submitFlag" name="submitFlag" value="">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
 <!--  <script>
	if(document.getElementById("firmID").value!=""){
		document.getElementById("contactFalg").style.display = "inline";
		document.getElementById("frimNameFlag").style.display = "inline";
		document.getElementById("cardTypeFlag").style.display = "inline";
		document.getElementById("cardFlag").style.display = "inline";
	}else{
		document.getElementById("contactFalg").style.display = "none";
		document.getElementById("frimNameFlag").style.display = "none";
		document.getElementById("cardTypeFlag").style.display = "none";
		document.getElementById("cardFlag").style.display = "none";
	}
</script>-->
<SCRIPT LANGUAGE="JavaScript">
<!--
var ErrorClass = "onError";
var CorrectClass = "";//"onCorrect";
var FocusClass = " ";
var FocusMsg = " ";
var ErrorMsg = "验证错误";
var SuccessMsg = " ";
function idobj(userID){
	return document.getElementById(userID);
}
function doAdd(BankIdAndUrls){
	var flag = true;
	flag = myblur("bankID");
	if(flag){
	var bankUrl=null;
		idobj("sub_btn").disabled = 'disabled';
		idobj("bak_btn").disabled = 'disabled';
		var BankIdAndUrl=BankIdAndUrls.split(';');
		for(var i=0;i<BankIdAndUrl.length;i++){
			var bankUrls=BankIdAndUrl[i].split(',');
			if(bankUrl!=null){
				break;
			}else{
				for(var j=0;j<bankUrls.length;j++){
					if(idobj("bankID").value==bankUrls[0]){
					bankUrl=bankUrls[1];
					break;
					}
				}
			}
		}
		window.returnValue="1,"+idobj("bankID").value+","+idobj("firmID").value+","+bankUrl+","+idobj("firmContact").value;
		window.close();
	}
}

function tipclass(userID,flag){
	var tip = idobj(userID+"Tip");
	if(flag){
		tip.className=CorrectClass;
	}else{
		tip.className=ErrorClass;
	}
}
function myblur(strBankID){
	var bankID = idobj(strBankID);
	var tip = idobj(strBankID+"Tip");
	var flag = true;
	if(bankID.value==""){
		flag = false;
		tip.innerHTML = "请选择银行";
	}else{
		tip.innerHTML = SuccessMsg;
	}
	tipclass(strBankID,flag);
	return flag;
}

String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
function isEmpty(s){
	if(s.trim().length<=0){
		return true;
	}
	return false;
} 
</SCRIPT>
