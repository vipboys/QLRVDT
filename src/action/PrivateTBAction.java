package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import beans.Account;

public class PrivateTBAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		
		Account nguoiDung=(Account)request.getSession().getAttribute("nguoiDung");
		if(nguoiDung!=null && nguoiDung.getId_account()!=0){
						
			System.out.println(nguoiDung.getFullname());
			forward=mapping.findForward("thanhCong");
		}else{
			forward=mapping.findForward("thatBai");			
		}		
		return forward;
	}
	
}
