package beans;

import java.sql.Date;
import java.util.ArrayList;

public class PostDetail {
	private int id_post;
	private int id_account;
	private String title_post;
	private String content_post;
	private String type_product;
	private int percent_product;
	private String cost;
	private Date date_post;
	private String address_product;
	private int view_post;
	private ArrayList<String> listImages;
	private String phone;
	private String fullname;
	private String email;

	
	public PostDetail(String title_post, String content_post, String type_product,
			int percent_product, String cost, Date date_post, String address_product, int view_post, String phone, String fullname, String email) {
		super();
		this.title_post = title_post;
		this.content_post = content_post;
		this.type_product = type_product;
		this.percent_product = percent_product;
		this.cost = cost;
		this.date_post = date_post;
		this.address_product = address_product;
		this.view_post = view_post;
		this.phone = phone;
		this.fullname = fullname;
		this.email = email;
	}

	public PostDetail() {
		super();
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

	public String getTitle_post() {
		return title_post;
	}

	public void setTitle_post(String title_post) {
		this.title_post = title_post;
	}

	public String getContent_post() {
		return content_post;
	}

	public void setContent_post(String content_post) {
		this.content_post = content_post;
	}

	public String getType_product() {
		return type_product;
	}

	public void setType_product(String type_product) {
		this.type_product = type_product;
	}

	public int getPercent_product() {
		return percent_product;
	}

	public void setPercent_product(int percent_product) {
		this.percent_product = percent_product;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public Date getDate_post() {
		return date_post;
	}

	public void setDate_post(Date date_post) {
		this.date_post = date_post;
	}

	public String getAddress_product() {
		return address_product;
	}

	public void setAddress_product(String address_product) {
		this.address_product = address_product;
	}

	public int getView_post() {
		return view_post;
	}

	public void setView_post(int view_post) {
		this.view_post = view_post;
	}

	public ArrayList<String> getListImages() {
		return listImages;
	}

	public void setListImages(ArrayList<String> listImages) {
		this.listImages = listImages;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
