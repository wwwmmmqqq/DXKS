package test.xy;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import cn.examsys.bean.Grade;
import cn.examsys.bean.User;

public class AAATest{
	@Test
	public void test1() {
		System.out.println("111");
	}
	
	@Test
	public void test2() {
		HSSFWorkbook wb=new HSSFWorkbook();    //创建工作簿对象
		HSSFSheet sheet=wb.createSheet("学生成绩表.xls");   //创建表
		HSSFRow row=sheet.createRow(0);                //在索引2的位置创建行(最顶端的行开始的第二行)
		HSSFFont font = wb.createFont();
        font.setFontName("仿宋_GB2312");
      /*  font.setBoldweight(HSSFFont.COLOR_RED);//粗体显示
*/        font.setFontHeightInPoints((short) 12);
		
		Grade grade=new Grade();
		String[] column = new String[]{"学号","姓名","学院","专业","班级","考试科目","成绩","总排名","本校排名"};
		List<User> userList = new ArrayList<>();
		//设置表头
		for(int i=0;i<column.length;i++) {
			HSSFCell cell=row.createCell(i);
			cell.setCellValue(column[i]);
			sheet.setColumnWidth(i, column[i].toString().getBytes().length*2*256);
		}
		//填写数据
		
		//填写实体数据，实际上这些是从数据库中得到
		/*List list = fileOutExcel.getWork();*/
		for(int i=0;i<3;i++) {
			User user1 =new User();
			user1.setUserId("15478"+i);
			user1.setName("name"+i);
			user1.setDepartment("department"+i);
			user1.setProfession("department"+i);
			user1.setClassroom("classroom"+i);
			grade.setSubjectName("subjectName"+i);
			grade.setPoint(i);
			user1.setGrade(grade);
			System.out.println(user1);
			userList.add(user1);
		}
		for(int i=0;i<userList.size();i++){
			row=sheet.createRow(i+1);     //第i行
			//创建单元格并设置值
			Object[] user = new Object[]{userList.get(i).getUserId(),userList.get(i).getName(),userList.get(i).getDepartment(),userList.get(i).getProfession(),userList.get(i).getClassroom(),userList.get(i).getGrade().getSubjectName(),userList.get(i).getGrade().getPoint(),"总排名","本校排名"};
			for(int j=0;j<user.length;j++) {
				row.createCell(j).setCellValue(user[j].toString());    //第i行第j列
				//sheet.setColumnWidth(j, user[j].toString().getBytes().length*2*256);
			}
			//将文件存入指定位置
			try {
				FileOutputStream fileOut=new FileOutputStream("d:/学生成绩表.xls");
				wb.write(fileOut);
				fileOut.close();
			} catch (Exception e) {  
			        e.printStackTrace();  
			}

		}
	}
}
