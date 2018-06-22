package test.xy;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Grade;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.xy.service.XyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	private XyService service;
	
	@Test
	public void test1() {
		System.out.println(service);
	}
	
	@Test
	public void test2() {
		HSSFWorkbook wb=new HSSFWorkbook();    //创建工作簿对象
		HSSFSheet sheet=wb.createSheet("学生成绩表.xls");   //创建表
		HSSFRow row=sheet.createRow(0);                //在索引2的位置创建行(最顶端的行开始的第二行)
		
		String[] column = new String[]{"学号","姓名","学院","专业","班级","考试科目","成绩","总排名","本校排名"};
		List<User> userList = new ArrayList<>();
		/*HSSFCell cell=row.createCell(0);
		cell.setCellValue("学号");
		cell=row.createCell(1);
		cell.setCellValue("姓名");
		cell=row.createCell(2);
		cell.setCellValue("联系方式");
		cell=row.createCell(3);
		cell.setCellValue("意向部门");
		cell=row.createCell(4);
		cell.setCellValue("寝室");
		cell=row.createCell(5);
		cell.setCellValue("QQ");*/
		
		//设置表头
		for(int i=0;i<column.length;i++) {
			HSSFCell cell=row.createCell(i);
			cell.setCellValue(column[i]);
		}
		//填写数据
		
		//填写实体数据，实际上这些是从数据库中得到
		/*List list = fileOutExcel.getWork();*/
		for(int i=0;i<3;i++) {
			userList.get(i).setUserId("15478"+i);
			userList.get(i).setName("name"+i);
			userList.get(i).setDepartment("department"+i);
			userList.get(i).setProfession("profession"+i);
			userList.get(i).setClassroom("classroom"+i);
			userList.get(i).getGrade().setSubjectName("subjectName"+i);
			userList.get(i).getGrade().setPoint(i);
		}
		for(int i=0;i<userList.size();i++){
			row=sheet.createRow(i+1);
			/*work work=(work) list.get(i);*/
			//创建单元格并设置值
			Object[] user = new Object[]{userList.get(i).getUserId(),userList.get(i).getName(),userList.get(i).getDepartment(),userList.get(i).getProfession(),userList.get(i).getClassroom(),userList.get(i).getGrade().getSubjectName(),userList.get(i).getGrade().getPoint(),"总排名","本校排名"};
			row.createCell(i).setCellValue(user[i].toString());
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
