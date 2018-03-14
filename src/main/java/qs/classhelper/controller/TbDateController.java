package qs.classhelper.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qs.classhelper.entity.TbDate;
import qs.classhelper.service.TbCoursetableService;
import qs.classhelper.service.TbDateService;

@Controller
public class TbDateController {
	@Autowired
	private TbDateService tbDateService;
	@Autowired
	private TbCoursetableService tbCoursetableService;
@RequestMapping("/getAllDate.s")
public String  getAllDate(Model model){
	
	List<TbDate> dates=tbDateService.getAllDate();
	for (TbDate tbDate : dates) {
		System.out.println(tbDate.getCount());
	}
	model.addAttribute("dates",dates);
	
	return "CourseTable.jsp";
}
@RequestMapping("/deletetable.s")
public String deletetable() {
	tbCoursetableService.deleteAllCourse();
	return "getAllDate.s";
}
}
