package Model_Board;

public class BoardVO {
	private int num;
	private String title;
	private String writer;			
	private String content;
	private String M_date;
	
	
	
	
	
	
	public BoardVO(int num, String title, String writer, String content, String m_date) {		
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		M_date = m_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getM_date() {
		return M_date;
	}
	public void setM_date(String m_date) {
		M_date = m_date;
	}
	
	
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		content = content;
	}
	
	

}
