<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>

<html>
  <head>
    <title>修改交易商交易属性</title>
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/validationEngine.jquery.css" type="text/css" />
	  <link rel="stylesheet" href="${skinPath }/css/validationengine/template.css" type="text/css" />
	  <script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
	  <script src="${publicPath }/js/validationengine/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
	  <script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
		
	  <script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#frm").validationEngine('attach');
			// 修改按钮注册点击事件
			$("#update").click(function(){
				// 验证信息
				if(jQuery("#frm").validationEngine('validate')){
					
					var vaild = affirm("您确定要操作吗？");
					if(vaild){
						// 修改信息URL
						var updateUrl = $(this).attr("action");
						// 全 URL 路径
						var url = "${basePath}"+updateUrl;
						$("#frm").attr("action",url);
						$("#frm").submit();
					}
				}
			});
		});
	  </script>
		
    <script type="text/javascript">
      function setReadOnly(obj)
	  {
	    obj.readOnly = true;
	    obj.style.backgroundColor = "#C0C0C0";
	  }
	  function setReadWrite(obj)
	  {
	    obj.readOnly = false;
	    obj.style.backgroundColor = "white";
	  }

	  //仅输入数字
	  function onlyNumberInput() {
	  	if (event.keyCode>=48 && event.keyCode<=57) {
	  		event.returnValue=true;
	  	} else {
	  		event.returnValue=false;
	  	}
	  }
	  //仅输入数字和.
	  function onlyDoubleInput()
	  {
	    if (event.keyCode<46 || event.keyCode>57 || event.keyCode == 47)
	    {
	      event.returnValue=false;
	    }
	  } 

	  // 改变 最大订货量
      function changeManner(id){

     	if (id == "1") {
     		document.getElementById('maxHoldQty').value = "";
     		document.getElementById('maxHoldQty').focus();
     		setReadWrite(document.getElementById('maxHoldQty'));
     	}
     	if (id == "2") {
     		document.getElementById('maxHoldQty').value = "-1";
     		setReadOnly(document.getElementById('maxHoldQty'));
     	}
      }

      // 重置
      function resets(){
    	 
    	  setReadOnly(document.getElementById('maxHoldQty'));
    	  document.getElementById('maxHoldQty').focus();
      }

      function window_onLoad(){
    	
    	  if ($("#maxHoldQty").val() == "-1") {
     		 setReadOnly(document.getElementById('maxHoldQty'));
   		  }else {
   			 setReadWrite(document.getElementById('maxHoldQty'));
   		  }
      }	 
    </script>
  </head>
  <body onload="window_onLoad()">
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="" targetType="hidden" >

	  <div class="div_cx">
		<table border="0" width="100%" align="center">
		  <tr>
		    <td>
			  <div class="warning">
			    <div class="content">
			               温馨提示 :交易商交易属性修改
				</div>
			  </div>
			</td>
		  </tr>
		  <tr>
		    <td>
			  <table border="0" width="100%" align="center">
			   
			    <tr>
				  <td>
				    <div class="div_cxtj">
					  <div class="div_cxtjL"></div>
					  <div class="div_cxtjC">
						设置交易商交易属性
					  </div>
					  <div class="div_cxtjR"></div>
					</div>
					<div style="clear: both;"></div>
				    <div>
				    
					 <table border="0" cellspacing="0" cellpadding="10" width="100%" align="center" class="table2_style">
						<tr>
						  <td align="right">交易商代码：</td>
						  <td colspan="2">
						    ${entity.firmID}
                		    <input type="hidden" id="firmID" name="entity.firmID" value="${entity.firmID}" />	
						  </td> 				
						</tr>	
						
						<tr>
                          <td align="right">
                                                                                最大订货量：
                            <input type="radio" name="type" onclick="changeManner(2)" <c:if test="${entity.maxHoldQty == -1}">checked="checked"</c:if> />不限制
                            <input type="radio" name="type" onclick="changeManner(1)" <c:if test="${entity.maxHoldQty != -1}">checked="checked"</c:if> />限制
                          </td>
                          <td>
                            <input type="text" id="maxHoldQty" name="entity.maxHoldQty" class="validate[required,maxSize[10]] input_text " onkeypress="onlyNumberInput()" onkeydown="if(event.keyCode==13)event.keyCode=9" value="${entity.maxHoldQty}"/>
                            <span class="required">*</span>
                          </td>
                          <td>
							<div class="onfocus">不能为空！</div>
						  </td>	
						</tr>		
						<tr>
                           <td align="right">最低结算准备金：</td>
                           <td>   
                             <input type="text" id="minClearDeposit" name="entity.minClearDeposit" value="<fmt:formatNumber value="${entity.minClearDeposit }" pattern="##0.00" />" class="validate[required,maxSize[13],custom[onlyDoubleSp]] input_text" onkeypress="onlyDoubleInput()" />
                             <span class="required">*</span>
                           </td>
                           <td>
				             <div class="onfocus">不能为空！</div>
			               </td>	
                         </tr>
                         <tr>
                           <td align="right">质押资金：</td>
                           <td>
                             <input type="text" id="maxOverdraft" name="entity.maxOverdraft" value="<fmt:formatNumber value="${entity.maxOverdraft }" pattern="##0.00" />" class="validate[required,maxSize[13],custom[onlyDoubleSp]] input_text" onkeypress="onlyDoubleInput()"  />
                             <span class="required">*</span>
                           </td>
                           <td>
				             <div class="onfocus">不能为空！</div>
			               </td>	
                         </tr>				
					  </table>
					  
				   	</div>
				  </td>
			    </tr>
				
				
		</table>
	  </div>
	  <div class="tab_pad">
	    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
		  <tr>
		    <td align="center">
			  <rightButton:rightButton name="修改" onclick="" className="btn_sec" action="/timebargain/firmSet/risk/updateFirm.action" id="update"></rightButton:rightButton>
			  &nbsp;&nbsp;
			  <button class="btn_sec" onClick="window.close();">关闭</button>
		    </td>
		  </tr>
	    </table>
	  </div>
    </form>
  </body>
</html>
<%@ include file="/mgr/public/jsp/footinc.jsp"%>