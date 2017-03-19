package utils;

import java.util.ArrayList;

import beans.Account;

public class PageQLTK {
	private ArrayList<Account> dsTK;
	private int pageCurrent;
	private int sumPage;
	private String where;
	private int rowInPage=5;
	private int rowBegin;
	private int rowEnd;	
	
	public PageQLTK() {
		super();
	}	
	public PageQLTK(ArrayList<Account> dsTK, int pageCurrent, int sumPage, String where) {
		super();
		this.dsTK = dsTK;
		this.pageCurrent = pageCurrent;
		this.sumPage = sumPage;
		this.where = where;
	}
	public int getRowBegin() {
		return (rowInPage*(pageCurrent-1)+1);
	}
	public void setRowBegin(int rowBegin) {
		this.rowBegin = rowBegin;
	}
	public int getRowEnd() {
		return (rowInPage*(pageCurrent-1)+rowInPage);
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	public int getRowInPage() {
		return rowInPage;
	}
	public void setRowInPage(int rowInPage) {
		this.rowInPage = rowInPage;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public ArrayList<Account> getDsTK() {
		return dsTK;
	}
	public void setDsTK(ArrayList<Account> dsTK) {
		this.dsTK = dsTK;
	}
	public int getPageCurrent() {
		return pageCurrent;
	}
	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}
	public int getSumPage() {
		return sumPage;
	}
	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}	
	public static String Query(String table,String where,int pageCurrent,int rowInPage ){
		//SELECT * FROM (SELECT ACCOUNT.*,ROW_NUMBER() OVER (ORDER BY (ACCOUNT.id_account) DESC) rownum FROM ACCOUNT WHERE sex='Nam') as seq WHERE seq.rownum BETWEEN 0 AND 10
		if(where.trim().equalsIgnoreCase(""))
			return "SELECT * FROM (SELECT "+table+".*,ROW_NUMBER() OVER (ORDER BY ("+table+".id_account) DESC) rownum FROM "+table+" ) as seq WHERE seq.rownum BETWEEN "+(rowInPage*(pageCurrent-1)+1)+" AND "+(rowInPage*(pageCurrent-1)+rowInPage)+"";
		else
			return "SELECT * FROM (SELECT "+table+".*,ROW_NUMBER() OVER (ORDER BY ("+table+".id_account) DESC) rownum FROM "+table+" WHERE "+where+") as seq WHERE seq.rownum BETWEEN "+(rowInPage*(pageCurrent-1)+1)+" AND "+(rowInPage*(pageCurrent-1)+rowInPage)+"";
	}	
	public static String Sum(String table,String where){
		//SELECT COUNT(tong.rownum) as tong FROM (SELECT * FROM (SELECT ACCOUNT.*,ROW_NUMBER() OVER (ORDER BY (ACCOUNT.id_account) DESC) rownum FROM ACCOUNT WHERE sex='Nam') as seq WHERE seq.rownum BETWEEN 0 AND 10) as tong
		if(where.trim()==null || where.trim().equalsIgnoreCase(""))
			return "SELECT COUNT(tong.rownum) as tong FROM (SELECT * FROM (SELECT "+table+".*,ROW_NUMBER() OVER (ORDER BY ("+table+".id_account) DESC) rownum FROM "+table+" ) as seq ) as tong";
		else
			return "SELECT COUNT(tong.rownum) as tong FROM (SELECT * FROM (SELECT "+table+".*,ROW_NUMBER() OVER (ORDER BY ("+table+".id_account) DESC) rownum FROM "+table+" WHERE "+where+") as seq ) as tong";
	}
	
}
