package bo;

import java.util.ArrayList;

import beans.Account;
import dao.AdminDAOQLTK;
import utils.MyException;
import utils.PageQLTK;

public class AdminBOQLTK {

	public static PageQLTK getListAccount(PageQLTK pageQLTK) throws MyException {
		return AdminDAOQLTK.getListAccount(pageQLTK);
	}

	public static boolean changeAccount(int id_account, String email, String password, String fullname, String phone,
			String address, String role, String status, String sex, String code_mail) throws MyException {
		return AdminDAOQLTK.changeAccount(id_account,email,password,fullname,phone,address,role,status,sex,code_mail);
	}

	public static boolean delAccount(int id_xoa) throws MyException {
		return AdminDAOQLTK.delAccount(id_xoa);
	}



}
