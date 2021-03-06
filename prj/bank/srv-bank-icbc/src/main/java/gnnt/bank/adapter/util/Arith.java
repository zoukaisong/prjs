package gnnt.bank.adapter.util;

import java.io.PrintStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Arith
{
  private static final int DEF_DIV_SCALE = 10;
  private static final int RESULT_DIV_SCALE = 10;

  private static BigDecimal result(BigDecimal b)
  {
    return b.setScale(10, 4);
  }

  public static double add(double v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.add(b2)).doubleValue();
  }

  public static double add(float v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.add(b2)).doubleValue();
  }

  public static double add(float v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.add(b2)).doubleValue();
  }

  public static double add(double v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.add(b2)).doubleValue();
  }

  public static double sub(double v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.subtract(b2)).doubleValue();
  }

  public static double sub(float v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.subtract(b2)).doubleValue();
  }

  public static double sub(float v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.subtract(b2)).doubleValue();
  }

  public static double sub(double v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.subtract(b2)).doubleValue();
  }

  public static double mul(double v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);

    return result(result(b1.multiply(b2))).doubleValue();
  }

  public static double mul(float v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);

    return result(result(b1.multiply(b2))).doubleValue();
  }

  public static double mul(float v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);

    return result(result(b1.multiply(b2))).doubleValue();
  }

  public static double mul(double v1, float v2)
  {
    v1 = new Double(fmtDouble2(v1)).doubleValue();
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);

    return result(result(b1.multiply(b2))).doubleValue();
  }

  public static String fmtDouble2(double num)
  {
    String result = "0.00";
    try {
      DecimalFormat nf = (DecimalFormat)NumberFormat.getNumberInstance();
      nf.applyPattern("###0.00");
      result = nf.format(num);
    } catch (Exception localException) {
    }
    return result;
  }

  public static double div(double v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.divide(b2, 10, 4))
      .doubleValue();
  }

  public static double div(float v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.divide(b2, 10, 4))
      .doubleValue();
  }

  public static double div(float v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.divide(b2, 10, 4))
      .doubleValue();
  }

  public static double div(double v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return result(b1.divide(b2, 10, 4))
      .doubleValue();
  }

  public static double div(double v1, double v2, int scale, int roundingMode)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return result(b1.divide(b2, scale, roundingMode)).doubleValue();
  }

  public static int compareTo(double v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return b1.compareTo(b2);
  }

  public static int compareTo(float v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return b1.compareTo(b2);
  }

  public static int compareTo(double v1, float v2)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Float.toString(v2)).setScale(
      10, 4);
    return b1.compareTo(b2);
  }

  public static int compareTo(float v1, double v2)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v1)).setScale(
      10, 4);
    BigDecimal b2 = new BigDecimal(Double.toString(v2)).setScale(
      10, 4);
    return b1.compareTo(b2);
  }

  public static double format(double v, int scale)
  {
    BigDecimal b1 = new BigDecimal(Double.toString(v)).setScale(scale, 
      4);
    return b1.doubleValue();
  }

  public static double format(float v, int scale)
  {
    BigDecimal b1 = new BigDecimal(Float.toString(v)).setScale(scale, 
      4);
    return b1.doubleValue();
  }

  public static void main(String[] args) {
    float v1 = 1800.01F;
    double v2 = 153846.0D;
    float v3 = 153846.0F;
    v1 = (float)v2;
    System.out.println(v1 + " " + v2 + " " + v3);
    System.out.println("3.4028235E38 1.4E-45");
  }
}