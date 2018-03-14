package qs.classhelper.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import qs.classhelper.entity.TbCourse;
import qs.classhelper.service.TbCourseService;

@Controller
public class TbCourseController {
@Autowired 
private TbCourseService tbCourseService;
//@杨菲:查询课程类型及课程节点
@RequestMapping("/getAllCcd.s")
public String getAllCourse(Model model){
	List<TbCourse> list=tbCourseService.getAllCcd();
	model.addAttribute("list", list);//第一个list为名字，第二个list为对象
	return "Course.jsp";
}

@RequestMapping("/getAllCcdByAjax.s")
@ResponseBody
public List<TbCourse> getAllCcdByAjax(){
	List<TbCourse> list=tbCourseService.getAllCcd();
	return list;
}



//添加课程类型信息
@RequestMapping("/addCourse.s")
//异步添加，返回1或者0,传对象添加
@ResponseBody
public void insertCourse(PrintWriter  out,TbCourse tbCourse){
	int count = tbCourseService.insertSelective(tbCourse);
	out.print(count);
}
//批量删除课程节点
@RequestMapping("/delNc.s")
//异步删除，返回1或者0，传id删除
@ResponseBody
public void delNc(PrintWriter  out, String str){
	String [] spilt=str.split(",");
	try {
		tbCourseService.delNodes(spilt);
	} catch (Exception e) {
		System.out.println("没有孩子节点");
	}
	int count=tbCourseService.delCourse(spilt);
	if(count>0) {
		out.print(1);
	}else {
		out.print(0);
	}
	}
//添加课程类型信息
@RequestMapping("/upCourse.s")
//异步添加，返回1或者0,传对象添加
@ResponseBody
public void updateCourse(PrintWriter  out,TbCourse tbCourse){
		int count = tbCourseService.updateByPrimaryKeySelective(tbCourse);
		out.print(count);
	
}
//@杨菲:查询课程类型,Course表
//@RequestMapping("/getAllCourse.s")
// public String getAllCourse(Model model){
//	List<TbCourse> list=tbCourseService.getAllCourse();
//	model.addAttribute("list", list);//第一个list为名字，第二个list为对象
//	return "Course.jsp";
//}
}
