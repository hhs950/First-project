package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
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

	public MemberVO login(String id, String pw) {
		MemberVO vo = null;
		try {
			get_conn();

			String sql = "select mb_id, mb_pw, mb_nickname, mb_gender, mb_age from member_table where mb_id = ? and mb_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();

			if (rs.next()) {
				System.out.println("�α��� ����!");
				String get_email = rs.getString(1);
				String tel = rs.getString(2);
				String nick = rs.getString(3);
				String gender = rs.getString(4);
				int age = rs.getInt(5);

				vo = new MemberVO(get_email, tel, nick, gender, age);
			} else {
				System.out.println("�α��� ����");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�α��� ����");
		} finally {
			close();
		}
		return vo;
	}

	@SuppressWarnings("finally")
	public int update(String id, String pw, String nick) {
		int cnt = 0;
		try {
			get_conn();

			String sql = "update member_table set mb_pw = ?, mb_nickname = ? where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, nick);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("��������!");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int join(String id, String pw, String nick, String gender, int age) {
		int cnt = 0;
		String ADMIN_YN = null;
		try {
			get_conn();
			
			
			if(id.equals("admin"))
				ADMIN_YN = "Y";
			else
				ADMIN_YN = "N";
				
			String sql = "insert into member_table values(?,?,?,?,?,sysdate,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setString(4, gender);
			psmt.setInt(5, age);
			psmt.setString(6, ADMIN_YN);
			cnt = psmt.executeUpdate();

		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			close();
		}
		return cnt;
	}

	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> all = new ArrayList<MemberVO>();
		try {
			get_conn();

			String sql = "select mb_id, mb_nickname, mb_gender, mb_age, mb_joindate from member_table";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String get_id = rs.getString(1);
				String get_nick = rs.getString(2);
				String get_gender = rs.getString(3);
				String get_age = rs.getString(4);
				String get_date = rs.getString(5);
				

				MemberVO vo = new MemberVO(get_id,get_nick,get_gender,get_age,get_date);

				all.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return all;
	}
	

	public int delete(String id) {
		int cnt = 0;
		try {
			get_conn();

			String sql = "delete from member_table where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			close();
		}
		return cnt;
	}

	public boolean emailCheck(String id) {
		boolean check = false;
		try {
			get_conn();

			String sql = "select mb_id from member_table where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
	
	
	
	
	public ArrayList<MemberVO> ChartData(String id) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			get_conn();
			
			String sql = "select reg_date, sum(step_count) from step_table where mb_id = ? and reg_date between TO_char(sysdate-6, 'YYYY-MM-DD')  and TO_char(sysdate, 'YYYY-MM-DD') group by reg_date order by reg_date desc";
			
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String date = rs.getString(1);
				int num = rs.getInt(2);
				MemberVO vo = new MemberVO(num, date);
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("����!");
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	// -------------------------------------������-------------------------------------------------- 
			public int step(int step, String id) {
				int cnt = 0;
				try {
					get_conn();
						
					String sql = "insert  into step_table values(step_table_SEQ.nextval,?,?,(SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL))";
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, step);
					psmt.setString(2, id);
					cnt = psmt.executeUpdate();

				} catch (Exception e) { 
					e.printStackTrace(); 
				} finally { 
					close();
				}
				return cnt;
			}
			
			
			
	//---------------------------------------------------------------------------------------------		
			
			public int stepAll(String id, int walk) {
				int cnt = 0;
				try {
					get_conn();

					String sql = "update step_all_table set step_all = (select step_all from step_all_table where mb_id = ?) + ? where mb_id = ?";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setInt(2, walk);
					psmt.setString(3, id);

					cnt = psmt.executeUpdate();

				} catch (Exception e) {
					System.out.println("dao_stepALL����");
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;
			}
			
	//------------------------------���� ��ħ �缱---------------------------------------------------------------
			public MemberVO walk_all(String id) {
				MemberVO vo = null;
				try {
					get_conn();
					String sql = "select * from step_all_table where mb_id in ?";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);

					rs = psmt.executeQuery();

					if (rs.next()) {
						String get_id = rs.getString(1);
						int get_walk = rs.getInt(2);
						int get_donate = rs.getInt(3);

						vo = new MemberVO(get_id, get_walk, get_donate);
					} else {
						System.out.println("dao_walk_all����");
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("dao_walk_all����");
				} finally {
					close();
				}
				return vo;
			}
			
			
			
			
	//---------------------------������ ���� select-----------------------------------------------------------------
			public MemberVO step_today(String id, String date) {
				MemberVO vo = null;
				try {
					get_conn();
					String sql = "select sum(step_count) from step_table where mb_id = ? and reg_date = ?";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, date);

					rs = psmt.executeQuery();

					if (rs.next()) {
						int get_walk = rs.getInt(1);

						vo = new MemberVO(get_walk);
					} else {
						System.out.println("dao_step_today����");
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("dao_step_today����");
				} finally {
					close();
				}
				return vo;
			}
			
			
			
	//------------------------------�缱 ���� ��ħ@@@@@@@@@@@-----------------------------------------------------		
			public MemberVO walk_today(String id) {
				MemberVO vo = null;
				try {
					get_conn();
					String sql = "select sum(step_count),mb_id, reg_date from step_table where mb_id = ? group by mb_id,reg_date  order by reg_date desc";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);

					rs = psmt.executeQuery();

					if (rs.next()) {
						String get_id = rs.getString(2);
						String get_date = rs.getString(3);

						vo = new MemberVO(get_id, get_date.substring(0,10));
					} else {
						System.out.println("dao walk_totay");
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("dao walk_totay2");
				} finally {
					close();
				}
				return vo;
			}
			
			
			
			
			
	//---------------------------------------------------------------------------------------------
			public int step_day(String id, String date) {
				int cnt = 0;
				try {
					get_conn();

					String sql = "update step_day_table set walk_day = (select sum(step_count) from step_table where mb_id = ? and reg_date = ?) where mb_id = ?";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setString(2, date);
					psmt.setString(3, id);

					cnt = psmt.executeUpdate();
					System.out.println(cnt);

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;
			}
			
			
			
			
	//---------------------------------------------------------------------------------------------
			public int step_all_0(String id) {
				int cnt = 0;
				try {
					get_conn();

					String sql = "insert into step_all_table values(?,0,0)";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);

					cnt = psmt.executeUpdate();

				} catch (Exception e) {
					System.out.println("DAO_step_all_0");
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;
			}
			
			
			
	//---------------------------------------------------------------------------------------------
			public int step_day_0(String id) {
				int cnt = 0;
				try {
					get_conn();

					String sql = "insert into step_day_table values(step_day_table_SEQ.nextval,?,0,sysdate,(select to_char(sysdate, 'day') from dual))";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					cnt = psmt.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("DAO_step_day_0!");
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;
			}
			
			
			
	//---------------------�缱 ���� ��ħ@@@@@@@@--------------------------------------------------
			public int step_0(String id) {
				int cnt = 0;
				try {
					get_conn();

					String sql = "insert into step_table values(step_table_SEQ.nextval,0,?,(SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL))";
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					cnt = psmt.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("DAO_step_0!");
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;
			}
			

	         public ArrayList<MemberVO> name_find(String sigungu, String dong) {
	            ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	            try {
	               get_conn();

	               String sql = "select park_name, type, sigungu, address from park_table where sigungu = ? and address like ? ";
	               psmt = conn.prepareStatement(sql);
	               psmt.setString(1, sigungu);
	               psmt.setString(2, "%"+dong+"%");

	               rs = psmt.executeQuery();

	               while (rs.next()) {
	                  
	                  String park_name = rs.getString(1);
	                  String type = rs.getString(2);
	                  String sigungu1 = rs.getString(3);
	                  String address = rs.getString(4);

	                  list.add(new MemberVO(park_name, type, sigungu1,address));
	               }
	            } catch (Exception e) {
	               e.printStackTrace();
	            } finally {
	               close();
	            }
	            return list;
	         }
	         
	         

}
