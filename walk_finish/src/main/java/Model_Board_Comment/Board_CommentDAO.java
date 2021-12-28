package Model_Board_Comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.MemberVO;


public class Board_CommentDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	PreparedStatement psmt1 = null;
	ResultSet rs = null;
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("연결성공");
		
			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "walk";
			String db_pw = "walk";
		
			conn=DriverManager.getConnection(db_url, db_id, db_pw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {		
		try {
				if(rs!=null) {
					rs.close();
				}
				if(psmt !=null) {
					psmt.close();
				}
				if(conn!=null) {
					conn.close();
				}			
		} catch (SQLException e) {				
			e.printStackTrace();
		}
	}
	
	public int comment_write(String writer,String content, int checknum) {
		int cnt=0;
		try {
			getConn();
			
			String sql = "insert into write_comment_table values(num_comment_message.nextval,?,?,?,sysdate)";
			psmt=conn.prepareStatement(sql);			
			psmt.setString(1, writer);
			psmt.setString(2, content);
			psmt.setInt(3, checknum);
			
						
			cnt=psmt.executeUpdate();						
			
		} catch (Exception e) {			
			e.printStackTrace(); 
			System.out.println("오류1");
		} finally {
			close();			
		}
		return cnt;		
		
	}
	
	
	
	
	
	public ArrayList<Board_CommentVO> showCommentWrite(int check_num) {
		ArrayList<Board_CommentVO> list = new ArrayList<Board_CommentVO>();	
		
		try {
			
			
			getConn();							
			
			String sql = "select * from write_comment_table where check_num=?";			
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1,check_num);
			
			
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {				
				int num = rs.getInt("num");				
				String writer =rs.getString("writer");
				String content =rs.getString("content");
				check_num =rs.getInt("check_num");
				String M_date = rs.getString("m_date");
				
				
				Board_CommentVO vo = new Board_CommentVO(num, writer, content, check_num, M_date);
				
				list.add(vo);								
			
			}	
		} catch (Exception e) {			
			e.printStackTrace(); 
			System.out.println("실패4");
		} finally {
			close();			
		}
		return list;
	}
	
	
	public int commentdelete(int num) {
		int cnt = 0;
		try {
			getConn();

			String sql = "delete from write_comment_table where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			close();
		}
		return cnt;
	}
	
	
	public int commentupadate(String content , int num) {
		int cnt = 0;
		try {
			getConn();
			System.out.println(content);
			System.out.println(num);

			String sql = "update write_comment_table set content =? where num = ?";			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content);			
			psmt.setInt(2, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			close();
		}
		return cnt;
	}
	
	
	
	
	
	

}
