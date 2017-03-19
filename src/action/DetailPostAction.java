package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import beans.Account;
import beans.PostDetail;
import bo.DetailPostBO;
import bo.LoginBO;
import common.StringProcess;
import form.DetailPostForm;
import utils.MyException;


public class DetailPostAction extends Action {
	public static String LOGIN_BLOCK="Block";
	public static String LOGIN_INACTIVE="InActive";
	public static String LOGIN_SUCCESS="Active";
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response){
			DetailPostForm detailPostForm = (DetailPostForm) form;
			ActionForward forward=new ActionForward();
			ActionErrors errors=new ActionErrors();
			//id_post!=0
			if(detailPostForm.getId_post()!=0){				
				int id_post = detailPostForm.getId_post();
				PostDetail postDetail;
				try {
					postDetail = DetailPostBO.getDetailPost(id_post);
					detailPostForm.setPostDetail(postDetail);
					ArrayList<String> listImages = DetailPostBO.getImages(id_post);					
					detailPostForm.setListImages(listImages);
					forward=mapping.findForward("thanhCong");
				} catch (MyException e) {					
					e.printStackTrace();
					errors.add("detailposterror",new ActionMessage("error.post.detail"));
					addErrors(request, errors);
					return mapping.findForward("thatBai");
				}
				
				//Lay du lieu dang nhap
				if(detailPostForm.getBtnSubmit()!=null && detailPostForm.getBtnSubmit().equalsIgnoreCase("Đăng Nhập")){					
					String email=detailPostForm.getEmail();
					String passWord=detailPostForm.getPassWord();
					int i=1;
					if(StringProcess.validateEmail(email)){
						errors.add("emailError",new ActionMessage("error.required.email"));
						request.getSession().setAttribute("errorLogin", "true");
						i=0;						
					}
					if(StringProcess.notVaild(passWord)){
						errors.add("passWordError",new ActionMessage("error.required.passWord"));
						request.getSession().setAttribute("errorLogin", "true");
						i=0;						
					}
					if(i==1){
						Account nguoiDung=null;
						try {
							nguoiDung = LoginBO.checkLogin(email,passWord);
						} catch (MyException e) {
							e.printStackTrace();
							errors.add("erroConnect",new ActionMessage("error.connecttion"));
							request.getSession().setAttribute("errorLogin", "true");					
							forward=mapping.findForward("thatBaiLogin");
						}
						if(nguoiDung==null){
							errors.add("invalue",new ActionMessage("error.login.invalid"));
							request.getSession().setAttribute("errorLogin", "true");					
							forward=mapping.findForward("thatBaiLogin");
						}else if(nguoiDung!=null & nguoiDung.getStatus().equalsIgnoreCase(LOGIN_BLOCK)){
							errors.add("block",new ActionMessage("error.login.block"));
							request.getSession().setAttribute("errorLogin", "true");					
							forward=mapping.findForward("thatBaiLogin");
						}else if(nguoiDung!=null && nguoiDung.getStatus().equalsIgnoreCase(LOGIN_INACTIVE)){
							request.getSession().setAttribute("nguoiDung", nguoiDung);
							request.getSession().setAttribute("errorLogin", "false");
							forward=mapping.findForward("thanhCong");
							System.out.println("Login susscessful-InActive");
						}else if(nguoiDung!=null && nguoiDung.getStatus().equalsIgnoreCase(LOGIN_SUCCESS)){
							request.getSession().setAttribute("nguoiDung", nguoiDung);			
							request.getSession().setAttribute("errorLogin", "false");
							forward=mapping.findForward("thanhCong");
							System.out.println("Login susscessful-Active");
						}
					//sai du lieu nhap
					}else{
						forward=mapping.findForward("thatBaiLogin");
					}
				}
				addErrors(request, errors);
			//id_post==0
			}else{
				forward=mapping.findForward("thatBai");				
			}
			
			return forward;						
	}

}
