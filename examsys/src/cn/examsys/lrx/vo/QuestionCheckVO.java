package cn.examsys.lrx.vo;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public class QuestionCheckVO {
	Question question;
	Answersheet answer;
	Option option;
	
	public QuestionCheckVO(Question question, Answersheet answer, Option currectAnswer) {
		this.question = question;
		this.answer = answer;
		this.option = currectAnswer;
	}
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public Answersheet getAnswer() {
		return answer;
	}
	public void setAnswer(Answersheet answer) {
		this.answer = answer;
	}
	public Option getOption() {
		return option;
	}
	public void setOption(Option option) {
		this.option = option;
	}
	
}
