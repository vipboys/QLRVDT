package action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

import beans.Account;
import bo.PrivateBOTBD;
import form.PrivateTBDForm;
import utils.MyException;

public class PrivateTBDAction extends Action {

	private String address=AdminActionDTM.address;//Cung duong dan upload voi trang Admin
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		ActionErrors errors=new ActionErrors();
		Account nguoiDung=(Account)request.getSession().getAttribute("nguoiDung");
		PrivateTBDForm formDTM=(PrivateTBDForm)form;
		if(nguoiDung!=null && nguoiDung.getId_account()!=0 && formDTM.getId_account()!=0){			
			Date date=new Date();
			int id_post=0;//Gia tri can lay ve khi dang bai
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			try {				
				if(formDTM.getType_post().trim().equals("VIP"))
					id_post=PrivateBOTBD.createPost(formDTM.getId_account(),formDTM.getTitle_post(),formDTM.getContent_post(),formDTM.getType_product(),formDTM.getPercent_product(),formDTM.getCost(),simpleDateFormat.format(date),formDTM.getAddress_product(),simpleDateFormat.format(date),formDTM.getType_post(),0,"FALSE",90);
				else
					id_post=PrivateBOTBD.createPost(formDTM.getId_account(),formDTM.getTitle_post(),formDTM.getContent_post(),formDTM.getType_product(),formDTM.getPercent_product(),formDTM.getCost(),simpleDateFormat.format(date),formDTM.getAddress_product(),simpleDateFormat.format(date),formDTM.getType_post(),0,"FALSE",30);
			} catch (MyException e) {
				System.out.println("Loi dang bai");
				errors.add("errorCreatePost",new ActionMessage("error.admin.create.post"));
				addErrors(request, errors);	
			} catch (SQLException e) {
				e.printStackTrace();
				errors.add("errorCreatePost",new ActionMessage("error.admin.create.post"));
				addErrors(request, errors);	
			}
			
			//Tao thu muc hien hanh
			/*String filePath =getServlet().getServletContext().getRealPath("/") +"images";*/
			String filePath=address;
		    //create the upload folder if not exists
		    File folder = new File(filePath);
		    if(!folder.exists()){
		    	folder.mkdir();
		    }
		    
		    //Tao thu muc theo id_post--> sap chep file vao thu muc
			if(id_post!=0){
				String path=filePath+'\\'+id_post;
				System.out.println(path);
				File folderpost = new File(path);
			    if(!folderpost.exists()){
			    	folderpost.mkdir();
			    }
			    if(formDTM.getUpload()!=null){
			    	try {
				    	for(int i=0;i<formDTM.getUpload().size();i++){
				    		FormFile images = formDTM.getUpload().get(i);
					    	String fileName = images.getFileName();
						    if(!("").equals(fileName)){			        
						        File newFile = new File(path, fileName);
						        if(!newFile.exists()){
						          FileOutputStream fos;						
						          fos = new FileOutputStream(newFile);						
						          fos.write(images.getFileData());						          
						          fos.flush();								
						          fos.close();
						        }else{
						        	newFile.delete();
						        	FileOutputStream fos = new FileOutputStream(newFile);
							          fos.write(images.getFileData());
							          fos.flush();
							          fos.close();
						        }
						    }
						    System.out.println("images\\"+id_post+"\\"+fileName);
						    //Cap nhat bang images
						    try {
								PrivateBOTBD.createImages(id_post,"images\\"+id_post+"\\"+fileName);
							} catch (MyException e) {								
								e.printStackTrace();
								errors.add("errorFileCreateImages",new ActionMessage("error.admin.upload.createImage"));
								addErrors(request, errors);
							}
				    	}
			    	} catch (FileNotFoundException e) {					
						e.printStackTrace();
						errors.add("errorFile",new ActionMessage("error.admin.upload.file"));
						addErrors(request, errors);
					} catch (IOException e) {					
						e.printStackTrace();
						errors.add("errorFile",new ActionMessage("error.admin.upload.file"));
						addErrors(request, errors);
					}
			    	formDTM.getUpload().removeAll(formDTM.getUpload());
			    }	    
			}		    
		    forward=mapping.findForward("thanhCong");
		}else{
			forward=mapping.findForward("thatBai");			
		}		
		return forward;
	}
	
}
