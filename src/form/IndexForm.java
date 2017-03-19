package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import beans.PostLam;
import common.StringProcess;

public class IndexForm extends ActionForm {
	private String khuVuc;
	private String hangSX;
	private String gia;
	private String sTimKiem;
	private ArrayList<PostLam> listPost;
	
	private String email;
	private String passWord;	
	private String btnSubmit;
	
	private int pageCurrent=1;
	
	public int getPageCurrent() {
		return pageCurrent;
	}
	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}

	//gia tri de action in topmenu
	private String id_post="index";
	
	public String getId_post() {
		return id_post;
	}
	public void setId_post(String id_post) {
		this.id_post = id_post;
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
	public String getKhuVuc() {
		return khuVuc;
	}
	public void setKhuVuc(String khuVuc) {
		this.khuVuc = khuVuc;
	}
	public String getHangSX() {
		return hangSX;
	}
	public void setHangSX(String hangSX) {
		this.hangSX = hangSX;
	}
	public String getsTimKiem() {
		return sTimKiem;
	}
	public void setsTimKiem(String sTimKiem) {
		this.sTimKiem=StringProcess.IsoToUtf8(sTimKiem);
	}
	public String getGia() {
		return gia;
	}
	public void setGia(String gia) {
		this.gia = gia;
	}	
	public ArrayList<PostLam> getListPost() {
		return listPost;
	}
	public void setListPost(ArrayList<PostLam> listPost) {
		this.listPost = listPost;
	}
	public String getBtnSubmit() {
		return btnSubmit;
	}
	public void setBtnSubmit(String btnSubmit) {
		this.btnSubmit = StringProcess.IsoToUtf8(btnSubmit);
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
