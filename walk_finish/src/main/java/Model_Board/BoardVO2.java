package Model_Board;

import java.util.Date;

public class BoardVO2{
   private int num;
   private String title;
   private String writer;         
   private String content;
   private Date M_date;
   
   // 게시판 날짜순으로 정렬하고 싶어서 date >> vo2 만듬 
   
   public BoardVO2(int num, String title, String writer, String content, Date m_date) {
      super();
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
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Date getM_date() {
      return M_date;
   }
   public void setM_date(Date m_date) {
      M_date = m_date;
   }
   
}