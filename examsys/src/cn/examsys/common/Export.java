package cn.examsys.common;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.examsys.bean.User;

public class Export {
	public void ExportUserScore(String title, List<User> userList, OutputStream out) {
		HSSFWorkbook wb=new HSSFWorkbook();    //创建工作簿对象
		HSSFSheet sheet=wb.createSheet(title);   //创建表
		HSSFRow row=sheet.createRow(0);                //在索引2的位置创建行(最顶端的行开始的第二行)
		HSSFCellStyle style = wb.createCellStyle();    //创建样式
		style.setWrapText(true);  
        
		String[] column = new String[]{"学号","姓名","学院","专业","班级","考试科目","成绩","总排名","本校排名"};
		String[] paper = new String[]{"标题","科目","总时长","总分值","单选题","多选题","填空题","判断题","简答题"};
		
		//设置表头
		if(title.contains("成绩")) {
			for(int i=0;i<column.length;i++) {
				HSSFCell cell=row.createCell(i);
				cell.setCellValue(column[i]);
			}
			//填写实体数据，实际上这些是从数据库中得到
			for(int i=0;i<userList.size();i++){
				row=sheet.createRow(i+1);     //第i行
				//创建单元格并设置值
				Object[] user = new Object[]{userList.get(i).getUserId(),userList.get(i).getName(),userList.get(i).getDepartment(),userList.get(i).getProfession(),userList.get(i).getClassroom(),userList.get(i).getGrade().getSubjectName(),userList.get(i).getGrade().getPoint(),"总排名","本校排名"};
				for(int j=0;j<user.length;j++) {
					row.createCell(j).setCellValue((user[j]+"").toString());    //第i行第j列
					if(user[j]  instanceof Integer) {
						sheet.setColumnWidth(j, (user[j]+"").toString().getBytes().length*5*256);
					}else{
						sheet.setColumnWidth(j, (user[j]+"").toString().getBytes().length*2*256);
					}
				} 
			}
		}
		
		//填写实体数据，实际上这些是从数据库中得到
		/*for(int i=0;i<3;i++) {
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
				row.createCell(j).setCellValue((user[j]+"").toString());    //第i行第j列
				sheet.setColumnWidth(j, (user[j]+"").toString().getBytes().length*2*256);
			}
			//填写实体数据，实际上这些是从数据库中得到
			for(int i=0;i<userList.size();i++){
				row=sheet.createRow(i+1);     //第i行
				//创建单元格并设置值
				Object[] user = new Object[]{userList.get(i).getUserId(),userList.get(i).getName(),userList.get(i).getDepartment(),userList.get(i).getProfession(),userList.get(i).getClassroom(),userList.get(i).getGrade().getSubjectName(),userList.get(i).getGrade().getPoint(),"总排名","本校排名"};
				for(int j=0;j<user.length;j++) {
					row.createCell(j).setCellValue((user[j]+"").toString());    //第i行第j列
					if(user[j]  instanceof Integer) {
						sheet.setColumnWidth(j, (user[j]+"").toString().getBytes().length*5*256);
					}else{
						sheet.setColumnWidth(j, (user[j]+"").toString().getBytes().length*2*256);
					}
				} 
			}
		}*/	
	    try {  
	    	HttpServletResponse response = ServletActionContext.getResponse();//初始化HttpServletResponse对象  
	    	title = new String( title.getBytes("gb2312"), "ISO8859-1" );       
	    	response.setHeader("Content-disposition","attachment; filename="+title+".xls");//filename是下载的xls的名，建议最好用英文  
	    	response.setContentType("application/msexcel;charset=UTF-8");//设置类型  
	    	response.setHeader("Pragma","No-cache");//设置头  
	    	response.setHeader("Cache-Control","no-cache");//设置头  
	    	response.setDateHeader("Expires", 0);//设置日期头  
	    	out = response.getOutputStream();
	    	wb.write(out);  
	    	out.flush(); 
	    	out.close();  
	    } catch (IOException e) {  
	    e.printStackTrace();  
	    }
	}
}
