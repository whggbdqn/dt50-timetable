package qs.classhelper.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import qs.classhelper.entity.TbExceltable;
import qs.classhelper.service.TbExceltableService;

@Controller
public class TbExceltableController {
@Autowired
private TbExceltableService  tbExceltableService;
	@RequestMapping("/uploadExcel.s")
	public void uploadExcel(@RequestParam("file") CommonsMultipartFile file,String fname,PrintWriter out,HttpServletRequest request) {
				 //2.将图片以二进制的方式存入数据库
				try {
				//设置图片实体
					TbExceltable tbExceltable=new TbExceltable();
					tbExceltable.setExceltableFilepath(file.getOriginalFilename());
					tbExceltable.setExceltableName(fname);
					tbExceltable.setExceltableType(file.getContentType());
					//设置图片?
					tbExceltable.setExceltableFile(file.getBytes());
					int count=tbExceltableService.insertSelective(tbExceltable);
					if(count>0) {
						out.print(1);
					}else {
						out.print(0);
					}
					
				
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
}
