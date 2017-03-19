package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import bo.AdminBOQLTK;
import common.StringProcess;
import form.AdminFormQLTK;
import utils.MyException;
import utils.PageQLTK;

public class AdminActionQLTK extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8;");
		
		ActionForward forward=new ActionForward();
		ActionErrors errors=new ActionErrors();
		AdminFormQLTK formQLTK=(AdminFormQLTK)form;
		
		//Khi id_del!=0 -> Xóa tài khoản
		if(formQLTK.getId_xoa()!=0){
			try {
				AdminBOQLTK.delAccount(formQLTK.getId_xoa());
				formQLTK.setId_xoa(0);
			} catch (MyException e) {				
				System.out.println("Loi xoa tai khoan :"+ e.getMessage());
				errors.add("errorDel",new ActionMessage("error.admin.delete.account"));
				addErrors(request, errors);	
			}			
		}
		
		//Khi giá trị id_account !=0 <--> Yêu cầu cập nhật tài khoản <--> id_error để hiện của sổ khi cập nhật bị lỗi
		if(formQLTK.getId_account()!=0){
			ActionErrors temps=StringProcess.checkCreateAccount(formQLTK.getEmail(), formQLTK.getPassword(), formQLTK.getFullname(), formQLTK.getPhone(), formQLTK.getAddress(), formQLTK.getRole(), formQLTK.getStatus(), formQLTK.getSex(), formQLTK.getCode_mail());
			if(temps.isEmpty())
			{
				//Sửa thông tin account khi không có lỗi và set lại giá trị khi sửa xong
				try {
					AdminBOQLTK.changeAccount(formQLTK.getId_account(),formQLTK.getEmail().trim(),formQLTK.getPassword().trim(),formQLTK.getFullname().trim(),formQLTK.getPhone().trim(),formQLTK.getAddress().trim(),formQLTK.getRole().trim(),formQLTK.getStatus().trim(),formQLTK.getSex().trim(),formQLTK.getCode_mail().trim());
					formQLTK.setId_error(0);
					formQLTK.setId_account(0);
				} catch (MyException e) {
					System.out.println("Loi cap nhat :"+ e.getMessage());
					errors.add("errorUpDate",new ActionMessage("error.admin.update.account"));
					addErrors(request, errors);					
				}				
			}else{
				//Trường hợp request lỗi liên tục
				formQLTK.setId_error(formQLTK.getId_account());
				request.getSession().setAttribute("id_error",formQLTK.getId_account());
				errors=temps;
				addErrors(request, errors);
			}			
		}else{
			//Trường hợp cancel
			request.getSession().removeAttribute("id_error");
			formQLTK.setId_error(0);			
		}				
		
		//Phan Trang
		PageQLTK pageQLTK=new PageQLTK();		
		pageQLTK.setPageCurrent(formQLTK.getPageCurrentQLTK());
		try {
			if(formQLTK.getValueSearch().trim().equalsIgnoreCase("")){
				//Tấc tất cả dữ liệu
				pageQLTK=AdminBOQLTK.getListAccount(pageQLTK);							
				formQLTK.setDsTK(pageQLTK.getDsTK());
				request.getSession().removeAttribute("valueSearch");
			}else{
				//Lấy dữ liệu theo điều kiện và set lại giá trị khi tìm kiếm được
				pageQLTK.setWhere(formQLTK.getValueSearch().trim());
				pageQLTK=AdminBOQLTK.getListAccount(pageQLTK);
				formQLTK.setDsTK(pageQLTK.getDsTK());
				request.getSession().setAttribute("valueSearch",formQLTK.getValueSearch());
				formQLTK.setValueSearch("");				
			}
			request.getSession().setAttribute("sumPageQLTK", pageQLTK.getSumPage());
			request.getSession().setAttribute("pageCurrentQLTK", pageQLTK.getPageCurrent());
		} catch (MyException e) {
			System.out.println("Loi lay du lieu QLTK...");
			errors.add("connecttion",new ActionMessage("error.connecttion"));
			addErrors(request, errors);
			forward=mapping.findForward("thatBai");
		}	
		
		forward=mapping.findForward("thanhCong");
		return forward;
	}
	
}
