package gnnt.bank.adapter.util;

import java.io.PrintStream;
import java.security.MessageDigest;

public class MD5
{
  public static String getMD5(byte[] source)
  {
    String s = null;
    char[] hexDigits = { 
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
    try {
      MessageDigest md = MessageDigest.getInstance("MD5");
      md.update(source);
      byte[] tmp = md.digest();

      char[] str = new char[32];

      int k = 0;
      for (int i = 0; i < 16; i++)
      {
        byte byte0 = tmp[i];
        str[(k++)] = hexDigits[(byte0 >>> 4 & 0xF)];

        str[(k++)] = hexDigits[(byte0 & 0xF)];
      }
      s = new String(str);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return s;
  }

  public static String trans(String firmId, String pwd) {
    String source = firmId.trim() + pwd.trim();
    return getMD5(source.getBytes());
  }

  public static void main(String[] xu) {
    System.out.println(getMD5("111111000000".getBytes()));
  }
}