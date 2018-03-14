package qs.classhelper.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.session.HttpServletSession;
import org.omg.CORBA.SystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import qs.classhelper.entity.TbMenu;
import qs.classhelper.entity.TbTeacher;
import qs.classhelper.service.TbMenuService;
import qs.classhelper.service.TbTeacherService;

@Controller
@RequestMapping("/")
public class TbTeacherShiroController {
	@Autowired
	private TbTeacherService tbTeacherService;

	public TbTeacherService getTbTeacherService() {
		return tbTeacherService;
	}

	public void setTbTeacherService(TbTeacherService tbTeacherService) {
		this.tbTeacherService = tbTeacherService;
	}
	private TbMenuService tbMenuService;
	
	public TbMenuService getTbMenuService() {
		return tbMenuService;
	}

	public void setTbMenuService(TbMenuService tbMenuService) {
		this.tbMenuService = tbMenuService;
	}

	@RequestMapping("login.s")
	@ResponseBody
	public String login(
			 String uname, String upwd,String inputCode,HttpServletRequest request,HttpSession session) throws Exception {
		 
		 	//~{EP6OQiV$BkJG7qU}H7~}
		 session=request.getSession();
		 String Code=session.getAttribute("randomCode").toString();
		 if(inputCode.equals(Code)){
			//~{2bJT51G05DSC;'JG7qRQ>-1;HOV$#,<4JG7qRQ>-5GB<~}
		        //~{5wSC~}Subject~{5D~}isAuthenticated()
			 Subject currentUser = SecurityUtils.getSubject();
			 if (!currentUser.isAuthenticated()) {
		        	//~{0QSC;'C{:MC\Bk7bW0N*~}UsernamePasswordToken~{6TOs~}
		            UsernamePasswordToken token=new UsernamePasswordToken(uname, upwd);
		            //rememberme
		            token.setRememberMe(true);
		            try {
		            	//~{V4PP5GB<~}
		            	request.setAttribute("token", token.getUsername());
		                currentUser.login(token);
		                
		            }
		            catch (AuthenticationException ex ) {
		            	System.out.println("111");
		            	return "1";
		            }
		            catch (NullPointerException e) {
						// TODtO: handle exception
		            	return "1";
		            }
		            
		}
		        Session session1=currentUser.getSession();
		        session1.setAttribute("name",uname);
		        return "2";	
		    	
		    }else{
		    	
		    	return "3";	
		    }

	      
	}
	@RequestMapping("getMenu.s")
	public String getMenu(Model model) {
		Subject currentUser = SecurityUtils.getSubject();
		Session session1=currentUser.getSession();
		String uname=session1.getAttribute("name").toString();
		TbTeacher tbteacher=tbTeacherService.getTbTeacher(uname);
		int dutyID=tbteacher.getDutiesid();
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		TbMenuService tbMenuService=(TbMenuService)ac.getBean("tbMenuService");
		List<TbMenu> parentMenulist=tbMenuService.gettbparentMenu(dutyID);
		model.addAttribute("parentMenulist",parentMenulist);
	
		return "index.jsp";
	}
}
