package qs.classhelper.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import qs.classhelper.entity.TbClass;
import qs.classhelper.entity.TbClassVo;
import qs.classhelper.service.TbClassService;

@Controller
public class TbClassController {
	@Autowired
	private TbClassService tbClassService;
	
	
	//解决日期字符串转换问题
	@InitBinder
	public  void init(WebDataBinder wdb){
		wdb.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)); 
	}
		 
	//利用@responsebody实现异步=================>>>easyui实现分页查询
		//查询状态为1的班级
				@RequestMapping("getAllClass.s")	
				@ResponseBody
				public Map<String, Object> getAllClass(Integer page,Integer rows) throws Exception {
					//接收datagrid分页插件的页码和页大小
					//System.out.println(page+"="+rows);
					//拦截业务实现分页
					PageHelper.startPage(page,rows);
					//得到班级信息
					List<TbClass> tbList = tbClassService.getAllClassByState();
						
					PageInfo<TbClass> pageInfo=new PageInfo<TbClass>(tbList);  //封装分页相关信息
					
					//给datagrid添加total键  记录总行数
					//给datagrid添加rows键  表示当前页的记录
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("total",pageInfo.getTotal());//????
					map.put("rows",tbList);
							
					return map;
				}	
		
		//异步删除班级
//		@RequestMapping("/delOneCalss.s")
//		@ResponseBody
//		public int delOneCalss(String code) {
//			System.out.println(code);
//			int count = tbClassService.deleteByPrimaryKey(Integer.parseInt(code));
//			if(count>0) {
//				return 1;
//			}else {
//				return 0;
//			}
//		}
//		public void delOneCalss(String code,HttpServletResponse response) throws Exception{
//			PrintWriter out = response.getWriter();
//			int count = tbClassService.deleteByPrimaryKey(Integer.parseInt(code));
//			if(count>0) {
//				out.print(1);
//			}else {
//				out.print(0);
//			}
//		}
		
		/**异步批量删除班级**/
		@RequestMapping("/delMoreClass.s")
		@ResponseBody
		public int delMoreClass(String code) {
			String [] codes = code.split(",");
			List<Integer> list = new ArrayList<Integer>(); 
			for (int i = 0; i < codes.length; i++) {
				TbClass tbClass = new TbClass();
				tbClass.setClassid(Integer.parseInt(codes[i]));
				list.add(tbClass.getClassid());
			}
			int count=tbClassService.batchDeleteClasss(list);
			return count;
		}
		
		//班级录入
		@RequestMapping(value="/addOneClass.s")
		@ResponseBody
		public int addOneClass(TbClass tbClass,HttpServletRequest request,HttpServletResponse response) throws Exception{
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int count = tbClassService.insert(tbClass);
			return count;
		}
		
		//查单条
		@RequestMapping("/selectByPrimaryKey.s")
		public String selectByPrimaryKey (String i,Model model) throws Exception {
			TbClassVo tbClassVo = tbClassService.selectByPrimaryKey(Integer.parseInt(i));
			model.addAttribute("tbClass", tbClassVo);
			return "oneClass.jsp";
		}
		
		//修改
		@RequestMapping("/updateClass.s")
		@ResponseBody
		public int updateClass(TbClass tbClass) {
			int count = tbClassService.updateByPrimaryKey(tbClass);
			return count;
		}
		
		//查询班级对应的老师按班级编号
		@RequestMapping("/getTbClassAndTbTeacherByclassID.s")
		//@ResponseBody
		public String getTbClassAndTbTeacherByclassID(Model model) {
			List<TbClass> list = tbClassService.getTbClassAndTbTeacherByclassID("dt49");
			model.addAttribute("TList", list);
			return null;
			
		}
		
		//添加班级
		@RequestMapping("/addClass.s")
		@ResponseBody
		public int addClass(TbClass tbClass) {
			return tbClassService.insert(tbClass);
		}
		
		//判断是否有该班级
		@RequestMapping("/getOneClassName.s")
		@ResponseBody
		public int getOneClassName(String className) {
			return tbClassService.getOneClassName(className);
		}
		//实现逻辑删除
		@RequestMapping("/delClassWhenState.s")
		@ResponseBody
		public int delClassWhenState(String classid) {
			String[] codes = classid.split(",");
			List<Integer> list = new ArrayList<Integer>();
			int dayTotal = tbClassService.getDate(Integer.parseInt(codes[0]));
			for (int i=1;i<codes.length;i++) {
				if(dayTotal>tbClassService.getDate(Integer.parseInt(codes[i]))) {
					dayTotal=tbClassService.getDate(Integer.parseInt(codes[i]));
				}
			}
			//计算从开班到目前的上课天数
			//int daySum = tbClassService.getDate(Integer.parseInt(classid));
			//所上天数与180比较
			if(dayTotal>180) {
				for (int i=0;i<codes.length;i++) {
					list.add(Integer.parseInt(codes[i]));
				}
				int count = tbClassService.delClassWhenState(list);
				return count;
			}else {
				return 0;
			}
			
		}
		@RequestMapping(value = "/showclass.s")
		@ResponseBody
		public List<TbClass> show() {
			// 调用方法
			List<TbClass> show = tbClassService.selectclass();
			return show;
		}

}
