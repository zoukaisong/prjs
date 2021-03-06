<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>

<%@ page import="gnnt.bank.platform.dao.*"%>
<%@ page import="gnnt.trade.bank.vo.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.resave.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.gs.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.hx.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.hx.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.jh.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.pf.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.pf.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.resave.child.*"%>
<%@ page import="gnnt.bank.platform.util.*"%>
<%@ page import="gnnt.bank.platform.vo.*"%>
<%@ page import="gnnt.bank.platform.util.BankCode"%>
<%@ page import="gnnt.bank.platform.util.CardType"%>

<%@ page import="java.rmi.*"%>
<%@ page import="gnnt.trade.bank.processorrmi.*"%>
<%@ page import="gnnt.bank.platform.rmi.*"%>

<%@ page import="gnnt.MEBS.common.security.util.*"%>
<%@ page import="gnnt.MEBS.common.security.*"%>
<%
//加载银行编码
new BankCode().load();

//加载证件编号
new CardType().load();

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
%>
<%!
static final String ICBC_BANKID = "10";//工行
static final String CCB_BANKID = "13";//建行
static final String SDB_BANKID = "18";//深发展
static final String HXB_BANKID = "17";//华夏
static final String HRBB_BANKID = "30";//哈尔滨
static final String CIB_BANKID = "19";//兴业
static final String BC_BANKID = "24";//中行
static final String SPDB_BANKID = "22";//浦发
static final String ABC_BANKID = "86";//农行
static final String CEB_BANKID = "31";//光大
static final String NBCB_BANKID = "32";//宁波
// 分页默认每页大小
public final int BANKPAGESIZE = 10;
// 设置为空的字符串
public String replaceNull(String s){
  if(s==null||"".equals(s.trim())||"null".equals(s.trim())) return "";
  else return s;
}
//判断假银行
public boolean noAdapterBank(String bankID){
	if("aa".equals(bankID)){
		return true;
	}
	return false;
}
//支持市场端签约
public boolean openAccountBank(String bankID){
	if("05".equals(bankID) || "17".equals(bankID)||"99".equals(bankID)||"79".equals(bankID)){
		return true;
	}
	return false;
}
//支持市场端解约
public boolean delAccountBank(String bankID){
	if("06".equals(bankID)){
		return true;
	}
	return false;
}
//判断发送清算的银行
public int sendQSBank(String bankID){
	if(CCB_BANKID.equals(bankID)){//建行
		return Tool.strToInt(CCB_BANKID);
	}else if(ICBC_BANKID.equals(bankID)){//工行
		return Tool.strToInt(ICBC_BANKID);
	}else if(HXB_BANKID.equals(bankID)){//华夏
		return Tool.strToInt(HXB_BANKID);
	}else if(SDB_BANKID.equals(bankID)){//深发
		return Tool.strToInt(SDB_BANKID);
	}else if(CIB_BANKID.equals(bankID)){//兴业
		return Tool.strToInt(CIB_BANKID);
	}else if(HRBB_BANKID.equals(bankID)){//哈尔滨
		return Tool.strToInt(HRBB_BANKID);
	}
	/*
	else if(SPDB_BANKID.equals(bankID)){ //浦发
		return Tool.strToInt(SPDB_BANKID);
	}else if(BC_BANKID.equals(bankID)){ //中行
		return Tool.strToInt(BC_BANKID);
	}else if(ABC_BANKID.equals(bankID)){//农行
		return Tool.strToInt(ABC_BANKID);
	}else if(CEB_BANKID.equals(bankID)){ //光大
		return Tool.strToInt(CEB_BANKID);
	}else if(NBCB_BANKID.equals(bankID)){ //宁波
		return Tool.strToInt(NBCB_BANKID);
	}
	*/
	return 0;
}
//不需要输入银行账号的银行
public boolean checkAccount(String bankID){
	if("05".equals(bankID) || "007".equals(bankID)){//农业银行
		return true;
	}
	return false;
}
public boolean isOutMoneyBank(String bankID){
	if("66".equals(bankID)){
		return true;
	}
	return false;
}
%>
<%
	String RmiIpAddress = Tool.getConfig("RmiIpAddress");
	String RmiPortNumber = Tool.getConfig("RmiPortNumber");
	String RmiServiceName = Tool.getConfig("RmiServiceName");
	String PTRmiServiceName = Tool.getConfig("PTRmiServiceName");
	String computerIP = request.getRemoteAddr();
%>

<%
//易极付定制——————开户行名称及其所在省市所用
	//获取开户行城市表中数据
	BankDAO bankDao = BankDAOFactory.getDAO();
	Vector<CityValue> citys = bankDao.getCityNames("");
	CityValue cityForBank = new CityValue();
	Map<String, CityValue> map = new HashMap<String, CityValue>();
	for(int i=0;i<citys.size();i++){
		cityForBank = citys.get(i);
		map.put(cityForBank.getCityCode(), cityForBank);//把对应的开户行城市对象以城市编码为key放到Map中
	}
	
	//加载银行列表
	Vector<BankValue> vecBankList = bankDao.getBankList("");
	Map<String, BankValue> banksMap = new HashMap<String, BankValue>();
	for(BankValue bv : vecBankList){
		banksMap.put(bv.bankID, bv);
	}
	
	//获取登陆用户列表
	BankFeeAndOffsetDao _userDao = new BankFeeAndOffsetDaoImpl();
	Set<List<Object>> setUser = _userDao.userQuery();
	
	//加载交易系统列表
	Vector<SystemMessage> vecSystemList = bankDao.getSystemMessages("");
	Map<String,SystemMessage> systemsMap = new HashMap<String, SystemMessage>();
	for(SystemMessage sm : vecSystemList){
		systemsMap.put(sm.systemID, sm);
	}
%>

<script type="text/javascript">
//变更银行时操作
function gotoBankQS(){
	var bankID = frm.bankID.value;
	if(bankID == ""){
		alert("请选择清算银行");
	}else{
		frm.action="<%=request.getContextPath()%>/bankInterface/compareInfo/"+bankQsPage(bankID);
		frm.submit();
	}
}
//确定每个清算页面的位置
function bankQsPage(bankID){
	if(bankID == "-1"){//返回初始化页面
		return "qs.jsp";
	}if(bankID == "<%=ICBC_BANKID%>"){//工商银行
		return "dz/icbc/ICBC.jsp";
	}else if (bankID == "<%=CCB_BANKID%>"){//建设银行
		return "dz/ccb/CCB.jsp";
	}else if (bankID == "<%=SDB_BANKID%>"){//深发展银行
		return "dz/sdb/SDB.jsp";
	}else if (bankID == "<%=HXB_BANKID%>"){//华夏银行
		return "dz/hxb/HXB.jsp";
	}else if (bankID == "<%=CIB_BANKID%>"){//兴业银行
		return "dz/cib/CIB.jsp";
	}else if(bankID == "<%=HRBB_BANKID%>"){ //哈尔滨银行
		return "dz/hrbb/HRBB.jsp";
	}else if(bankID == "<%=SPDB_BANKID%>"){ //浦发
		return "dz/spdb/SPDB.jsp";
	}else if(bankID == "<%=BC_BANKID%>"){ //中行
		return "dz/bc/BC.jsp";
	}else if(bankID == "<%=ABC_BANKID%>"){//农行
		return "dz/abc/ABC.jsp";
	}else if(bankID == "<%=CEB_BANKID%>"){//光大
		return "dz/ceb/CEB.jsp";
	}else if(bankID == "<%=NBCB_BANKID%>"){//宁波
		return "dz/nbcb/NBCB.jsp";
	}
}
</script>
