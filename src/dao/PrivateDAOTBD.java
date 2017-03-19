package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import common.DataAccess;
import utils.MyException;

public class PrivateDAOTBD {

	public static boolean createPost(int id_account, String title_post, String content_post, String type_product,
			String percent_product, String cost, String date_post, String address_product, String dateup, String type_post,
			int view_post, String accept, int limit) throws MyException {		
		if(DataAccess.truyVan("INSERT INTO POST(id_account,title_post,content_post,type_product,percent_product,cost,date_post,address_product,dateup,type_post,view_post,accept,limit)"
				+ " VALUES("+id_account+",N'"+title_post+"',N'"+content_post+"',N'"+type_product+"',"+percent_product+","+cost+",'"+date_post+"',N'"+address_product+"','"+dateup+"',N'"+type_post+"',"+view_post+",N'"+accept+"',"+limit+")"))
			return true;
		else
			return false;
	}

	public static int getIdPostCreate(int id_account, String title_post, String content_post, String type_product,
			String percent_product, String cost, String date_post, String address_product, String dateup, String type_post,
			int view_post, String accept, int limit) throws MyException, SQLException {
		int kq=0;		
		ResultSet resultSet=DataAccess.layDL("SELECT id_post FROM POST WHERE id_account="+id_account+" AND title_post=N'"+title_post+"'AND content_post=N'"+content_post+"' AND type_product=N'"+type_product+"' AND percent_product="+percent_product+" AND cost="+cost+" AND date_post='"+date_post+"' AND address_product=N'"+address_product+"' AND dateup='"+dateup+"' AND type_post=N'"+type_post+"' AND view_post="+view_post+" AND accept=N'"+accept+"' AND limit="+limit+"");
		if(resultSet!=null){
			while(resultSet.next()){
				kq=resultSet.getInt("id_post");
			}
		}
		return kq;
	}

	public static boolean createImages(int id_post, String address) throws MyException {		
		return DataAccess.truyVan("INSERT INTO IMAGES(id_post,address) VALUES("+id_post+",N'"+address+"')");
	}

}
