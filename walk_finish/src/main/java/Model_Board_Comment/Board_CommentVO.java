package Model_Board_Comment;

public class Board_CommentVO {
	
	private int num;	
	private String writer;			
	private String content;
	private int check_num;
	private String M_date;
	
	public Board_CommentVO(int num, String writer, String content, int check_num, String m_date) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.check_num = check_num;
		M_date = m_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getcheck_num() {
		return check_num;
	}

	public void setcheck_num(int check_num) {
		this.check_num = check_num;
	}

	public String getM_date() {
		return M_date;
	}

	public void setM_date(String m_date) {
		M_date = m_date;
	}
	
	
	
	
	
	
	

}
