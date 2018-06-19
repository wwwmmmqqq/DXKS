package cn.examsys.common;

import java.util.Stack;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Constitute;
import cn.examsys.bean.Option;

/**
 * 计算分数工具
 */
public class ScoreTool {

	/**
	 * 返回答案匹配程度百分比
	 * 
	 * @param type
	 * @param theOption
	 * @param answer
	 * @param thisQuestion
	 * @return
	 */
	public static float calc(String type, Option theOption, Answersheet answer,
			Constitute thisQuestion) {
		float pct = 0f;
		if (type.equals(Conf.Question_Single)) {
			pct = theOption.getIsAnswer() == 1 ? 1 : 0;
		} else if (type.equals(Conf.Question_Multiple)) {
			pct = theOption.getIsAnswer() == 1 ? 1 : 0;
		} else if (type.equals(Conf.Question_TrueOrFalse)) {
			pct = theOption.getIsAnswer() == answer.getTrueOrFalse() ? 1 : 0;
		} else if (type.equals(Conf.Question_Fills)) {
			pct = calcSimilary(theOption.getFillsText(), answer.getFillsAnswer());
		} else if (type.equals(Conf.Question_Subjective)) {
			pct = calcSimilary(theOption.getSubjectiveText(), answer.getSubjectiveAnswer());
		}
		return pct * thisQuestion.getPoint();
	}

	public static float calcSimilary(String a, String b) {
		String LCS = getLCS(a, b);
		float len = a.length() > b.length() ? a.length() : b.length();
		return LCS.length() / len;
	}

	public static String getLCS(String x, String y) {

		char[] s1 = x.toCharArray();
		char[] s2 = y.toCharArray();
		int[][] array = new int[x.length() + 1][y.length() + 1];// 此处的棋盘长度要比字符串长度多加1，需要多存储一行0和一列0

		for (int j = 0; j < array[0].length; j++) {// 第0行第j列全部赋值为0
			array[0][j] = 0;
		}
		for (int i = 0; i < array.length; i++) {// 第i行，第0列全部为0
			array[i][0] = 0;
		}

		for (int m = 1; m < array.length; m++) {// 利用动态规划将数组赋满值
			for (int n = 1; n < array[m].length; n++) {
				if (s1[m - 1] == s2[n - 1]) {
					array[m][n] = array[m - 1][n - 1] + 1;// 动态规划公式一
				} else {
					array[m][n] = max(array[m - 1][n], array[m][n - 1]);// 动态规划公式二
				}
			}
		}
		// for(int m = 0; m < array.length; m++){//将数组赋满值,这样可以从右下角开始遍历找出最大公共子序列
		// for(int n = 0; n < array[m].length; n++){
		// System.out.print(array[m][n]);
		// }
		// System.out.println();
		// }
		Stack<Character> stack = new Stack<>();
		int i = x.length() - 1;
		int j = y.length() - 1;

		while ((i >= 0) && (j >= 0)) {
			if (s1[i] == s2[j]) {// 字符串从后开始遍历，如若相等，则存入栈中
				stack.push(s1[i]);
				i--;
				j--;
			} else {
				if (array[i + 1][j] > array[i][j + 1]) {// 如果字符串的字符不同，则在数组中找相同的字符，注意：数组的行列要比字符串中字符的个数大1，因此i和j要各加1
					j--;
				} else {
					i--;
				}
			}
		}
		StringBuilder sb = new StringBuilder();
		while (!stack.isEmpty()) {
			sb.append(stack.pop());
		}
		return sb.toString();
	}

	public static int max(int a, int b) {
		return (a > b) ? a : b;
	}

}
