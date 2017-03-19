package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import beans.Post;

public class AdminFormQLBD extends ActionForm{
	private int id_post;
	private String valueSearch="";
	private ArrayList<Post> dsBD;
	
	private int pageCurrent;
}
