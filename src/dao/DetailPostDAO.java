package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.PostDetail;
import common.DataAccess;
import utils.MyException;


public class DetailPostDAO {
	public static PostDetail getDetailPost(int id_post) throws MyException {
		PostDetail postDetail = null;
		String sqlPostDt = "SELECT POST.title_post,content_post,type_product,percent_product,cost,date_post,address_product,view_post,ACCOUNT.phone,fullname,email FROM POST INNER JOIN ACCOUNT ON POST.id_account=ACCOUNT.id_account WHERE POST.id_post='"
				+ id_post + "'";
		ResultSet rsPostDt = null;
		rsPostDt = DataAccess.layDL(sqlPostDt);
		if (rsPostDt != null) {
			try {
					while(rsPostDt.next()){
						postDetail = new PostDetail(rsPostDt.getString("title_post"),
								rsPostDt.getString("content_post"), rsPostDt.getString("type_product"),
								rsPostDt.getInt("percent_product"), rsPostDt.getString("cost"),
								rsPostDt.getDate("date_post"), rsPostDt.getString("address_product"),
								rsPostDt.getInt("view_post")+1, rsPostDt.getString("phone"), rsPostDt.getString("fullname"),
								rsPostDt.getString("email"));
						int view = rsPostDt.getInt("view_post")+1;
						String sqlUpView = "UPDATE POST SET view_post="+view+" WHERE id_post="+id_post+"";					
						DataAccess.truyVan(sqlUpView);
					}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new MyException(e.getMessage());
			}
		}
		return postDetail;
	}
	
	public static ArrayList<String> getImages(int id_post) throws MyException{
		ArrayList<String> listImages = new ArrayList<String>();
		String sqlGetImages = "SELECT address FROM IMAGES WHERE id_post="+id_post+"";
		ResultSet rsImages = null;
		rsImages = DataAccess.layDL(sqlGetImages);
		try {
			while(rsImages.next()){
				listImages.add(rsImages.getString("address"));
			}
		} catch (SQLException e) {			
			e.printStackTrace();
			throw new MyException(e.getMessage());
		}
		return listImages;
	}
}
