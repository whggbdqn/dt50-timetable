package qs.classhelper.controller;

import java.io.ByteArrayOutputStream;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import qs.classhelper.entity.TbTeacherLessons;

import qs.classhelper.service.TbTeacherLessonsService;

@Controller
public class TbTeacherLessonscontroller {
	@Autowired
	private TbTeacherLessonsService tbTeacherLessonsService;

	// 寮傛鏌ヨ
	@RequestMapping(value = "/showmore.s")
	@ResponseBody
public Map<String, Object> showstudent(Integer page, Integer rows) throws Exception {
		
//		System.out.println(page + "=" + rows);
		
		PageHelper.startPage(page, rows);
		List<TbTeacherLessons> stut = tbTeacherLessonsService.select();
		PageInfo pageInfo = new PageInfo(stut);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", stut);

		return map;

	}



	@RequestMapping(value = "/showban.s")
	@ResponseBody
public Map<String, Object> showban(Integer page, Integer rows) throws Exception {
		
//		System.out.println(page + "=" + rows);
		
		PageHelper.startPage(page, rows);
		List<TbTeacherLessons> stut = tbTeacherLessonsService.showban();
		PageInfo pageInfo = new PageInfo(stut);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", stut);

		return map;

	}


	// 鍒板Excel琛�
	@RequestMapping(value = "/down.s")
	public void downExcel(HttpServletResponse repose) {
		List<TbTeacherLessons> show = tbTeacherLessonsService.showc();
		// 鍒涘缓宸ヤ綔钖�
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 宸ヤ綔琛�
		XSSFSheet sheet = workbook.createSheet("studentinfo");
		// 鍒涘缓琛�
		XSSFRow titlerow = sheet.createRow(0);
		// 鍒涘缓琛�
		XSSFCell cell1 = titlerow.createCell(0);
		cell1.setCellValue("鏁欏憳鎬绘暟");
		XSSFCell cell2 = titlerow.createCell(1);
		cell2.setCellValue("鐝骇鍚嶇О");
		for (int i = 0; i < show.size(); i++) {

			TbTeacherLessons tbTeacherLessons = show.get(i);
			XSSFRow down = sheet.createRow(i + 1);
			// 鍒涘缓琛�
			XSSFCell c1 = down.createCell(0);
			c1.setCellValue(tbTeacherLessons.getTbTeacher().getTeachername());
			XSSFCell c2 = down.createCell(1);
			c2.setCellValue(tbTeacherLessons.getTbClass().getClassname());
		}
		// 鑾峰彇workbook鐨勫瓧鑺傛暟缁�

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		try {
			workbook.write(bos);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 涓嬭浇
		try {
			String filname = System.currentTimeMillis() + ".xlsx";
			repose.setHeader("Content-Disposition", "attachment;fileName=" + filname);
			// 璁剧疆鏈嶅姟鍣ㄨ繑鍥炲鎴风鐨勬枃浠剁被鍨�
			// response.setContentType("image/jpeg");
			repose.setContentType("application/excel");
			// 寰�鍝嶅簲娴佷腑杈撳嚭鍗冲彲
			ServletOutputStream sos = repose.getOutputStream();
			sos.write(bos.toByteArray());
			sos.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	// 鍒板Excel琛�
		@RequestMapping(value = "/downsecond.s")
		public void downExcelsecond(HttpServletResponse repose) {
			List<TbTeacherLessons> show = tbTeacherLessonsService.showc();
			// 鍒涘缓宸ヤ綔钖�
			XSSFWorkbook workbook = new XSSFWorkbook();
			// 宸ヤ綔琛�
			XSSFSheet sheet = workbook.createSheet("studentinfo");
			// 鍒涘缓琛�
			XSSFRow titlerow = sheet.createRow(0);
			// 鍒涘缓琛�
			XSSFCell cell1 = titlerow.createCell(0);
			cell1.setCellValue("鐝骇鍚嶇О");
			XSSFCell cell2 = titlerow.createCell(1);
			cell2.setCellValue("鏁欏憳鍚�");
			for (int i = 0; i < show.size(); i++) {

				TbTeacherLessons tbTeacherLessons = show.get(i);
				XSSFRow down = sheet.createRow(i + 1);
				// 鍒涘缓琛�
				XSSFCell c1 = down.createCell(0);
				c1.setCellValue(tbTeacherLessons.getTbClass().getClassname());
				XSSFCell c2 = down.createCell(1);
				c2.setCellValue(tbTeacherLessons.getTbTeacher().getTeachername());
			}
			// 鑾峰彇workbook鐨勫瓧鑺傛暟缁�

			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			try {
				workbook.write(bos);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 涓嬭浇
			try {
				String filname = System.currentTimeMillis() + ".xlsx";
				repose.setHeader("Content-Disposition", "attachment;fileName=" + filname);
				// 璁剧疆鏈嶅姟鍣ㄨ繑鍥炲鎴风鐨勬枃浠剁被鍨�
				// response.setContentType("image/jpeg");
				repose.setContentType("application/excel");
				// 寰�鍝嶅簲娴佷腑杈撳嚭鍗冲彲
				ServletOutputStream sos = repose.getOutputStream();
				sos.write(bos.toByteArray());
				sos.close();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	// 鏃堕棿鏍煎紡
	@InitBinder
	public void ss(WebDataBinder wdb) {
		wdb.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	// 瓒呯骇鏌ヨ
	@RequestMapping(value = "/super.s")
	@ResponseBody
	public Map<String, Object> show(Integer page, Integer rows) throws Exception {
	System.out.println(page + "=" + rows);
		
		PageHelper.startPage(page, rows);
		List<TbTeacherLessons> stut = tbTeacherLessonsService.showc();
		PageInfo pageInfo = new PageInfo(stut);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());
		map.put("rows", stut);

		return map;

	}
	//瀵煎嚭Excel
	// 鍒板Excel琛�
	@RequestMapping(value = "/downS.s")
	public void downExcel3(HttpServletResponse repose) {
		List<TbTeacherLessons> show = tbTeacherLessonsService.showc();
		// 鍒涘缓宸ヤ綔钖�
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 宸ヤ綔琛�
		XSSFSheet sheet = workbook.createSheet("studentinfo");
		// 鍒涘缓琛�
		XSSFRow titlerow = sheet.createRow(0);
		// 鍒涘缓琛�
		XSSFCell cell1 = titlerow.createCell(0);
		cell1.setCellValue("搴т綅鎬绘暟");
		XSSFCell cell2 = titlerow.createCell(1);
		cell2.setCellValue("鏁欏憳鍚嶇О");
		XSSFCell cell3 = titlerow.createCell(2);
		cell3.setCellValue("鏁欏憳缂栧彿");
		XSSFCell cell4= titlerow.createCell(3);
		cell4.setCellValue("鐝骇");
		XSSFCell cell5 = titlerow.createCell(4);
		cell5.setCellValue("鏁欏憳瀵嗙爜");
		XSSFCell cell6 = titlerow.createCell(5);
		cell6.setCellValue("鏁欏憳鐘舵��");
		XSSFCell cell7 = titlerow.createCell(6);
		cell7.setCellValue("鏁欏憳涓撲笟");
	
		for (int i = 0; i < show.size(); i++) {

			TbTeacherLessons tbTeacherLessons = show.get(i);
			XSSFRow down = sheet.createRow(i + 1);
			// 鍒涘缓琛�
			XSSFCell c1 = down.createCell(0);
			c1.setCellValue(tbTeacherLessons.getTbClass().getTotalnum());
			XSSFCell c2 = down.createCell(1);
			c2.setCellValue(tbTeacherLessons.getTbTeacher().getTeachername());
			XSSFCell c3 = down.createCell(2);
			c3.setCellValue(tbTeacherLessons.getTbTeacher().getTeacherjobnumber());
			XSSFCell c4 = down.createCell(3);
			c4.setCellValue(tbTeacherLessons.getTbClass().getClassname());
			XSSFCell c5 = down.createCell(4);
			c5.setCellValue(tbTeacherLessons.getTbTeacher().getTeacherpwd());
			XSSFCell c6 = down.createCell(5);
			c6.setCellValue(tbTeacherLessons.getTbTeacher().getTeacherstate());
			XSSFCell c7 = down.createCell(5);
			c7.setCellValue(tbTeacherLessons.getTbClass().getClasstype());
			
		}
		// 鑾峰彇workbook鐨勫瓧鑺傛暟缁�

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		try {
			workbook.write(bos);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 涓嬭浇
		try {
			String filname = System.currentTimeMillis() + ".xlsx";
			repose.setHeader("Content-Disposition", "attachment;fileName=" + filname);
			// 璁剧疆鏈嶅姟鍣ㄨ繑鍥炲鎴风鐨勬枃浠剁被鍨�
			// response.setContentType("image/jpeg");
			repose.setContentType("application/excel");
			// 寰�鍝嶅簲娴佷腑杈撳嚭鍗冲彲
			ServletOutputStream sos = repose.getOutputStream();
			sos.write(bos.toByteArray());
			sos.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/teacherskshow.s")
	@ResponseBody
	//异步添加方法
	public int  teacherlesson(String teachername, String classname) {
		TbTeacherLessons tbTeacherLessons=new TbTeacherLessons();
		tbTeacherLessons.setClassid(Integer.parseInt(classname));
		tbTeacherLessons.setTeacherid(Integer.parseInt(teachername));
		int count =tbTeacherLessonsService.insert(tbTeacherLessons);
		return count;
	}


}
