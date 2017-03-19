package action;

import common.StringProcess;
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
import beans.PostLam;
import bo.LoginBO;
import bo.PostBO;
import form.IndexForm;
import utils.MyException;
import utils.PageIndex;

public class IndexAction extends Action {
	public static String LOGIN_BLOCK="Block";
	public static String LOGIN_INACTIVE="InActive";
	public static String LOGIN_SUCCESS="Active";
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8;");
		
		ActionForward forward = new ActionForward();
		ActionErrors errors = new ActionErrors();
		IndexForm indexForm = (IndexForm) form;
		if(indexForm.getKhuVuc()==null || indexForm.getHangSX()==null || indexForm.getGia()==null || indexForm.getsTimKiem()==null){
			indexForm.setKhuVuc("");
			indexForm.setHangSX("");
			indexForm.setGia("");
			indexForm.setsTimKiem("");
		}
		//Lay du lieu list POST, neu khong co set du lieu rong--> bao loi
		try {
			PageIndex index=new PageIndex();
			index.setPageCurrent(indexForm.getPageCurrent());
			PageIndex pageIndex=PostBO.getListPost(index,indexForm.getKhuVuc(), indexForm.getHangSX(), indexForm.getGia(),indexForm.getsTimKiem());
			indexForm.setListPost(pageIndex.getDsPost());
			forward=mapping.findForward("thanhCong");
			request.getSession().setAttribute("sumPage", pageIndex.getSumPage());
			request.getSession().setAttribute("pageCurrent", pageIndex.getPageCurrent());
			System.out.println("So dong:"+pageIndex.getDsPost().size());
			System.out.println("Trang hien tai:"+pageIndex.getPageCurrent());
			System.out.println("Tong so trang:"+pageIndex.getSumPage());
			System.out.println("================================================");
		} catch (MyException e) {			
			e.printStackTrace();
			errors.add("errorIndex",new ActionMessage("error.connecttion"));
			addErrors(request, errors);
			indexForm.setListPost(new ArrayList<PostLam>());
			return mapping.findForward("thatBai");
		}
		
		//==============================================Lay du lieu dang nhap
		if(indexForm.getBtnSubmit()!=null && indexForm.getBtnSubmit().equalsIgnoreCase("Đăng Nhập")){
			String email=indexForm.getEmail();
			String passWord=indexForm.getPassWord();
			
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
					forward=mapping.findForward("thatBai");
				}
				if(nguoiDung==null){
					errors.add("invalue",new ActionMessage("error.login.invalid"));
					request.getSession().setAttribute("errorLogin", "true");					
					forward=mapping.findForward("thatBai");
				}else if(nguoiDung!=null & nguoiDung.getStatus().equalsIgnoreCase(LOGIN_BLOCK)){
					errors.add("block",new ActionMessage("error.login.block"));
					request.getSession().setAttribute("errorLogin", "true");					
					forward=mapping.findForward("thatBai");
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
			}						
		}//End Dang Nhap

		addErrors(request, errors);		
		return forward;
	}

}
