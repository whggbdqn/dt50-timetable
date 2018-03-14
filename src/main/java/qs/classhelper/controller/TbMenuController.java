package qs.classhelper.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qs.classhelper.entity.TbMenu;
import qs.classhelper.service.TbMenuService;

@Controller
@RequestMapping("/")
public class TbMenuController {
	@Autowired
	private TbMenuService tbMenuService;
	
	
	@RequestMapping("getAllParentMenu.s")
	public String getAllParentMenu(Model model) throws Exception{
		List<TbMenu> parentMenulist=tbMenuService.getAllParentMenu();
		model.addAttribute("parentMenulist", parentMenulist);
		return "index.jsp";
	}
	

}
