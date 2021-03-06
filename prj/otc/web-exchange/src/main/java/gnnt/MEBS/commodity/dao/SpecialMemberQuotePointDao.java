package gnnt.MEBS.commodity.dao;

import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.commodity.model.QuotePoint;
import gnnt.MEBS.packaging.dao.BaseDao;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

@Repository("specialMemberQuotePointDao")
public class SpecialMemberQuotePointDao
  extends BaseDao
{
  private final transient Log logger = LogFactory.getLog(SpecialMemberQuotePointDao.class);
  
  public Class getEntityClass()
  {
    return new QuotePoint().getClass();
  }
  
  public List<QuotePoint> getList(QueryConditions conditions, PageInfo pageInfo)
  {
    String hql = "select new QuotePoint(primary.commodityId, commodity.name, primary.m_firmId,specialMember.name, primary.quotePointB, primary.quotePointS,primary.quotePointAlgr) from QuotePoint as primary,Commodity as commodity,SpecialMember as specialMember where primary.commodityId=commodity.id and specialMember.s_memberNo=primary.m_firmId";
    Object[] values = (Object[])null;
    String[] names = (String[])null;
    if ((conditions != null) && (conditions.getFieldsSqlClause() != null))
    {
      values = conditions.getValueArray();
      names = conditions.getNameArray();
      hql = hql + " and " + conditions.getFieldsSqlClause();
    }
    return queryByHQL(hql, names, values, pageInfo, null);
  }
}
