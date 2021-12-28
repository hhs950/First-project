package Model_donate;

public class donateVO {
	private String title;
	private String place;
	private String img;
	private String content;
	private int num;
	private String money;
	private String date_start;
	private String date_end;
	private String donate;
	private int stepall;
	
	
	
	public donateVO(String title, String place, String img, String content, int num, String money, String date_start,
			String date_end, String donate) {
		super();
		this.title = title;
		this.place = place;
		this.img = img;
		this.content = content;
		this.num = num;
		this.money = money;
		this.date_start = date_start;
		this.date_end = date_end;
		this.donate = donate;
	}
	public donateVO(int num, String content, String money, String date_start,
			String date_end, String donate) {
		this.num = num;
		this.content = content;
		this.money = money;
		this.date_start = date_start;
		this.date_end = date_end;
		this.donate = donate;
	}

	public donateVO(String title, String place, String img, int num) {
		this.title = title;
		this.place = place;
		this.img = img;
		this.num = num;
	}
	

	public donateVO(String title, String place, String img, String content) {
		this.title = title;
		this.place = place;
		this.img = img;
		this.content = content;
	}
	
	public donateVO(String title, String place, String img) {
		this.title = title;
		this.place = place;
		this.img = img;
	}
	
	public donateVO(int num, String content) {
		this.num = num;
		this.content = content;
	}

	public donateVO(String content) {
		this.content = content;
	}
	public donateVO(int stepall) {
		this.stepall = stepall;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getDate_start() {
		return date_start;
	}

	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}

	public String getDate_end() {
		return date_end;
	}

	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}

	public String getDonate() {
		return donate;
	}

	public void setDonate(String donate) {
		this.donate = donate;
	}
	public int getstepall() {
		return stepall;
	}
	public void setstepall(int stepAll) {
		stepall = stepAll;
	}
	
	
	
	
	
	
	
	
}
