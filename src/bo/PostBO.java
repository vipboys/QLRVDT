package bo;

import java.util.ArrayList;

import beans.PostLam;
import utils.MyException;
import utils.PageIndex;

public class PostBO {
	public static PageIndex getListPost(PageIndex index,String khuVuc, String hangSX, String gia, String sTimKiem) throws MyException{
		return dao.ListPostDAO.getListPost(index,khuVuc, hangSX, gia, sTimKiem);
	}
}
