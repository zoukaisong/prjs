package gnnt.MEBS.commodity.action;

import gnnt.MEBS.commodity.service.SpecialMemberTradeAuthService;
import gnnt.MEBS.packaging.action.BaseAction;
import gnnt.MEBS.packaging.service.InService;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("specialMemberTradeAuthAction")
@Scope("request")
public class SpecialMemberTradeAuthAction
  extends BaseAction
{
  private final transient Log logger = LogFactory.getLog(SpecialMemberTradeAuthAction.class);
  @Autowired
  @Qualifier("specialMemberTradeAuthService")
  private SpecialMemberTradeAuthService specialMemberTradeAuthService;
  @Resource(name="firmDisMap")
  private Map firmDisMap;
  @Resource(name="authorityMap")
  private Map authorityMap;
  
  public Map getAuthorityMap()
  {
    return this.authorityMap;
  }
  
  public Map getFirmDisMap()
  {
    return this.firmDisMap;
  }
  
  public InService getService()
  {
    return this.specialMemberTradeAuthService;
  }
  
  public void forwardAttribute()
  {
    this.logger.debug("enter tradeAuthParameters");
    this.request.setAttribute("authorityMap", this.authorityMap);
    this.request.setAttribute("firmDisMap", this.firmDisMap);
    super.forwardAttribute();
  }
}
