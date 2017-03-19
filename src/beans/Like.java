package beans;

import java.io.Serializable;

public class Like implements Serializable {
	private int id_account;
	private int id_post;
	
	
	public Like() {
		super();
	}
	public Like(int id_account, int id_post) {
		super();
		this.id_account = id_account;
		this.id_post = id_post;
	}
	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	
	
}
