package qs.classhelper.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
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

import qs.classhelper.dao.TbSuggestionMapper;
import qs.classhelper.entity.TbClass;
import qs.classhelper.entity.TbSuggestion;
import qs.classhelper.service.TbSuggestionService;

@Controller
@RequestMapping("/")
public class TbSuggestionController {
	@Autowired//自动注入业务层
	private TbSuggestionService tbSuggestionService;
	
	/**
	 * 支持日期转换
	 * @param wdb
	 */
	 @InitBinder
	 public  void ss(WebDataBinder wdb){
		wdb.registerCustomEditor(Date.class, 
		   new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)
		); 
	 }

	/**
	 * 获取所有建议信息
	 * 利用responsebody实现异步
	 * @return list集合
	 * @throws Exception
	 */
	@RequestMapping("getSuggestion.s")
	@ResponseBody
	public Map<String,Object> getSuggestion(Integer page,Integer rows) throws Exception{
		System.out.println(page+"="+rows);
		//设置页码page和页大小rows
		PageHelper.startPage(page, rows);
		//调用业务层
		List<TbSuggestion> list = tbSuggestionService.getSuggestion();
		//封装分页相关信息
		PageInfo pageInfo = new PageInfo(list);
		//给datagrid添加total键  记录总行数
		//给datagrid添加rows键  表示当前页的记录
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total",pageInfo.getTotal());//????
		map.put("rows",list);
		//返回map集合
		return map;
	}
	
	/**
	 * 获取所有建议信息
	 * 利用responsebody实现异步
	 * @return list集合
	 * @throws Exception
	 */
	@RequestMapping("getAllSuggestion1.s")
	@ResponseBody
	public Map<String,Object> getAllSuggestion(Integer page,Integer rows) throws Exception{
		System.out.println(page+"="+rows);
		//设置页码page和页大小rows
		PageHelper.startPage(page, rows);
		//调用业务层
		List<TbSuggestion> list = tbSuggestionService.getAllSuggestion();
		//封装分页相关信息
		PageInfo pageInfo = new PageInfo(list);
		//给datagrid添加total键  记录总行数
		//给datagrid添加rows键  表示当前页的记录
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total",pageInfo.getTotal());//????
		map.put("rows",list);
		//返回map集合
		return map;
	}
	
	/**异步批量删除建议**/
	@RequestMapping("delMoreSuggestion.s")
	@ResponseBody
	public int delMoreClass(String suggestionID) {
		String [] codes = suggestionID.split(",");
		for (int i = 0; i < codes.length; i++) {
			System.out.println(codes[i]+"=============");
		}
		int count = tbSuggestionService.batchDeleteSuggestions(codes);
		return count;
	}
	
	/**
	 * 添加建议
	 * @param tbSuggestion 对象
	 * @param request 请求
	 * @param response 转发
	 * @return 影响行数
	 * @throws Exception
	 */
	@RequestMapping("addOneSuggestion.s")
	@ResponseBody
	public int addOneClass(TbSuggestion tbSuggestion,HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		tbSuggestion.setReleasetime(new Date());
		Subject currentUser = SecurityUtils.getSubject();
	    Session session=	currentUser.getSession();
	   int id= (int)session.getAttribute("id"); 
	   tbSuggestion.setTeacherid(id);
		int count = tbSuggestionService.insert(tbSuggestion);
		return count;
	}
			
	/**
	 * 查询单条
	 * @param one 传参数
	 * @param model model对象
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("selectOneSuggestion.s")
	public String selectOneSuggestion (String one,Model model) throws Exception {
		TbSuggestion tbSuggestion = tbSuggestionService.selectByPrimaryKey(Integer.parseInt(one));
		model.addAttribute("tbSuggestion", tbSuggestion);
		return "TbSuggestionOne.jsp";
	}
			
	/**
	 * 修改建议
	 * @param tbSuggestion 对象
	 * @return 影响行数
	 * @throws Exception
	 */
	@RequestMapping("/updateOneSuggestion.s")
	@ResponseBody
	public int updateOneClass(TbSuggestion tbSuggestion) throws Exception {
		int count = tbSuggestionService.updateByPrimaryKey(tbSuggestion);
		return count;
	}
	


}
