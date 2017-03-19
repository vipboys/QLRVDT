package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.PostLam;
import common.DataAccess;
import common.KhuVuc;
import common.StringProcess;
import utils.MyException;
import utils.PageIndex;


public class ListPostDAO {

	public static PageIndex getListPost(PageIndex index,String khuVuc, String hangSX, String gia, String sTimKiem) throws MyException{

		ArrayList<PostLam> listPost = null;

		/*---------------------------------------TẠO CÂU TRUY VẤN-----------------------------------------------------*/
		String sql = "SELECT * FROM POST WHERE DATEDIFF(DAY,dateup,GETDATE()) <= limit AND accept='TRUE'";		
		// nếu giá trị của các select đềulà all
		if ("all".equals(StringProcess.getVaildStringLam(KhuVuc.getKhuVuc(khuVuc)))
				&& "all".equals(StringProcess.getVaildStringLam(hangSX))
				&& "all".equals(StringProcess.getVaildStringLam(gia))) {
			/*sql = "SELECT * FROM POST WHERE DATEDIFF(DAY,date_post,GETDATE()) <= limit AND accept='TRUE'";*/
			sql = "SELECT * FROM POST WHERE DATEDIFF(DAY,dateup,GETDATE()) <= limit AND accept='TRUE'";
			
		}
		// neu khu vuc khong la all
		if (!"all".equals(StringProcess.getVaildStringLam(KhuVuc.getKhuVuc(khuVuc)))) {
			sql += " AND address_product=N'" + KhuVuc.getKhuVuc(khuVuc) + "'";
		}
		// Neu hang sx khong la all
		if (!"all".equals(StringProcess.getVaildStringLam(hangSX))) {
			sql += " AND type_product='" + StringProcess.getVaildStringLam(hangSX) + "'";
		}
		// Neu chuoi tim kiem khac rong
		if (!StringProcess.notVaild(sTimKiem)) {
			sql += " AND (CONTAINS(title_post,'" + sTimKiem.trim().replace(' ', '%') + "') OR CONTAINS(content_post,'"
					+ sTimKiem.trim().replace(' ', '%') + "') OR CONTAINS(address_product,'"
					+ sTimKiem.trim().replace(' ', '%') + "'))";
		}
		// Neu gia khong la all
		if (!"all".equals(StringProcess.getVaildStringLam(gia))) {
			// Gia tu 0-2t
			if ("0-2".equals(StringProcess.getVaildStringLam(gia))) {
				sql += " AND cost BETWEEN 0 AND 2000000";
			}
			// Gia thu 2-5t
			else if ("2-5".equals(StringProcess.getVaildStringLam(gia))) {
				sql += " AND cost BETWEEN 2000000 AND 5000000";
			}
			// Gia tu 5-10t
			else if ("5-10".equals(StringProcess.getVaildStringLam(gia))) {
				sql += " AND cost BETWEEN 5000000 AND 10000000";
			}
			// Gia tren 10t
			else if ("10+".equals(StringProcess.getVaildStringLam(gia))) {
				sql += " AND cost >= 10000000";
			}
		}
		// Cộng thêm điều kiện sắp xếp
		sql += " ORDER BY type_post DESC,dateup DESC ";

		/*---------------------------------------THỰC HIỆN TRUY VẤN-----------------------------------------------------*/
		index.laySoTrang(sql);
		index.layDuLieu(sql);		
		return index;
	}
}
