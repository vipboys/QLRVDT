package beans;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {
	private int id_post;
	private int id_account;
	private Date date;
	private String comment;
	
	
	public Comment() {
		super();
	}
	public Comment(int id_post, int id_account, Date date, String comment) {
		super();
		this.id_post = id_post;
		this.id_account = id_account;
		this.date = date;
		this.comment = comment;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
