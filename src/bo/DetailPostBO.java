package bo;

import java.util.ArrayList;

import beans.PostDetail;
import dao.DetailPostDAO;
import utils.MyException;


public class DetailPostBO {
	public static PostDetail getDetailPost(int id_post) throws MyException {
		return DetailPostDAO.getDetailPost(id_post);
	}
	
	public static ArrayList<String> getImages(int id_post) throws MyException{
		return DetailPostDAO.getImages(id_post);
	}
}
