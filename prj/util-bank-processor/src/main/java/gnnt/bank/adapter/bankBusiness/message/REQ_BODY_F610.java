package gnnt.bank.adapter.bankBusiness.message;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class REQ_BODY_F610
{

  @XmlElement
  public String busiNum;

  @XmlElement
  public String fcsSerialNum;

  @XmlElement
  public String busiSerialNum;

  @XmlElement
  public String brief;

  @XmlElement
  public String depositType;

  @XmlElement
  public String filed1;

  @XmlElement
  public String filed2;

  @XmlElement
  public String filed3;
}