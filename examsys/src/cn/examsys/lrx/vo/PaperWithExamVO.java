package cn.examsys.lrx.vo;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Paper;

public class PaperWithExamVO {
	
	private Exam exam;
	private Paper paper;

	public PaperWithExamVO(Paper paper, Exam exam) {
		this.paper = paper;
		this.exam = exam;
	}
	
	public Exam getExam() {
		return exam;
	}
	
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	public Paper getPaper() {
		return paper;
	}
	
}
