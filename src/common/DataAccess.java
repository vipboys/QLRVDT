package common;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.MyException;



public class DataAccess {
	public static String dbName="QLRVDT";
	public static String username="sa";
	public static String password="26689@vt";
	static Connection con=null;
	static ResultSet rs=null;
	static Statement stmt=null;
	static PreparedStatement pstmt=null;
	static CallableStatement cstmt=null;
	
	/**
	 * Kiem tra ton tai Database va tao moi
	 * @throws MyException 
	 */
	public static void taoDB() throws MyException{
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			try {
				con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;username="+username+";password="+password+"");
				if(con!=null){
					rs=con.getMetaData().getCatalogs();
					int temps=0;
					while(rs.next()){
						String catalogs=rs.getString(1);
						if(dbName.equals(catalogs)){
							System.out.println("DataBase "+dbName+" da ton tai!");
							temps++;
							break;
						}
					}
					if(temps==0){
						stmt=con.createStatement();
						stmt.executeUpdate("CREATE DATABASE "+dbName);
						System.out.println("Tao DataBase "+dbName+" thanh cong!");
					}
				}
			} catch (SQLException e) {
				throw new MyException(e.getMessage());
			}
		} catch (ClassNotFoundException e) {
			throw new MyException(e.getMessage());
		}finally {
			dongKetNoi();
		}
	}
	
	/**
	 * Kiem tra ton tai bang va tao moi
	 * @param tenBang
	 * @throws MyException 
	 */
	/*DataAccess.taoBang("Experience", "CREATE TABLE Experience"+ 
            "(id INT NOT NULL IDENTITY (1,1), " +
            " FirstName VARCHAR(255), " + 
            " LastName VARCHAR(255), " + 
            " BrithDate DATE, " + 
            " Address VARCHAR(255), " + 
            " Phone VARCHAR(255), " + 
            " Email VARCHAR(255), " + 
            " CandidateType INT, " + 
            " ExpInYear INT, " + 
            " ProSkill VARCHAR(255), " + 
            " PRIMARY KEY ( id ))");*/
	public static boolean taoBang(String tenBang,String sqlQuery) throws MyException {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			try {
				con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+dbName+";username="+username+";password="+password+"");
				DatabaseMetaData metadata = con.getMetaData();
				ResultSet resultSet=metadata.getTables(null, null, tenBang, null);
				if(!resultSet.next())
				{
					stmt=con.createStatement();
					stmt.executeUpdate(sqlQuery);
					System.out.println("Tao bang "+tenBang+" thanh cong!");
					return true;
				}else{
					System.out.println("Bang "+tenBang+" da ton tai, khong can tao!");
					return false;
				}
				
			} catch (SQLException e) {
				System.out.println("Loi tao bang: "+e.getMessage());
				throw new MyException(e.getMessage());
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Loi: "+e.getMessage());
			throw new MyException(e.getMessage());
		}finally {
			dongKetNoi();
		}
	}
	
	/**
	 * Ham mo ket noi
	 * @return
	 * @throws MyException 
	 */
	static Connection ketNoi() throws MyException{
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+dbName+";username="+username+";password="+password+"");
			return con;				
		} catch (ClassNotFoundException e) {
			System.out.println("Loi: "+e.getMessage());
			throw new MyException(e.getMessage());
		} catch (SQLException e) {
			System.out.println("Loi ket noi server.....");
			throw new MyException(e.getMessage());
		}	
	}
	
	/**
	 * Ham dong ket noi
	 * @return
	 * @throws MyException 
	 */
	static void dongKetNoi() throws MyException{
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			if (stmt != null) {
	            stmt.close();
	        }
	        if (con != null) {
	            con.close();
	        }
			
		} catch (ClassNotFoundException e) {
			System.out.println("Loi: "+e.getMessage());
			throw new MyException(e.getMessage());
		} catch (SQLException e) {
			System.out.println("Loi dong ket noi server.....");
			throw new MyException(e.getMessage());
		}		
	}
	
	/**
	 * them du lieu su dung Statement
	 * @param sqlQuery
	 * @throws MyException 
	 */
	public static boolean truyVan(String sqlQuery) throws MyException {
		try {
			stmt=ketNoi().createStatement();
			stmt.executeUpdate(sqlQuery);
			return true;
		} catch (SQLException e) {
			System.out.println("Loi truy van: "+e.getMessage());
			throw new MyException(e.getMessage());
		}finally {
			dongKetNoi();
		}
	}
	
	/**
	 * cap nhat du lieu su dung Prepare Statement
	 * @param tenSV
	 * @param diaChi
	 * @param maSV
	 * @throws MyException 
	 */
	public static void capNhat(String tenSV,String diaChi,int maSV) throws MyException{
		String sqlQuery="UPDATE SINHVIEN SET TenSV=?, DiaChi=? WHERE MaSV=?";
		try {
			pstmt=ketNoi().prepareStatement(sqlQuery);
			pstmt.setString(1, tenSV);
			pstmt.setString(2, diaChi);
			pstmt.setInt(3, maSV);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Loi cap nhat:"+e.getMessage());
			throw new MyException(e.getMessage());
		}finally {
			dongKetNoi();
		}
	}
	
	/**
	 * lay tac ca du lieu theo ten Bang
	 * @param tableName
	 * @return
	 * @throws MyException 
	 */
	/*while(rs.next()){
		System.out.println(rs.getString("FirstName")+rs.getString("LastName"));
	}*/
	public static ResultSet layDL(String sqlQuery) throws MyException{
		try {
			stmt=ketNoi().createStatement();
			rs=stmt.executeQuery(sqlQuery);
			return rs;
		} catch (SQLException e) {
			System.out.println("Loi lay du lieu:"+e.getMessage());
			throw new MyException(e.getMessage());
		}
	}
	
	/**
	 * lay danh sach theo dia chi su dung Callable Statement
	 * @param tableName
	 * @return ArrayList
	 * @throws MyException 
	 */
	public static ArrayList<Object> layDanhSach(String tableName) throws MyException{
		ArrayList<Object> ds=new ArrayList<Object>();
		try {
			cstmt=ketNoi().prepareCall("{call sp_getViewTable(?)}");
			cstmt.setString(1, tableName);
			rs=cstmt.executeQuery();
			if(tableName.equals("Experience")){
				while(rs.next()){
					//Candidate temps=new Experience_Candidate(rs.getString("FirstName"), rs.getString("LastName"),rs.getDate("BrithDate") , rs.getString("Address"), rs.getString("Phone"), rs.getString("Email"),
					//		rs.getInt("CandidateType"),rs.getInt("ExpInYear"),rs.getString("ProSkill"));
					//ds.add(temps);
				}
			}else if(tableName.equals("Fresher")){
				while(rs.next()){
					//Candidate temps=new Fresher_Candidate(rs.getString("FirstName"), rs.getString("LastName"),rs.getDate("BrithDate") , rs.getString("Address"), rs.getString("Phone"), rs.getString("Email"),
					//		rs.getInt("CandidateType"),rs.getDate("GraduationDate"),rs.getString("GraduationRank"),rs.getString("Education"));
					//ds.add(temps);
				}
			}else if(tableName.equals("Intern")){
				while(rs.next()){
					//Candidate temps=new Intern_Candidate(rs.getString("FirstName"), rs.getString("LastName"),rs.getDate("BrithDate") , rs.getString("Address"), rs.getString("Phone"), rs.getString("Email"),
					//		rs.getInt("CandidateType"),rs.getString("Majors"),rs.getInt("Semester"),rs.getString("UniversityName"));
					//ds.add(temps);
				}				
			}
		return ds;
		} catch (SQLException e) {
			System.out.println("Ban chua tao thu tuc");
			throw new MyException(e.getMessage());		
		}
		finally {
			dongKetNoi();
		}
	}
	/*create proc sp_getViewTable
	(
		@tableName VARCHAR(50)
	)as
	begin
		IF @tableName='Experience'
			SELECT * FROM Experience;
		ELSE
			BEGIN
				IF @tableName='Fresher'
					SELECT * FROM Fresher;
				ELSE
					BEGIN
						IF @tableName='Intern'
						SELECT * FROM Intern;
					END
			END
		
	end*/
	
	/**
	 * Ham kiem tra thu tuc co ton tai hay ko? neu khong thi tao moi - neu ton tai thi xoa va tao moi!
	 * @throws MyException 
	 */
	public static void taoThuTuc() throws MyException{
		String sqlQuery1="IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('sp_getViewTable')) BEGIN DROP PROCEDURE sp_getViewTable END";
		String sqlQuery2="CREATE PROCEDURE sp_getViewTable( @tableName VARCHAR(50) )"
				+ "as begin "
						+ "IF @tableName='Experience' "
							+ "SELECT * FROM Experience; "
						+ "ELSE "
							+ "BEGIN "
								+ "IF @tableName='Fresher' "
									+ "SELECT * FROM Fresher; "
								+ "ELSE "
									+ "BEGIN "
										+ "IF @tableName='Intern' "
											+ "SELECT * FROM Intern; "
									+ "END "
							+ "END "
					+ "end";
		try {
			stmt=ketNoi().createStatement();
			stmt.execute(sqlQuery1);
			stmt.execute(sqlQuery2);
			System.out.println("Da tao xong thu tuc");
		} catch (SQLException e) {
			System.out.println("Loi tao thu tuc :"+e.getMessage());
			throw new MyException(e.getMessage());
		}finally {
			dongKetNoi();
		}
	}
}
