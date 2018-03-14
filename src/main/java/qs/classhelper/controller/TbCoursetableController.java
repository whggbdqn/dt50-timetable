package qs.classhelper.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import qs.classhelper.entity.TbCourseif;
import qs.classhelper.entity.TbCoursetable;
import qs.classhelper.entity.TbCoursetableMy;
import qs.classhelper.service.TbCoursetableService;

@Controller
public class TbCoursetableController {
@Autowired
	private TbCoursetableService  tbCoursetableService;
@RequestMapping("/insert.s")
public void insert(String jsonObj,HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException {
	ObjectMapper objectMapper= new ObjectMapper(); 
	System.out.println(jsonObj);
	TbCoursetable[] list= objectMapper.readValue(jsonObj, TbCoursetable[].class);
	
	PrintWriter out=response.getWriter();
	for (int i = 0; i < list.length; i++) {
		TbCoursetable tbCoursetable = list[i];
		tbCoursetableService.insert(tbCoursetable);
	}
	out.println(1);
	 
}
@RequestMapping("/deleteAllCourse.s")
public void truncateTable(PrintWriter out) {
	int count=tbCoursetableService.deleteAllCourse();
	System.out.println(count);
	out.print(count);
}


@RequestMapping("/downloadCourseExcel.s")
public void downloadExcel(HttpServletResponse response) throws Exception{
	//调用业务查询所有学生
	List<TbCoursetable> list=tbCoursetableService.getAllCourseScore();
	 //生成excel  HSSFWorkbook  EXCEL2003     XSSFWorkbook 2007
	//创建工作薄
	XSSFWorkbook workbook=new XSSFWorkbook();
	System.out.println(list.size());
	//工作表
	XSSFSheet sheet=workbook.createSheet("课程表");
	//创建行
	XSSFRow titleRow=sheet.createRow(0);
	//创建行
    XSSFCell cell1=titleRow.createCell(0);
	cell1.setCellValue("日期");
	XSSFCell cell2=titleRow.createCell(1);
	cell2.setCellValue("教室");
	XSSFCell cell3=titleRow.createCell(2);
	cell3.setCellValue("上午1班级");
	XSSFCell cell4=titleRow.createCell(3);
	cell4.setCellValue("上午1老师");
	XSSFCell cell5=titleRow.createCell(4);
	cell5.setCellValue("上午1课程");
	XSSFCell cell6=titleRow.createCell(5);
	cell6.setCellValue("上午2班级");
	XSSFCell cell7=titleRow.createCell(6);
	cell7.setCellValue("上午2老师");
	XSSFCell cell8=titleRow.createCell(7);
	cell8.setCellValue("上午2课程");
	XSSFCell cell9=titleRow.createCell(8);
	cell9.setCellValue("下午1班级");
	XSSFCell cell10=titleRow.createCell(9);
	cell10.setCellValue("下午1老师");
	XSSFCell cell11=titleRow.createCell(10);
	cell11.setCellValue("下午1课程");
	XSSFCell cell12=titleRow.createCell(11);
	cell12.setCellValue("下午2班级");
	XSSFCell cell13=titleRow.createCell(12);
	cell13.setCellValue("下午2老师");
	XSSFCell cell14=titleRow.createCell(13);
	cell14.setCellValue("下午2课程");
	XSSFCell cell15=titleRow.createCell(14);
	cell15.setCellValue("晚上班级");
	XSSFCell cell16=titleRow.createCell(15);
	cell16.setCellValue("晚上老师");
	XSSFCell cell17=titleRow.createCell(16);
	cell17.setCellValue("晚上课程");
	
	
	for(int i=0;i<list.size();i++){
		TbCoursetable score=list.get(i);
		System.out.println(score.getcDatetime());
		XSSFRow drow=sheet.createRow(i+1);
		//创建行
	    XSSFCell c1=drow.createCell(0);
		c1.setCellValue(score.getcDatetime());
		XSSFCell c2=drow.createCell(1);
		c2.setCellValue(score.getcClassromm());
		
		XSSFCell c3=drow.createCell(2);
		c3.setCellValue(score.getcMorning1Class());
		XSSFCell c4=drow.createCell(3);
		c4.setCellValue(score.getcMorning1Teacher());
		XSSFCell c5=drow.createCell(4);
		c5.setCellValue(score.getcMorning1Course());
		XSSFCell c6=drow.createCell(5);
		c6.setCellValue(score.getcMorning2Class());
		XSSFCell c7=drow.createCell(6);
		c7.setCellValue(score.getcMorning2Teacher());
		XSSFCell c8=drow.createCell(7);
		c8.setCellValue(score.getcMorning2Course());
		
		XSSFCell c9=drow.createCell(8);
		c9.setCellValue(score.getcAfternoon1Class());
		XSSFCell c10=drow.createCell(9);
		c10.setCellValue(score.getcAfternoon1Teacher());
		XSSFCell c11=drow.createCell(10);
		c11.setCellValue(score.getcAfternoon1Course());
		XSSFCell c12=drow.createCell(11);
		c12.setCellValue(score.getcAfternoon2Class());
		XSSFCell c13=drow.createCell(12);
		c13.setCellValue(score.getcAfternoon2Teacher());
		XSSFCell c14=drow.createCell(13);
		c14.setCellValue(score.getcAfternoon2Course());
		
		XSSFCell c15=drow.createCell(14);
		c15.setCellValue(score.getcEveningClass());
		XSSFCell c16=drow.createCell(15);
		c16.setCellValue(score.getcEveningTeacher());
		XSSFCell c17=drow.createCell(16);
		c17.setCellValue(score.getcEveningCourse());
		
	}
	
	//获取workbook的字节数组
	ByteArrayOutputStream bos=new ByteArrayOutputStream();
	workbook.write(bos);

	//下载
	try {
	    //设置文件下载
	   String filename=System.currentTimeMillis()+".xlsx";
	   response.setHeader("Content-Disposition","attachment;fileName="+filename);
	   //设置服务器返回客户端的文件类型
	   //response.setContentType("image/jpeg");
	   response.setContentType("application/excel");
	  //往响应流中输出即可
	  ServletOutputStream sos=response.getOutputStream();
	  sos.write(bos.toByteArray());
	  sos.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

@RequestMapping("/check.s")
@ResponseBody
public void  check(String jsonObj,PrintWriter out,HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
	ObjectMapper objectMapper= new ObjectMapper();
	TbCoursetable[] list= objectMapper.readValue(jsonObj, TbCoursetable[].class);
	/*System.out.println("日期\t\t\t"+"教室");
	for (TbCoursetable tbCoursetable : list) {
		System.out.println(tbCoursetable.getcDatetime()+"\t\t\t"+tbCoursetable.getcClassromm());
		
	}*/
	System.out.println(list.length);
	HttpSession session =request.getSession();
	//
	session.setAttribute("Scores",list);
	/*if(list.length>=2) {
	TbCoursetable  lastScore=  list[list.length-1];
	TbCoursetable  currentScore= list[list.length-2];
	if(lastScore.getcDatetime().equals(currentScore.getcif(lastScDatetime())) {
		if(lastScore.getcClassromm().equals(currentScore.getcClassromm()))
		{
			out.print("0");//当天该教室已选请检查后重选
			System.out.println("guiyi ");
		}
		
	}
	}*/
	
	if(list.length>=2) {
		TbCoursetable  currentScore=  list[list.length-1];
		String flag="yes";
		
		for (int i = 0; i < list.length-1; i++) {
		if(currentScore.getcDatetime().equals(list[i].getcDatetime())) {
			if(currentScore.getcClassromm().equals(list[i].getcClassromm())) {
				flag="0";
				out.print(flag);//当天该教室已选请检查后重选
			}
			
		}	
		}
		
		
		if(flag.equals("yes")) {
			for (int i = 0; i < list.length-1; i++) {
				if(currentScore.getcDatetime().equals(list[i].getcDatetime())) {
					if(currentScore.getcMorning1Teacher().equals(list[i].getcMorning1Teacher())) {
						flag="1";
						out.print(flag);//该老师上午已有课
					}
				}	
				}
		}
		if(flag.equals("yes")) {
			
			for (int i = 0; i < list.length-1; i++) {
				if(currentScore.getcDatetime().equals(list[i].getcDatetime())) {
					if(currentScore.getcAfternoon1Teacher().equals(list[i].getcAfternoon1Teacher())) {
						flag="2";
						out.print(flag);//该老师下午已有课
					}
				}	
				}
			
			
			
			
		}
	}
	
}

@RequestMapping("/Coursetable.s")
@ResponseBody
public List<TbCoursetable> Coursetable() {
	return tbCoursetableService.getAllCourseInfo();
}
@RequestMapping("printTeachertable.s")
@ResponseBody
public void printTeachertable(HttpServletResponse response) throws IOException {
	// 调用业务查询所有教师课程信息
	// 数据初加工
			List<TbCourseif> list = tbCoursetableService.getTheachers();
			for (TbCourseif tb : list) {
				List<TbCoursetableMy> list1 = new ArrayList<TbCoursetableMy>();
				TbCoursetableMy t = new TbCoursetableMy();
				List<TbCoursetable> list2 = tbCoursetableService.getTeacherDateInfo(tb);
				for (TbCoursetable tc : list2) {
					if (tc.getcMorning1Type() == 1) {
						t.setDate1(tc.getcDatetime());
						if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
								&& tc.getcClassromm() != null) {
							t.setcMorning1Class(tc.getcMorning1Class());
							t.setcMorning1Course(tc.getcMorning1Course());
							t.setcClassromm1(tc.getcClassromm());
						}
					}
					if (tc.getcMorning1Type() == 2) {
						t.setDate1(tc.getcDatetime());
						if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
								&& tc.getcClassromm() != null) {
							t.setcAfternoon1Class(tc.getcMorning1Class());
							t.setcAfternoon1Course(tc.getcMorning1Course());
							t.setcClassromm2(tc.getcClassromm());
						}
					}
					if (tc.getcMorning1Type() == 3) {
						t.setDate1(tc.getcDatetime());
						if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
								&& tc.getcClassromm() != null) {
							t.setcEveningClass(tc.getcMorning1Class());
							t.setcEveningCourse(tc.getcMorning1Course());
							t.setcClassromm3(tc.getcClassromm());
						}
					}
				}
				list1.add(t);
				tb.setInfo(list1);
			}
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getcMorning1Teacher()==null) {
					list.remove(list.get(i));
				}
			}

	// 生成excel HSSFWorkbook EXCEL2003 XSSFWorkbook 2007
	// 创建工作薄
	XSSFWorkbook workbook = new XSSFWorkbook();
	System.out.println(list.size());
	// 工作表
	XSSFSheet sheet = workbook.createSheet("教师课程表");

	for (int i = 0; i <= list.size(); i++) {
		XSSFRow drow = sheet.createRow(i);
		XSSFCell c1 = drow.createCell(0);
		XSSFCell c2 = drow.createCell(1);
		XSSFCell c3 = drow.createCell(2);
		XSSFCell c4 = drow.createCell(3);
		XSSFCell c5 = drow.createCell(4);
		XSSFCell c6 = drow.createCell(5);
		XSSFCell c7 = drow.createCell(6);
		XSSFCell c8 = drow.createCell(7);
		XSSFCell c9 = drow.createCell(8);
		XSSFCell c10 = drow.createCell(9);
		XSSFCell c11 = drow.createCell(10);
		XSSFCell c12 = drow.createCell(11);
		XSSFCell c13 = drow.createCell(12);
		XSSFCell c14 = drow.createCell(13);
		XSSFCell c15 = drow.createCell(14);
		XSSFCell c16 = drow.createCell(15);
		XSSFCell c17 = drow.createCell(16);
		if (i == 0) {
			c1.setCellValue("教师");
			c2.setCellValue("日期");
			c3.setCellValue("上午1班级");
			c4.setCellValue("上午1机房");
			c5.setCellValue("上午1课程");
			c6.setCellValue("上午2班级");
			c7.setCellValue("上午2机房");
			c8.setCellValue("上午2课程");
			c9.setCellValue("下午1班级");
			c10.setCellValue("下午1机房");
			c11.setCellValue("下午1课程");
			c12.setCellValue("上午2班级");
			c13.setCellValue("上午2机房");
			c14.setCellValue("上午2课程");
			c15.setCellValue("晚上班级");
			c16.setCellValue("晚上机房");
			c17.setCellValue("晚上课程");

		}
		// 创建行
		if (i > 0) {
			TbCourseif score = list.get(i - 1);

			c1.setCellValue(score.getcMorning1Teacher());

			c2.setCellValue(score.getInfo().get(0).getDate1());

			c3.setCellValue(score.getInfo().get(0).getcMorning1Class());

			c4.setCellValue(score.getInfo().get(0).getcClassromm1());

			c5.setCellValue(score.getInfo().get(0).getcMorning1Course());

			c6.setCellValue(score.getInfo().get(0).getcMorning1Class());

			c7.setCellValue(score.getInfo().get(0).getcClassromm1());

			c8.setCellValue(score.getInfo().get(0).getcMorning1Course());

			c9.setCellValue(score.getInfo().get(0).getcAfternoon1Class());

			c10.setCellValue(score.getInfo().get(0).getcClassromm2());

			c11.setCellValue(score.getInfo().get(0).getcAfternoon1Course());

			c12.setCellValue(score.getInfo().get(0).getcAfternoon1Class());

			c13.setCellValue(score.getInfo().get(0).getcClassromm2());

			c14.setCellValue(score.getInfo().get(0).getcAfternoon1Course());

			c15.setCellValue(score.getInfo().get(0).getcEveningClass());

			c16.setCellValue(score.getInfo().get(0).getcClassromm3());

			c17.setCellValue(score.getInfo().get(0).getcEveningCourse());
		}
	}

	// 获取workbook的字节数组
	ByteArrayOutputStream bos = new ByteArrayOutputStream();
	workbook.write(bos);

	// 下载
	try {
		// 设置文件下载
		String filename = System.currentTimeMillis() + ".xlsx";
		response.setHeader("Content-Disposition", "attachment;fileName=" + filename);
		// 设置服务器返回客户端的文件类型
		// response.setContentType("image/jpeg");
		response.setContentType("application/excel");
		// 往响应流中输出即可
		ServletOutputStream sos = response.getOutputStream();
		sos.write(bos.toByteArray());
		sos.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

@RequestMapping("info.s")
public String Courseinfo(Model model) {

	// 数据初加工
	List<TbCourseif> list = tbCoursetableService.getTheachers();
	for (TbCourseif tb : list) {
		List<TbCoursetableMy> list1 = new ArrayList<TbCoursetableMy>();
		TbCoursetableMy t = new TbCoursetableMy();
		List<TbCoursetable> list2 = tbCoursetableService.getTeacherDateInfo(tb);
		for (TbCoursetable tc : list2) {
			if (tc.getcMorning1Type() == 1) {
			
				
				if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
						&& tc.getcClassromm() != null) {
					t.setDate1(tc.getcDatetime());
					t.setcMorning1Class(tc.getcMorning1Class());
					t.setcMorning1Course(tc.getcMorning1Course());
					t.setcClassromm1(tc.getcClassromm());
				}
			}
			if (tc.getcMorning1Type() == 2) {
				
				if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
						&& tc.getcClassromm() != null) {
					t.setDate1(tc.getcDatetime());
					t.setcAfternoon1Class(tc.getcMorning1Class());
					t.setcAfternoon1Course(tc.getcMorning1Course());
					t.setcClassromm2(tc.getcClassromm());
				}
			}
			if (tc.getcMorning1Type() == 3) {
				
				if (tc.getcMorning1Class() != null && tc.getcMorning1Course() != null
						&& tc.getcClassromm() != null) {
					t.setDate1(tc.getcDatetime());
					t.setcEveningClass(tc.getcMorning1Class());
					t.setcEveningCourse(tc.getcMorning1Course());
					t.setcClassromm3(tc.getcClassromm());
				}
			}
		}
		list1.add(t);
		tb.setInfo(list1);
	}
	// 数据整合
	List<TbCourseif> m = new ArrayList<TbCourseif>();
	for (int i = 0; i < list.size(); i++) {
		int x = 1;
		TbCourseif mydata = new TbCourseif();
		mydata.setcMorning1Teacher(list.get(i).getcMorning1Teacher());
		mydata.getInfo().add(list.get(i).getInfo().get(0));
		for (int j = i + 1; j < list.size(); j++) {
			if (mydata.getcMorning1Teacher() != null) {
				if (mydata.getcMorning1Teacher().equals(list.get(j).getcMorning1Teacher())) {
					mydata.setcMorning1Teacher(list.get(j).getcMorning1Teacher());
					mydata.getInfo().add(list.get(j).getInfo().get(0));
					x = x + 1;
				}
			}
		}
		mydata.setCount(x);
		m.add(mydata);
		if(mydata.getcMorning1Teacher()==null) {
			m.remove(mydata);
		}
	}
	// 去重复
	for (int i = 0; i < m.size(); i++) {
		for (int j = i + 1; j < m.size(); j++) {
			if (m.get(j).getcMorning1Teacher() != null) {
				if (m.get(j).getcMorning1Teacher().equals(m.get(i).getcMorning1Teacher())) {
					for (int q = 1; q < m.get(i).getCount(); q++) {
						m.remove(j);
					}
				}
			}
		}
	}
	m.remove(0);
	model.addAttribute("teacher", m);
	return "Teacher.jsp";
}


	@RequestMapping("/getAllScore.s")
	@ResponseBody
	public List<TbCoursetable> getAllScore(){
		System.out.println("f");
		List<TbCoursetable> list=tbCoursetableService.getAllCourseScore();
	return list;
	}
	
}

