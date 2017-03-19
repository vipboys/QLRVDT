package beans;

import java.io.Serializable;

public class Account implements Serializable{
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
	
	
	public Account() {
		super();
	}
	public Account(int id_account, String email, String password, String fullname, String phone, String address,
			String role, String status, String sex, String code_mail) {
		super();
		this.id_account = id_account;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.status = status;
		this.sex = sex;
		this.code_mail = code_mail;
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
		this.fullname = fullname;
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
		this.address = address;
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
		this.sex = sex;
	}
	public String getCode_mail() {
		return code_mail;
	}
	public void setCode_mail(String code_mail) {
		this.code_mail = code_mail;
	}
	
	
}
