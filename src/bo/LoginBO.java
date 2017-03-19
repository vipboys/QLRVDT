package bo;

import beans.Account;
import dao.LoginDAO;
import utils.MyException;

public class LoginBO {

	public static Account checkLogin(String email, String passWord) throws MyException {
		Account account=null;
			account=LoginDAO.checkLogin(email,passWord);
		return account;
	}

}
