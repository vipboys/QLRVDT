package beans;

import java.io.Serializable;
import java.sql.Date;

public class Mail implements Serializable{
	private int id_mail;
	private int id_account;
	private String title_mail;
	private String content_mail;
	private String read_status;
	private String input;
	private String output;
	private Date date;
	
	
	public Mail() {
		super();
	}
	public Mail(int id_mail, int id_account, String title_mail, String content_mail, String read_status, String input,
			String output, Date date) {
		super();
		this.id_mail = id_mail;
		this.id_account = id_account;
		this.title_mail = title_mail;
		this.content_mail = content_mail;
		this.read_status = read_status;
		this.input = input;
		this.output = output;
		this.date = date;
	}
	public int getId_mail() {
		return id_mail;
	}
	public void setId_mail(int id_mail) {
		this.id_mail = id_mail;
	}
	public int getId_account() {
		return id_account;
	}
	public void setId_account(int id_account) {
		this.id_account = id_account;
	}
	public String getTitle_mail() {
		return title_mail;
	}
	public void setTitle_mail(String title_mail) {
		this.title_mail = title_mail;
	}
	public String getContent_mail() {
		return content_mail;
	}
	public void setContent_mail(String content_mail) {
		this.content_mail = content_mail;
	}
	public String getRead_status() {
		return read_status;
	}
	public void setRead_status(String read_status) {
		this.read_status = read_status;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
