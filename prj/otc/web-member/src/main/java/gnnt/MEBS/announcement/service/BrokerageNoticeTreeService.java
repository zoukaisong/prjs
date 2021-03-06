package gnnt.MEBS.announcement.service;

import gnnt.MEBS.announcement.dao.BrokerageNoticeTreeDao;
import gnnt.MEBS.packaging.dao.BaseDao;
import gnnt.MEBS.packaging.service.BaseService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("brokerageNoticeTreeService")
@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
public class BrokerageNoticeTreeService
  extends BaseService
{
  private final transient Log logger = LogFactory.getLog(BrokerageNoticeTreeService.class);
  @Autowired
  @Qualifier("brokerageNoticeTreeDao")
  private BrokerageNoticeTreeDao brokerageNoticeTreeDao;
  
  public BaseDao getDao()
  {
    return this.brokerageNoticeTreeDao;
  }
}
