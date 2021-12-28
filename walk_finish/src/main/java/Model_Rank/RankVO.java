package Model_Rank;

public class RankVO {
	
	private int rank_donate;
	private int rank_step;
	private int donate_all;
	private int step_all;
	private String id;

	
	
	
	
	
	
	public RankVO( String id, int rank_step, int step_all) {		
		this.rank_step = rank_step;		
		this.id = id;
		this.step_all = step_all;
		
	}


	public RankVO(int rank_donate,  String id, int donate_all) {
		
		this.rank_donate = rank_donate;		
		this.id = id;
		this.donate_all = donate_all;
	}
	
	
	
	
	public int getRank_donate() {
		return rank_donate;
	}
	public void setRank_donate(int rank_donate) {
		this.rank_donate = rank_donate;
	}
	public int getRank_step() {
		return rank_step;
	}
	public void setRank_step(int rank_step) {
		this.rank_step = rank_step;
	}
	public int getDonate_all() {
		return donate_all;
	}
	public void setDonate_all(int donate_all) {
		this.donate_all = donate_all;
	}
	public int getStep_all() {
		return step_all;
	}
	public void setStep_all(int step_all) {
		this.step_all = step_all;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


