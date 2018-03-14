package qs.classhelper;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import qs.classhelper.entity.TbTeacher;
import qs.classhelper.service.TbTeacherService;



public class test {
	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		TbTeacherService tbTeacherService=(TbTeacherService)ac.getBean("tbTeacherService");
		String teacherName="��ʿ��";
		TbTeacher tbTeacher=tbTeacherService.getTbTeacher(teacherName);
		System.out.println(tbTeacher.getTeacherpwd());
	}
	
}
