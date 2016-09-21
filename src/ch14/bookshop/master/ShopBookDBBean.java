package ch14.bookshop.master;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class ShopBookDBBean {
	private static ShopBookDBBean instance = new ShopBookDBBean();
	
	public static ShopBookDBBean getInstance(){
		return instance;
		
	}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/JSL");
		return ds.getConnection();
	}
	
	
	//manager login
	public int managerCheck(String id, String passwd) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try{
			conn=getConnection();
			pstmt = conn.prepareStatement("select managerPasswd from manager where managerid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				dbpasswd = rs.getString(1);
				if (dbpasswd.equals(passwd)){
					x=1;	//login success
				}else{
					x=0;	//passwd not matching
				}
			}else{
				x=-1;	// id not exist
			}
			
		}catch(Exception ex){
			
		}finally{
			if (rs != null) try{rs.close();}catch(Exception e){e.printStackTrace();}
			if (pstmt != null) try{pstmt.close();}catch(Exception e){e.printStackTrace();}
			if (conn != null) try{conn.close();}catch(Exception e){e.printStackTrace();}
		}
		return x;
	}
	
	public void insertBook(ShopBookDataBean book) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt= null;
		
		try{
			String sql = "insert into book values(?,?,?,?,? ,?,?,?,?,? ,?,?)";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,book.getBook_id());
            pstmt.setString(2, book.getBook_kind());
            pstmt.setString(3, book.getBook_title());
            pstmt.setInt(4, book.getBook_price());
            pstmt.setShort(5, book.getBook_count());
            pstmt.setString(6, book.getAuthor());
            pstmt.setString(7, book.getPublishing_com());
			pstmt.setString(8, book.getPublishing_date());
			pstmt.setString(9, book.getBook_image());
			pstmt.setString(10, book.getBook_content());
			pstmt.setByte(11,book.getDiscount_rate());
			pstmt.setTimestamp(12, book.getReg_date());
			
            pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (pstmt != null) try{pstmt.close();}catch(Exception e){e.printStackTrace();}
			if (conn != null) try{conn.close();}catch(Exception e){e.printStackTrace();}
		}
	}
}
