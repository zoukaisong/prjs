<%@ include file="/timebargain/common/taglibs.jsp"%>
<%@ page pageEncoding="GBK" %>
<html>
<head>
<LINK REL="stylesheet" type="text/css" href="<c:url value="/timebargain/styles/common.css"/>"/>
<script language="javascript">
function window_onload()
{
  changeColor("wait");
  query();
}


function wait_onclick()
{
  changeColor("wait");    
  query();
}

function already_onclick()
{
  changeColor("already");    
  query();
}



function changeColor(name)
{
  oper.value = name;
  if(name == "wait")
  {
  	wait.style.color = "red";
  	already.style.color = "#26548B";
  }
  else if(name == "already")
  {
  	already.style.color = "red";
  	wait.style.color = "#26548B";
  } 
  
  
}

function query()
{
  if(oper.value == "wait")
  {
  	parent.ListFrame.location.href = "<c:url value="/timebargain/baseinfo/virtualFundCheWait.jsp"/>";
  }
  else if(oper.value == "already")
  {
  	parent.ListFrame.location.href = "<c:url value="/timebargain/baseinfo/virtualFundCheAlready.jsp"/>";
  }
  
  
}
</script>
</head>
<body leftmargin="0" topmargin="0" onLoad="return window_onload()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="11" height="31" background="<c:url value="/images/bgimage.gif"/>"></td>
    
    <td width="17" background="<c:url value="/timebargain/images/bgimage.gif"/>"><div align="left"><img src="<c:url value="/timebargain/images/line.gif"/>" width="3" height="31"></div></td>   
    <td width="180" background="<c:url value="/timebargain/images/bgimage.gif"/>" class="common" ><a href="#" id="wait" class="common" onclick="wait_onclick()">���������</a></td>
    <td width="29" background="<c:url value="/timebargain/images/bgimage.gif"/>"><div align="left"><img src="<c:url value="/timebargain/images/line.gif"/>" width="3" height="31"></div></td>
	<td width="160" background="<c:url value="/timebargain/images/bgimage.gif"/>"><a href="#" id="already" class="common" onclick="already_onclick()">���������</a></td>
    <td width="30" background="<c:url value="/timebargain/images/bgimage.gif"/>" class="common" ><img src="<c:url value="/timebargain/images/line.gif"/>" width="3" height="31"></td>
    <td width="333" background="<c:url value="/timebargain/images/bgimage.gif"/>" class="common" >&nbsp;</td>
    <td width="167" background="<c:url value="/timebargain/images/bgimage.gif"/>" class="common" >&nbsp; </td>
  </tr>
</table>
<input type="hidden" name="oper" value="" />
</body>
</html>

  
