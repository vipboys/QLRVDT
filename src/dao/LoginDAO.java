package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Account;
import common.DataAccess;
import utils.MyException;

public class LoginDAO {

	public static Account checkLogin(String email, String passWord) throws MyException {
		Account account=null;
		ResultSet resultSet=DataAccess.layDL("SELECT * FROM ACCOUNT WHERE email='"+email.trim()+"' AND password='"+passWord.trim()+"'");
		try {
			if(resultSet.next()){
				account=new Account(resultSet.getInt("id_account"), resultSet.getString("email"), resultSet.getString("password"), resultSet.getString("fullname"), resultSet.getString("phone"), resultSet.getString("address"), resultSet.getString("role"), resultSet.getString("status"), resultSet.getString("sex"), resultSet.getString("code_mail"));
			}
		} catch (SQLException e) {
			throw new MyException(e.getMessage());
		}
		return account;
	}

}
