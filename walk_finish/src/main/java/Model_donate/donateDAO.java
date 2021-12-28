package Model_donate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.MemberVO;
import Model_Board.BoardVO;

public class donateDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void get_conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "walk";
			String dbpw = "walk";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<donateVO> selectAll() {
		ArrayList<donateVO> all = new ArrayList<donateVO>();
		try {
			get_conn();

			String sql = "select * from donate";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String get_title = rs.getString(1);
				String get_place = rs.getString(2);
				String get_img = rs.getString(3);
				int get_num = rs.getInt(4);
		
				donateVO vo = new donateVO(get_title, get_place, get_img, get_num);
				all.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	/*
	public ArrayList<donateVO> donate_content(int num_get) {
		ArrayList<donateVO> all = new ArrayList<donateVO>();
		try {
			get_conn();

			String sql = "select content  from donate_test where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num_get);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String get_content = rs.getString(1);
				donateVO vo = new donateVO(get_content);
				all.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	*/
	
	public donateVO donate_content(int num) {
		donateVO vo = null;
		try {
			get_conn();
			String sql = "select *  from donate_content where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				int get_num = rs.getInt(1);
				String get_content = rs.getString(2);
				String get_money = rs.getString(3);
				String get_date_start = rs.getString(4);
				String get_date_end = rs.getString(5);
				String get_donate = rs.getString(6);

				vo = new donateVO(get_num, get_content,get_money,get_date_start,get_date_end,get_donate);
			} else {
				System.out.println("donate_dao_step_today_fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("donate_dao_step_today_try_fail");
		} finally {
			close();
		}
		return vo;
	}
	
	
	public donateVO showWalk(String id) {
		donateVO vo =null;
	
		try {
			get_conn();
			
			String sql="select step_all from step_all_table where mb_id = ?";			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int stepAll = rs.getInt(1);
				vo = new donateVO(stepAll);
			}
			
		}catch (Exception e) {			
			e.printStackTrace(); 
			System.out.println("");
		} finally {
			close();			
		}
		return vo;
	}
	
	public int user_stepAll_minus(String id, int walk) {
		int cnt = 0;
		try {
			get_conn();

			String sql = "update step_all_table set step_all = (select step_all from step_all_table where mb_id = ?) - ? where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, walk);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("donate_dao_userstepall_fail");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int doante_stepAll_plus(int num, int walk) {
		int cnt = 0;
		try {
			get_conn();

			String sql = "update donate_content set donate = (select donate from donate_content where num = ?) + ? where num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.setInt(2, walk);
			psmt.setInt(3, num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("donate_dao_donatestepall_fail");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int stepAll_doante_plus(String id, int walk) {
		int cnt = 0;
		try {
			get_conn();

			String sql = "update step_all_table set donate_all = (select donate_all from step_all_table where mb_id = ?) + ? where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, walk);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("donate_dao_donatestepall_fail");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
