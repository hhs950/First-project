package Model;

public class MemberVO {
	private String id;
	private String pw;
	private String nick;
	private String gender;
	private String age;
	private int age1;
	private String date;	
	private int walk_all; 		// ï¿½ï¿½Å» ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	private int walk_today; 	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	private String walk_date;	// ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Â¥?
	private int user_donate;	
	private String park_name;
	private String type;
	private String sigungu;
	private String address;
	
	
	public MemberVO(String id, String pw, String nick, String gender, int age1) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.age1 = age1;
	}
	
	public MemberVO(String park_name, String type, String sigungu, String address) {
	      this.park_name = park_name;
	      this.type = type;
	      this.sigungu = sigungu;
	      this.address = address;
	 }
	


	// vo °íÄ§ Àç¼±
	public MemberVO(String id, String pw, String nick, String gender, String age, String date, int walk_all,
			int walk_today, String walk_date, int user_donate) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.walk_all = walk_all;
		this.walk_today = walk_today;
		this.walk_date = walk_date;
		this.user_donate = user_donate;
	}
	
	

	public MemberVO(String id, String pw, String nick, String gender, String age, String date, int walk_all, int walk_today) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.walk_all = walk_all;
		this.walk_today = walk_today;
	}

	public MemberVO(String id, String pw, String nick, String gender, String age, String date) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.date = date;
	}
	
	public MemberVO(String id, String nick, String gender, String age, String date) {
		this.id = id;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.date = date;
	}
	
	public MemberVO(String id, String pw, String nick) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	public MemberVO(String id, int walk_all, int user_donate) {
		this.id = id;
		this.walk_all = walk_all;
		this.user_donate = user_donate;
	}
	
	
	public MemberVO(String id, int walk_all) {
		this.id = id;
		this.walk_all = walk_all;
	}
	public MemberVO(int walk_today, String walk_date) {
		this.walk_today = walk_today;
		this.walk_date = walk_date;
	}
	
	public MemberVO(int walk_today) {
		this.walk_today = walk_today;
	}
	
	public MemberVO(String id, String walk_date) {
		this.id = id;
		this.walk_date = walk_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public int getwalk_all() {
		return walk_all;
	}

	public void setwalk_all(int walk_all) {
		this.walk_all = walk_all;
	}

	public int getWalk_today() {
		return walk_today;
	}

	public void setWalk_today(int walk_today) {
		this.walk_today = walk_today;
	}

	public String getWalk_date() {
		return walk_date;
	}

	public void setWalk_date(String walk_date) {
		this.walk_date = walk_date;
	}

	public int getUser_donate() {
		return user_donate;
	}

	public void setUser_donate(int user_donate) {
		this.user_donate = user_donate;
	}
	
	

}
