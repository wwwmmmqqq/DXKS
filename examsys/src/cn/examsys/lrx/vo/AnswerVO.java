package cn.examsys.lrx.vo;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Option;

public class AnswerVO {
	
	private Option option;
	private Answersheet answer;
	int point;
	
	
	public AnswerVO(Answersheet answer, Option option, int point) {
		this.answer = answer;
		this.option = option;
		this.point = point;
	}
	
	public Answersheet getAnswer() {
		return answer;
	}
	public Option getOption() {
		return option;
	}
	public void setAnswer(Answersheet answer) {
		this.answer = answer;
	}
	public void setOption(Option option) {
		this.option = option;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return option + "\n" + answer + " -- " + point;
	}
	
}
