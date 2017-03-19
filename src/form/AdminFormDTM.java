package form;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

import com.captcha.botdetect.web.servlet.Captcha;

import common.StringProcess;

public class AdminFormDTM extends ActionForm{
	 private ArrayList<FormFile> uploaded = new ArrayList<FormFile>(); 
	 private int id_account;
	 private String title_post;
	 private String content_post;
	 private String type_product;
	 private String percent_product;
	 private String cost;
	 private String address_product;
	 private String type_post;

	public ArrayList<FormFile> getUploaded() {
		return uploaded;
	}
	public void setUploaded(ArrayList<FormFile> uploaded) {
		this.uploaded = uploaded;
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
		this.title_post = StringProcess.IsoToUtf8(title_post);
	}
	public String getContent_post() {
		return content_post;
	}
	public void setContent_post(String content_post) {
		this.content_post = StringProcess.IsoToUtf8(content_post);
	}
	public String getType_product() {
		return type_product;
	}
	public void setType_product(String type_product) {
		this.type_product = type_product;
	}
	public String getPercent_product() {
		return percent_product;
	}
	public void setPercent_product(String percent_product) {
		this.percent_product = percent_product;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {		
		this.cost = cost.replace('.', ' ').replaceAll("\\s","");
	}
	public String getAddress_product() {
		return address_product;
	}
	public void setAddress_product(String address_product) {
		this.address_product = StringProcess.IsoToUtf8(address_product);
	}
	public String getType_post() {
		return type_post;
	}
	public void setType_post(String type_post) {
		this.type_post = type_post;
	}
	public void setUpload(List<FormFile> file) {
		 uploaded.addAll(file); 
	 }
	 public List<FormFile> getUpload() { 
		 return uploaded; 
	}
	 
	@Override
	public ActionErrors validate(ActionMapping mapping,
	   HttpServletRequest request) {
	   ActionErrors errors = new ActionErrors();
	   
	   if(title_post!=null || content_post!=null || type_product!=null || cost!=null){
		   ActionErrors errors2=StringProcess.checkNewPost(id_account, title_post, content_post, type_product, percent_product, cost, address_product, type_post);
		   errors.add(errors2);
	   }	   
	   
	   if(getUpload()!=null){
		   if(getUpload().size()<=5){
			   for(int i=0;i<getUpload().size();i++){
				   FormFile image=getUpload().get(i);
				   if(image.getFileSize()== 0){
				       errors.add("common.file.err",new ActionMessage("error.common.file.required"));				       
				    }
				    //only allow textfile to upload
				   System.out.println(image.getContentType());
				    if(!"image/jpeg".equals(image.getContentType()) && !"application/octet-stream".equals(image.getContentType())){
				        errors.add("common.file.err.ext",new ActionMessage("error.common.file.image.only"));				     
				    }
			        //file size cant larger than 10kb
				    if(image.getFileSize() > 5120000){ //10240=10kb 5M=10240*100*5
				       errors.add("common.file.err.size", new ActionMessage("error.common.file.size.limit", 5120000));				   
				    }
			   }
		   }else if(getUpload().size()>0){
			   errors.add("common.file.multiple", new ActionMessage("error.common.file.multiple"));		       
		   }
	   }
	   
	   // validate the Captcha to check we're not dealing with a bot
	   if(request.getParameter("captchaCode")!=null){
		   Captcha captcha = Captcha.load(request, "exampleCaptchaTag");
		   boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
		   if (!isHuman) {
		     // Captcha validation failed, show error message
			 errors.add("captchaIncorrect",new ActionMessage("error.common.Incorrect"));
		   }
	   }
	   
	   return errors;
	}
	
}
