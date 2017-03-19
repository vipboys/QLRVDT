package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import beans.Account;
import common.StringProcess;

public class AdminFormQLTK extends ActionForm{
	private ArrayList<Account> dsTK=new ArrayList<Account>();
	private String valueSearch="";
	private int id_account;
	private String email;
	private String password;
	private String fullname;
	private String phone;
	private String address;
	private String role;
	private String status;
	private String sex;
	private String code_mail;
	private int id_error;
	private int id_xoa;
	
	private int pageCurrentQLTK=1;	
	
	public int getId_xoa() {
		return id_xoa;
	}
	public void setId_xoa(int id_xoa) {
		this.id_xoa = id_xoa;
	}
	public int getPageCurrentQLTK() {
		return pageCurrentQLTK;
	}
	public void setPageCurrentQLTK(int pageCurrent) {
		this.pageCurrentQLTK = pageCurrent;
	}
	public int getId_error() {
		return id_error;
	}
	public void setId_error(int id_error) {
		this.id_error = id_error;
	}
	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = StringProcess.IsoToUtf8(fullname);
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = StringProcess.IsoToUtf8(address);
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = StringProcess.IsoToUtf8(sex);
	}
	public String getCode_mail() {
		return code_mail;
	}
	public void setCode_mail(String code_mail) {
		this.code_mail = code_mail;
	}
	public String getValueSearch() {
		return valueSearch;
	}
	public void setValueSearch(String valueSearch) {
		this.valueSearch = StringProcess.IsoToUtf8(valueSearch);
	}
	public ArrayList<Account> getDsTK() {
		return dsTK;
	}
	public void setDsTK(ArrayList<Account> dsTK) {
		this.dsTK = dsTK;
	}
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors=new ActionErrors();
		if(valueSearch.trim().length()>10){
			errors.add("searchError",new ActionMessage("error.required.length"));
			request.getSession().removeAttribute("pageCurrentQLTK");
			request.getSession().removeAttribute("sumPageQLTK");
		}
		return errors;
	}
	
	
}
