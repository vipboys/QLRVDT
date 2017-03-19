package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import beans.PostDetail;
import common.StringProcess;

public class DetailPostForm extends ActionForm {
	private int id_post;
	private PostDetail postDetail;
	private ArrayList<String> listImages;
	
	private String email;
	private String passWord;
	private String btnSubmit;
	
	public String getBtnSubmit() {
		return btnSubmit;
	}
	public void setBtnSubmit(String btnSubmit) {
		this.btnSubmit = StringProcess.IsoToUtf8(btnSubmit);;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public DetailPostForm() {
		super();
	}
	public DetailPostForm(int id_post, PostDetail postDetail, ArrayList<String> listImages) {
		super();
		this.id_post = id_post;
		this.postDetail = postDetail;
		this.listImages = listImages;
	}
	public PostDetail getPostDetail() {
		return postDetail;
	}
	public void setPostDetail(PostDetail postDetail) {
		this.postDetail = postDetail;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public ArrayList<String> getListImages() {
		return listImages;
	}
	public void setListImages(ArrayList<String> listImages) {
		this.listImages = listImages;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors=new ActionErrors();
		if(btnSubmit!=null && btnSubmit.equalsIgnoreCase("Hủy")){
			request.getSession().removeAttribute("errorLogin");
		}
		/*if(StringProcess.validateEmail(email)){
			errors.add("emailError",new ActionMessage("error.required.email"));
			request.getSession().setAttribute("errorLogin","true");
		}
		if(StringProcess.notVaild(passWord)){
			errors.add("passWordError",new ActionMessage("error.required.passWord"));
			request.getSession().setAttribute("errorLogin","true");
		}*/
		return errors;
	}	
}
