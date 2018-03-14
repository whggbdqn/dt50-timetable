package qs.classhelper.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import qs.classhelper.entity.TbInfo;
import qs.classhelper.service.TbInfoService;

@Controller
public class TbInfoController {
	//定义接口
		//@Autowired实现自动注入,省setter方法
		//默认按类型注入
		@Autowired
		private TbInfoService infoService;
@RequestMapping("/getAllInfo.s")
@ResponseBody
public List<TbInfo> getAllInfo(){
	List<TbInfo> list = infoService.getAllInfo();
	return list;
	
}
}
