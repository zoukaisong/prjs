<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>修改</title>
	</head>
<body>
		<form name="teaFrm" action="${basePath}/teacher/update.action"
			method="post" targetType="hidden">
			<%@ include file="/public/oldObjectKey.jsp"%>
			<fieldset width="50%" height="60%">
		<legend>
			操作信息
		</legend>
		<%@include file="communalTable.jsp" %>
		<table border="0" cellspacing="0" cellpadding="4" width="100%"
			align="center">
			<tr>
				<td align="center">
					<button id="updateTeacher" onclick="commitTeaInfo()">
								修改
							</button>
				</td>
				<td align="center">
					<input type="button" value="关闭" onclick="window.close()">
				</td>
			</tr>
		</table>
	</fieldset>

		</form>
		<iframe src="" name="frame" style="visibility: hidden"></iframe>
			<c:if test="${not empty resultMsg }">
	<script>
		window.returnValue='1';
		window.close();
	</script>
</c:if>
	</body>
</html>

<%@ include file="/public/footInc.jsp"%>
<%@ include file="/public/addUpdatejs.jsp"%>
