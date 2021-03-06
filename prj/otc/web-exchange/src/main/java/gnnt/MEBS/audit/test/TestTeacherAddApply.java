package gnnt.MEBS.audit.test;

import gnnt.MEBS.audit.flowService.OriginalModel;
import gnnt.MEBS.audit.flowService.WorkflowFacade;
import gnnt.MEBS.audit.model.Apply;
import gnnt.MEBS.audit.model.AuditStatus;
import gnnt.MEBS.audit.util.SysDataTest;
import java.io.PrintStream;
import java.util.Date;

public class TestTeacherAddApply
{
  public static void main(String[] args)
  {
    try
    {
      AuditStatus log = new AuditStatus();
      log.setModTime(new Date());
      log.setProposer("admin");
      Apply auditObject = new Apply();
      auditObject.setApplyType("teacherAdd");
      auditObject.setContent("<root><age>222</age><name>2blz</name><address>sb</address></root>");
      OriginalModel o = new OriginalModel();
      o.setAuditObject(auditObject);
      o.setLog(log);
      o.setKey("apply");
      WorkflowFacade workflowFacade = (WorkflowFacade)SysDataTest.getBean("workflowFacade");
      int result = workflowFacade.dealWorkflow(o, "teacherAdd");
      System.out.println(result);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}
