<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type='text/javascript' src='${basePath}/dwr/engine.js'></script>
<script type='text/javascript' src='${basePath}/dwr/util.js'></script>
<script type="text/javascript" src='${basePath}/dwr/interface/checkAction.js'/></script>

<table width="500" border="0" align="center" cellpadding="0"
	cellspacing="2">
	<!-- 基本信息 -->
	<tr>
		<td colspan="4">
			<fieldset>
				<legend>
							<span class="st_title2"><b>基&nbsp;本&nbsp;信&nbsp;息&nbsp;&nbsp;</b></span>
				</legend>
					<table width="421" border="0">
						<tr height="35">
							<td width="76" align="right">
								会员编号:							</td>
							<td colspan="3">
							<input type="text" class="from" id="id" name="obj.id" value="${obj.id}" onblur="checkMemberId()" style="width: 100">
							</td>
						</tr>
						<tr height="35">
							<td align="right">
								会员名称:							</td>
							<td colspan="3">
								<input type="text" class="from" id="memberName" name="obj.name" value="${obj.name}" style="width: 300">							</td>
						</tr>
						<tr height="35">
							<td align="right">
								会员类型:							</td>
							<td width="107">
								<label>
									<select name="obj.memberType">
										<c:forEach items="${accountMemberTypeMap}" var="maps">
											<option value="${maps.key}"<c:if test="${obj.memberType==maps.key}">selected="selected"</c:if>>${maps.value}</option>
										</c:forEach>
									</select>
								</label>							</td>
							<td width="85" align="right">
								证件类型:							</td>
							<td width="135">
								<select name="obj.papersType">
									<c:forEach items="${accountPapersTypeMap}" var="maps">
											<option value="${maps.key}"<c:if test="${obj.papersType==maps.key}">selected="selected"</c:if>>${maps.value}</option>
									</c:forEach>
								</select>							</td>
						</tr>
							<tr height="35">
							<td align="right">
								证件号码:							</td>
							<td colspan="3">
								    <input name="obj.papersName" type="text" value="${obj.papersName}" style="width:300">
								</td>
						</tr>
					</table>
			</fieldset>
		</td>
	</tr>
</table>
<!-- 另一个开始-->
<table width="500" border="0" align="center" cellpadding="0"
	cellspacing="2">
	<tr>
		<td colspan="4">
			<fieldset>
				<legend>
				<span class="st_title2"><b>联&nbsp;系&nbsp;信&nbsp;息&nbsp;&nbsp;</b></span>
				</legend>
				<div id="baseinfo1" align="center">
					<table width="421" border="0">
						<tr height="35">
							<td width="74" align="right">
								电子邮箱:							</td>
							<td colspan="3">
								<label>
									<input class="from" type="text" name="obj.email" value="${obj.email}" style="width: 300">
								</label>							</td>
						</tr>
						
						<tr height="35">
							<td align="right">
								传真机号:							</td>
							<td>
								<label>
									<input class="from" type="text" name="obj.fax" value="${obj.fax}" style="width: 100">
								</label>							</td>
							<td align="right">
								邮政编码:							</td>
							<td>
								<input type="text" class="from" name="obj.postCode" value="${obj.postCode }" style="width: 100">							</td>
						</tr>
						<tr height="35">
							<td align="right">
								联系电话:							</td>
							<td width="112" colspan="3">
								<input type="text" name="obj.phone" value="${obj.phone}" style="width: 300">
						
						</tr>
						<tr height="35">
							<td align="right">
								通讯地址:							</td>
							<td colspan="3">
								<input type="text" class="from" name="obj.address" value="${obj.address }" style="width: 300">							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</td>
	</tr>
	<!-- 另一个结束-->
</table>


