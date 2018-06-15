package cn.examsys.lrx.dao;

public interface ExamDao {
	<T> T findExamById(int sid);
	
}
