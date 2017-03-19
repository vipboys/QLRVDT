package beans;

import java.io.Serializable;

public class Images implements Serializable {
	private int id_post;
	private String address;
	
	
	public Images() {
		super();
	}
	public Images(int id_post, String address) {
		super();
		this.id_post = id_post;
		this.address = address;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
