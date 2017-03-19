package common;

public class Pages {
	private static int rowInPage=1;
	private int rowPage=0;//Tổng số dòng
	private int currentPage=0;//Trang hiện tại
	private int sumPage=0;//Tổng số trang
	
	public static String getQuerySQL(String field,String tableName,String where){
		String sql="SELECT "+field+" FROM "+tableName+" WHERE "+where;
		return sql;
	}
	public Pages() {
		super();
	}
	public static int getRowInPage() {
		return rowInPage;
	}
	public static void setRowInPage(int rowInPage) {
		Pages.rowInPage = rowInPage;
	}
	public int getRowPage() {
		return rowPage;
	}
	public void setRowPage(int rowPage) {
		this.rowPage = rowPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}	
	
}
