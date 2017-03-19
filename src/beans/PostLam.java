package beans;

import java.io.Serializable;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class PostLam implements Serializable {
	private int id_post;
	private int id_account;
	private String title_post;
	private String content_post;
	private String type_product;
	private int percent_product;
	private String cost;
	private Date date_post;
	private String address_product;
	private Date date_up;
	private String type_post;
	private int view_post;
	private String accept;
	private int limit;
	private String image_address;

	public PostLam() {
		super();
	}

	public PostLam(int id_post, int id_account, String title_post, String content_post, String type_product,
			int percent_product, String cost, Date date, String address_product, Date date_up, String type_post,
			int view_post, String accept, int limit, String image_address) {
		super();
		this.id_post = id_post;
		this.id_account = id_account;
		this.title_post = title_post;
		this.content_post = content_post;
		this.type_product = type_product;
		this.percent_product = percent_product;
		this.cost = cost;
		this.date_post = date;
		this.address_product = address_product;
		this.date_up = date_up;
		this.type_post = type_post;
		this.view_post = view_post;
		this.accept = accept;
		this.limit = limit;
		this.image_address = image_address;
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
		return this.cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public Date getDate_post() {
		return date_post;
	}

	public void setDate(Date date_post) {
		this.date_post = date_post;
	}

	public String getAddress_product() {
		return address_product;
	}

	public void setAddress_product(String address_product) {
		this.address_product = address_product;
	}

	public Date getDate_up() {
		return date_up;
	}

	public void setDate_up(Date date_up) {
		this.date_up = date_up;
	}

	public String getType_post() {
		return type_post;
	}

	public void setType_post(String type_post) {
		this.type_post = type_post;
	}

	public int getView_post() {
		return view_post;
	}

	public void setView_post(int view_post) {
		this.view_post = view_post;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getImage_address() {
		return image_address;
	}

	public void setImage_address(String image_address) {
		this.image_address = image_address;
	}

	public void setDate_post(Date date_post) {
		this.date_post = date_post;
	}

}
