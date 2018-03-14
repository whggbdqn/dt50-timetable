package qs.classhelper.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbCoursetableMapper;
import qs.classhelper.entity.TbCourseif;
import qs.classhelper.entity.TbCoursetable;
import qs.classhelper.service.TbCoursetableService;
@Service
public class TbCoursetableServiceImpl implements TbCoursetableService{
@Autowired
private TbCoursetableMapper tbCoursetableMapper;
	@Override
	public int insert(TbCoursetable record) {
		// TODO Auto-generated method stub
		return tbCoursetableMapper.insert(record);
	}
	@Override
	public int deleteAllCourse() {
		
		return tbCoursetableMapper.deleteAllCourse();
	}
	@Override
	public List<TbCoursetable> getAllCourseScore() {
		// TODO Auto-generated method stub
		return tbCoursetableMapper.getAllCourseScore();
	}
	
	@Override
	public List<TbCoursetable> getAllCourseInfo() {
		return tbCoursetableMapper.getAllCourseInfo();
	}
	@Override
	public List<TbCourseif > getTheachers() {
		// TODO Auto-generated method stub
		return tbCoursetableMapper.getTheachers();
	}
	@Override
	public List<TbCoursetable> getTeacherDateInfo(TbCourseif tb1) {
		// TODO Auto-generated method stub
		return tbCoursetableMapper.getTeacherDateInfo(tb1);
	}

	/*public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		TbCoursetableService b = (TbCoursetableService) ctx.getBean("tbCoursetableServiceImpl");
		List<TbCourseif> theachers = b.getTheachers();
		for (TbCourseif tbCourseif : theachers) {
			System.out.println(tbCourseif.getcMorning1Teacher()+":"+tbCourseif.getcDatetime());
		}
	}*/
	@Override
	public int getDateCount() {
		return tbCoursetableMapper.getDateCount();
	}
	@Override
	public List<Date> getDate() {
		return tbCoursetableMapper.getDate();
	}
}
