package cn.examsys.common;

public class Conf {
	
	/**
	 * 题目选项类型
	 */
	public static String Question_Single = "Single";
	public static String Question_TrueOrFalse = "TrueOrFalse";
	public static String Question_Multiple = "Multiple";
	public static String Question_Fills = "Fills";
	public static String Question_Subjective = "Subjective";
	
	public static int Difficulty_1 = 1;//概念题
	public static int Difficulty_2 = 2;//概念延伸题
	public static int Difficulty_3 = 3;//综合题
	public static int Difficulty_4 = 4;//综合性强题
	
	public final static String permession_MAX="max";//最高权限
	public final static String permession_StudentManager="StudentManager";//学生菜单权限
	public final static String permession_TeacherManager="TeacherManager";//教师菜单权限
	public final static String permession_Administration="Administration";//教务菜单权限
	
}
