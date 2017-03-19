package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Account;
import common.DataAccess;
import common.StringProcess;
import utils.MyException;
import utils.PageQLTK;

public class AdminDAOQLTK {

	public static PageQLTK getListAccount(PageQLTK pageQLTK) throws MyException {
		if(pageQLTK.getWhere()==null || pageQLTK.getWhere().trim().equalsIgnoreCase(""))
		{
			//System.out.println("Tong: "+PageQLTK.Sum("ACCOUNT", ""));
			ResultSet resultSet=DataAccess.layDL(PageQLTK.Sum("ACCOUNT", ""));
			if(resultSet!=null){
				try {
					while(resultSet.next()){
						pageQLTK.setSumPage(StringProcess.TinhSoTrang(resultSet.getInt("tong"), pageQLTK.getRowInPage()));
				}
				} catch (SQLException e) {				
					throw new MyException(e.getMessage());
				}
			}
			ArrayList<Account> dsTK=null;
			//System.out.println("Gia tri"+PageQLTK.Query("ACCOUNT", "", pageQLTK.getPageCurrent(), pageQLTK.getRowInPage()));
			resultSet=DataAccess.layDL(PageQLTK.Query("ACCOUNT", "", pageQLTK.getPageCurrent(), pageQLTK.getRowInPage()));
			if(resultSet!=null) dsTK=new ArrayList<Account>();
			try {
				while(resultSet.next()){
					dsTK.add(new Account(resultSet.getInt("id_account"), resultSet.getString("email"), resultSet.getString("password"), resultSet.getString("fullname"), resultSet.getString("phone"), resultSet.getString("address"), resultSet.getString("role"), resultSet.getString("status"), resultSet.getString("sex"), resultSet.getString("code_mail")));
				}
				pageQLTK.setDsTK(dsTK);
			} catch (SQLException e) {
				throw new MyException(e.getMessage());
			}
		}
		else{
			String temps=pageQLTK.getWhere().trim().replace(' ', '%');			
			ResultSet resultSet=DataAccess.layDL(PageQLTK.Sum("ACCOUNT", "email LIKE N'%"+temps+"%' OR CONTAINS(fullname,N'%"+temps+"%') OR phone LIKE N'%"+temps+"%' OR CONTAINS(address,N'%"+temps+"%') OR role LIKE N'%"+temps+"%' OR status LIKE N'%"+temps+"%' OR CONTAINS(sex,N'%"+temps+"%') OR code_mail LIKE N'%"+temps+"%'" ));
			if(resultSet!=null){
				try {
					while(resultSet.next()){
						pageQLTK.setSumPage(StringProcess.TinhSoTrang(resultSet.getInt("tong"), pageQLTK.getRowInPage()));
					}
				} catch (SQLException e) {				
					throw new MyException(e.getMessage());
				}
			}
			ArrayList<Account> dsTK=null;
			resultSet=DataAccess.layDL(PageQLTK.Query("ACCOUNT", "email LIKE N'%"+temps+"%' OR CONTAINS(fullname,N'%"+temps+"%') OR phone LIKE N'%"+temps+"%' OR CONTAINS(address,N'%"+temps+"%') OR role LIKE N'%"+temps+"%' OR status LIKE N'%"+temps+"%' OR CONTAINS(sex,N'%"+temps+"%') OR code_mail LIKE N'%"+temps+"%'", pageQLTK.getPageCurrent(), pageQLTK.getRowInPage()));
			if(resultSet!=null) dsTK=new ArrayList<Account>();
			try {
				while(resultSet.next()){
					dsTK.add(new Account(resultSet.getInt("id_account"), resultSet.getString("email"), resultSet.getString("password"), resultSet.getString("fullname"), resultSet.getString("phone"), resultSet.getString("address"), resultSet.getString("role"), resultSet.getString("status"), resultSet.getString("sex"), resultSet.getString("code_mail")));
				}
				pageQLTK.setDsTK(dsTK);
			} catch (SQLException e) {
				throw new MyException(e.getMessage());
			}
		}
		return pageQLTK;
	}


	public static boolean changeAccount(int id_account, String email, String password, String fullname, String phone,
			String address, String role, String status, String sex, String code_mail) throws MyException {		
		return DataAccess.truyVan("UPDATE ACCOUNT SET email=N'"+email+"',password=N'"+password+"',fullname=N'"+fullname+"',phone=N'"+phone+"',address=N'"+address+"',role=N'"+role+"',status=N'"+status+"',sex=N'"+sex+"',code_mail=N'"+code_mail+"' WHERE id_account="+id_account+"");
	}


	public static boolean delAccount(int id_xoa) throws MyException {
		boolean kq=DataAccess.truyVan("UPDATE ACCOUNT SET status='Block' WHERE id_account=N'"+id_xoa+"'");
		return kq;
	}

}
