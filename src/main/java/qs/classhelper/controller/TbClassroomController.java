package qs.classhelper.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import qs.classhelper.entity.TbClass;
import qs.classhelper.entity.TbClassroom;
import qs.classhelper.entity.TbCoursetable;
import qs.classhelper.service.TbClassService;
import qs.classhelper.service.TbClassroomService;

@Controller
public class TbClassroomController {
	@Autowired
	private TbClassroomService tbClassroomService;
	@Autowired
	private TbClassService tbClassService;
@RequestMapping("/showAllTbClassroom.s")
@ResponseBody
public List<TbClassroom> getAllTbClassroom(String dateTime){
	List<TbClassroom> classrooms=tbClassroomService.getAllTbClassroom();
	System.out.println("age"+dateTime);
	return classrooms;
}

@RequestMapping("/getClassBySize.s")
@ResponseBody
public  List<TbClass >  getClassBySize(String name,String date,HttpSession session){
	//System.out.println(name);
	int size=tbClassroomService.getSizeByClassroom(name);
	//System.out.println(size);
	System.out.println(date);
	List<TbClass > list=tbClassService.getClassBySize(size);
	TbCoursetable[] scores= (TbCoursetable[]) session.getAttribute("Scores");
   if(scores!=null) {
	for (int i = 0; i < scores.length; i++) {
			 if(scores[i].getcDatetime().equals(date)) {
			  //c[i]=	 scores[i].getcMorning1Class();
				 for (int j = 0; j < list.size(); j++) {
					 if(scores[i].getcMorning1Class().equals(list.get(j).getClassname()))
						 list.remove(j);
				}
			
		}
			 
	 		
			
	}
	
   }
	
	//System.out.println(list.size());
	return   list;
}


/**
 * @author lixuan
 * @param meode
 * @param request
 * @return
 */

//查询所有教室
@RequestMapping("/shwoTbClassroom.s")
public  String showAll(Model meode,HttpServletRequest request) {
	List<TbClassroom> list=tbClassroomService.getAllTbClassroom();
	meode.addAttribute("list",list);
	meode.addAttribute("ip",request.getRemoteAddr());
	//获取客户端ip地址
	request.getRemoteAddr();
	return "shwo.jsp";
}

  //通过ID删除教室
@RequestMapping("/deleTbClassroom.s")
public String deleteByPrimaryKey(Integer roomid) {
	int temp=tbClassroomService.deleteByPrimaryKey(roomid);
	if(temp>0) {
		return "shwoTbClassroom.s";
	}else {
		return "shwoTbClassroom.s";
	}
	
}

//添加教室信息
@RequestMapping("/insertTbClassroom.s")
public  String insert(TbClassroom tbClassroom) {
	  int count=tbClassroomService.insert(tbClassroom);
	 if(count>0) {
		 return "shwoTbClassroom.s";
	 } else {
		 return "shwoTbClassroom.s";
	 }
}

//查询单条
@RequestMapping("/selectOneTbClassroom.s")
public String selectOneTbClassroom(String roomid,Model model) {
	 TbClassroom tbClassroom = tbClassroomService.selectByPrimaryKey(Integer.parseInt(roomid));
	 model.addAttribute("tbClassroom", tbClassroom);
	return "opp.jsp";
	 
}
//更改信息k
@RequestMapping("updateClassRoom.s")
@ResponseBody
public TbClassroom updateTbClassroom(TbClassroom record) {
	
	 int count = tbClassroomService.updateByPrimaryKeySelective(record);
	 if(count>0) {
		 return record;
	 }
	 return null;
};

}
