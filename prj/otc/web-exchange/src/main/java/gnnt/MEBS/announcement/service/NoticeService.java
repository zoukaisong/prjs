package gnnt.MEBS.announcement.service;

import gnnt.MEBS.announcement.dao.NoticeDao;
import gnnt.MEBS.announcement.dao.OKNoticeDao;
import gnnt.MEBS.announcement.model.Notice;
import gnnt.MEBS.announcement.model.OKNotice;
import gnnt.MEBS.announcement.xmlDeal.XmlDeal;
import gnnt.MEBS.base.model.Clone;
import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.packaging.dao.BaseDao;
import gnnt.MEBS.packaging.service.BaseService;
import java.io.Serializable;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("noticeService")
@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
public class NoticeService
  extends BaseService<Notice>
{
  private final transient Log logger = LogFactory.getLog(NoticeService.class);
  @Autowired
  @Qualifier("noticeDao")
  private NoticeDao noticeDao;
  @Autowired
  @Qualifier("okNoticeDao")
  private OKNoticeDao okNoticeDao;
  @Autowired
  @Qualifier("xmlDeal")
  private XmlDeal xmlDeal;
  
  public BaseDao getDao()
  {
    return this.noticeDao;
  }
  
  public List<Notice> getOKNoticeList(QueryConditions qc, PageInfo pageInfo)
  {
    return this.noticeDao.addOKNoticeList(qc, pageInfo);
  }
  
  public Clone get(Clone clone, Long okoticeId)
  {
    Serializable id = clone.getId();
    if (id == null) {
      return getDao().get(clone);
    }
    OKNotice okNotice = (OKNotice)this.okNoticeDao.getById(okoticeId);
    okNotice.setStatus("Y");
    this.okNoticeDao.update(okNotice);
    
    return getDao().getById(id);
  }
  
  public int add(Notice obj)
  {
    int num = 0;
    Clone clone = (Clone)obj.clone();
    getDao().add(clone);
    if (clone.getId() != null) {
      obj.setPrimary(clone.getId().toString());
    }
    this.xmlDeal.deal(obj);
    num = 2;
    return num;
  }
}
