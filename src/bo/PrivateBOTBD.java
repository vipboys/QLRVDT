package bo;

import java.sql.SQLException;
import java.util.Date;

import dao.PrivateDAOTBD;
import utils.MyException;

public class PrivateBOTBD {

	public static int createPost(int id_account, String title_post, String content_post, String type_product,
			String percent_product, String cost, String date_post, String address_product, String dateup, String type_post, int view_post,
			String accept, int limit) throws MyException, SQLException {
		boolean kq=PrivateDAOTBD.createPost(id_account,title_post,content_post,type_product,percent_product,cost,date_post,address_product,dateup,type_post,view_post,accept,limit);
		if(kq){
			return PrivateDAOTBD.getIdPostCreate(id_account,title_post,content_post,type_product,percent_product,cost,date_post,address_product,dateup,type_post,view_post,accept,limit);
		}else{
			return 0;
		}		
	}

	public static boolean createImages(int id_post, String address) throws MyException {
		return PrivateDAOTBD.createImages(id_post,address);
	}


}
