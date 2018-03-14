package qs.classhelper.service;

import java.util.Date;
import java.util.List;

import qs.classhelper.entity.TbCourseif;
import qs.classhelper.entity.TbCoursetable;

public interface TbCoursetableService {
	 /**课表入库
	    * @author wangbo 
	    * @param record
	    * @return
	    */
	    int insert(TbCoursetable record);
	    /**
	     * @author wangbo
	     * 删除入库的记录
	     */
	    int deleteAllCourse();
	    
	    /**
	     * @author wangbo
	     * 获取整张课表
	     */
	    List<TbCoursetable> getAllCourseScore();
	    
		 /**
	     * 获取课程表信息
	     * @return
	     */
	    List<TbCoursetable> getAllCourseInfo();
	    /***
	     * 获取上课老师
	     * @return
	     */
	    List<TbCourseif > getTheachers();
	    /***
	     * 获取上课信息
	     */
	    List<TbCoursetable> getTeacherDateInfo(TbCourseif tb);
	    /***
	     * 获取时间数量
	     */
	    int getDateCount();
	    /***
	     * 查询日期
	     */
	    List<Date> getDate();
}
