package cn.examsys.lrx.vo;

import java.util.List;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public class QuestionCheckVO {
	Question question;
	List<Option> options;
	Answersheet answer;
	
	public QuestionCheckVO(Question question, Answersheet answer) {
		this.question = question;
		this.answer = answer;
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
	public List<Option> getOptions() {
		return options;
	}
	public void setOptions(List<Option> options) {
		this.options = options;
	}
	
}
