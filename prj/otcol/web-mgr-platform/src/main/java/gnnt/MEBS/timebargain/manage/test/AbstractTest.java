package gnnt.MEBS.timebargain.manage.test;

import java.io.File;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

public abstract class AbstractTest
  extends AbstractTransactionalDataSourceSpringContextTests
{
  protected String[] getConfigLocations()
  {
    File localFile = new File(".");
    String str = "classpath:timeBargainBeansTest.xml";
    setAutowireMode(1);
    return new String[] { str };
  }
}
