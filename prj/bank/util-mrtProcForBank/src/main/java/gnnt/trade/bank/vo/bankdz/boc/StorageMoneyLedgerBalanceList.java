package gnnt.trade.bank.vo.bankdz.boc;

import java.io.Serializable;

public class StorageMoneyLedgerBalanceList
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private String BankCode;
  private String MarketCode;
  private String TransAddressCode;
  private String TransDateTime;
  private String TaiZhangZhangHao;
  private String bondAcc;
  private String certificationName;
  private String MoneyType;
  private String CashExCode;
  private double money;
  private double lastMoney;

  public double getLastMoney()
  {
    return this.lastMoney;
  }

  public void setLastMoney(double lastMoney) {
    this.lastMoney = lastMoney;
  }

  public String getBankCode()
  {
    return this.BankCode;
  }
  public void setBankCode(String bankCode) {
    this.BankCode = bankCode;
  }
  public String getMarketCode() {
    return this.MarketCode;
  }
  public void setMarketCode(String marketCode) {
    this.MarketCode = marketCode;
  }
  public String getTransAddressCode() {
    return this.TransAddressCode;
  }
  public void setTransAddressCode(String transAddressCode) {
    this.TransAddressCode = transAddressCode;
  }
  public String getTransDateTime() {
    return this.TransDateTime;
  }
  public void setTransDateTime(String transDateTime) {
    this.TransDateTime = transDateTime;
  }
  public String getTaiZhangZhangHao() {
    return this.TaiZhangZhangHao;
  }
  public void setTaiZhangZhangHao(String taiZhangZhangHao) {
    this.TaiZhangZhangHao = taiZhangZhangHao;
  }
  public String getBondAcc() {
    return this.bondAcc;
  }
  public void setBondAcc(String bondAcc) {
    this.bondAcc = bondAcc;
  }
  public String getCertificationName() {
    return this.certificationName;
  }
  public void setCertificationName(String certificationName) {
    this.certificationName = certificationName;
  }
  public String getMoneyType() {
    return this.MoneyType;
  }
  public void setMoneyType(String moneyType) {
    this.MoneyType = moneyType;
  }
  public String getCashExCode() {
    return this.CashExCode;
  }
  public void setCashExCode(String cashExCode) {
    this.CashExCode = cashExCode;
  }
  public double getMoney() {
    return this.money;
  }
  public void setMoney(double money) {
    this.money = money;
  }
}