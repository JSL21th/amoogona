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
		ResultSet rs = null;
		
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
			if (rs != null) try {rs.close(); } catch(Exception e){e.printStackTrace(); }
			if (pstmt != null) try{pstmt.close();}catch(Exception e){e.printStackTrace();}
			if (conn != null) try{conn.close();}catch(Exception e){e.printStackTrace();}
		}
	}
	// 분류별 또는 전체 등록된 책의 정보를 얻어내는 메소드
	public List<ShopBookDataBean> getBooks(String book_kind) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopBookDataBean> bookList = null;
		
		try {
			conn = getConnection();
			String sql1 = "select * from book";
			String sql2 = "select * from book where book_kind = ? order by reg_date desc";
			if(book_kind.equals("all"))
				pstmt = conn.prepareStatement(sql1);
			else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, book_kind);
			}
			
			rs = pstmt.executeQuery();
	
			if(rs.next()){
				bookList = new ArrayList<ShopBookDataBean>();
				do {
					ShopBookDataBean book = new ShopBookDataBean();
					book.setBook_id(rs.getInt(1));
					book.setBook_kind(rs.getString(2));
					book.setBook_title(rs.getString(3));
					book.setBook_price(rs.getInt(4));
					book.setBook_count(rs.getInt(5));
					book.setAuthor(rs.getString(6));
					book.setPublishing_com(rs.getString(6));
					book.setPublishing_date(rs.getString(7));
					book.setBook_image(rs.getString(8));
					//book.setBook_content(rs.getString(9));
					book.setDiscount_rate(rs.getByte(10));
					book.setReg_date(rs.getTimestamp(11));
					
					bookList.add(book);
					
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			if(pstmt != null) try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			if(conn != null) try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
		}
		return bookList;
	}
	
	//ㅎㅎddd
}
