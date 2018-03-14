package qs.classhelper.controller;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import qs.classhelper.entity.TbClassnode;
import qs.classhelper.service.TbClassnodeService;
import qs.classhelper.service.TbTeacherService;
@Controller
public class TbClassnodeController {
@Autowired
private TbClassnodeService tbClassnodeService;
@Autowired
private TbTeacherService tbTeacherService;
@RequestMapping("/getAllNodeByClass.s")
@ResponseBody
public List<TbClassnode> getAllNodeByClass(String classname,String teachername){
	System.out.println(teachername);
	int position=tbTeacherService.getPositionByName(teachername);
	
	if(position==2) {
    List<TbClassnode> nodes=tbClassnodeService.getAllNCtoCourse();
    return nodes;
	}
	if(position==1)  {
	List<TbClassnode> nodes=tbClassnodeService.getAllNodeByClass(classname);
	return nodes;
		}
	return null;
}

//批量删除课程节点
@RequestMapping("/delCn.s")
//异步删除，返回1或者0，传id删除
@ResponseBody
public void delCn(PrintWriter  out, String str){
	String [] spilt=str.split(",");
	int count=tbClassnodeService.delClassnode(spilt);
	if(count>0) {
		out.print(1);
	}else {
		out.print(0);
	}
	}
//添加课程类型信息
@RequestMapping("/addClassnode.s")
//异步添加，返回1或者0,传对象添加
@ResponseBody
public void insertClassnode(PrintWriter  out,TbClassnode tbClassnode){
	int count = tbClassnodeService.insertSelective(tbClassnode);
	out.print(count);
}
}
