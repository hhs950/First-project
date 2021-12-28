package Model_Rank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class RankDAO {
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
	
	public ArrayList<RankVO> stepRank() {
		ArrayList<RankVO> all = new ArrayList<RankVO>();
		try {
			get_conn();

			String sql = "select DENSE_RANK() OVER (ORDER BY step_all DESC) AS rank_step, mb_id, step_all from step_all_table";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int get_rank = rs.getInt(1);
				String get_id = rs.getString(2);
				int get_step = rs.getInt(3);
				
				RankVO vo = new RankVO(get_id,get_rank, get_step);

				all.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	
	
	
	
	public ArrayList<RankVO> donateRank() {
		ArrayList<RankVO> all = new ArrayList<RankVO>();
		try {
			get_conn();

			String sql = "select DENSE_RANK() OVER (ORDER BY donate_all DESC) AS rank_step, mb_id, donate_all from step_all_table";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int get_rank = rs.getInt(1);
				String get_id = rs.getString(2);
				int get_donate = rs.getInt(3);
				
				RankVO vo = new RankVO(get_rank,get_id, get_donate);

				all.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	
	
	
	
	
	
	
	
	
	
}
