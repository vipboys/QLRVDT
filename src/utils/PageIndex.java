package utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import beans.PostLam;
import common.DataAccess;
import common.StringProcess;

public class PageIndex {
	private ArrayList<PostLam> dsPost;
	private int pageCurrent;
	private int sumPage;
	private int rowInPage=5;
	private int rowBegin;
	private int rowEnd;		
	
	public void layDuLieu(String sql) throws MyException{
		ArrayList<PostLam> listPost = null;
		ResultSet rs=DataAccess.layDL(sql);
		if (rs != null) {
			listPost = new ArrayList<PostLam>();
			try {
				int i=1;
				while (rs.next()) {
					if(i>=this.rowBegin && i<=this.rowEnd){
						// Truy vấn lấy đường dẫn ảnh đầu tiên của bài đăng
						String sqlImage = "SELECT TOP 1 address FROM IMAGES WHERE id_post='"+rs.getInt("id_post")+"'";
						ResultSet rsImage = DataAccess.layDL(sqlImage);
						String address_image = "";
						while (rsImage.next()){
							if(!StringProcess.notVaild(rsImage.getString("address")))
							address_image = rsImage.getString("address");
						}						
						listPost.add(new PostLam(rs.getInt("id_post"), rs.getInt("id_account"), rs.getString("title_post"),
								rs.getString("content_post"), rs.getString("type_product"), rs.getInt("percent_product"),
								rs.getString("cost"), rs.getDate("date_post"), rs.getString("address_product"),
								rs.getDate("dateup"), rs.getString("type_post"), rs.getInt("view_post"), rs.getString("accept"),
								rs.getInt("limit"), address_image));
					}
					i++;
				}
				this.dsPost=listPost;				
			} catch (SQLException e) {
				e.printStackTrace();
				throw new MyException(e.getMessage());
			}
		}else{
			this.dsPost=new ArrayList<PostLam>();
		}		
	}
	
	public PageIndex() {
		super();
	}
	public ArrayList<PostLam> getDsPost() {
		return dsPost;
	}
	public void setDsPost(ArrayList<PostLam> dsPost) {
		this.dsPost = dsPost;
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
	public void laySoTrang(String sql) throws MyException{
		int i=0;
		ResultSet resultSet= DataAccess.layDL(sql);
		if(resultSet!=null){			
			try {
				while(resultSet.next()){
					i++;
				}
			} catch (SQLException e) {				
				e.printStackTrace();
				throw new MyException(e.getMessage());
			}
		}
		this.sumPage=StringProcess.TinhSoTrang(i, this.rowInPage);
		this.rowBegin=(this.rowInPage*(this.pageCurrent-1)+1);
		this.rowEnd=(rowInPage*(pageCurrent-1)+rowInPage);
	}	
	
	
}
