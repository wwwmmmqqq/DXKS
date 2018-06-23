package cn.examsys.lrx.vo;

public class HistoryGradeVO {
	String subject;
	int myScore;
	int totalScore;
	int currectPercent;
	String startTime;
	String endTime;
	
	public HistoryGradeVO(String subject, int myScore, int totalScore,
			int currectPercent, String startTime, String endTime) {
		this.subject = subject;
		this.myScore = myScore;
		this.totalScore = totalScore;
		this.currectPercent = currectPercent;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public String getSubject() {
		return subject;
	}

	public int getMyScore() {
		return myScore;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public int getCurrectPercent() {
		return currectPercent;
	}

	public String getStartTime() {
		return startTime;
	}

	public String getEndTime() {
		return endTime;
	}
	
	
}
