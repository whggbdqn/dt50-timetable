package qs.classhelper.dao;

import java.util.Date;
import java.util.List;

import qs.classhelper.entity.TbCourseif;
import qs.classhelper.entity.TbCoursetable;

public interface TbCoursetableMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_coursetable
     *
     * @mbggenerated Mon Jan 22 14:17:54 CST 2018
     */
    int deleteByPrimaryKey(Integer scorenum);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_coursetable
     *
     * @mbggenerated Mon Jan 22 14:17:54 CST 2018
     */

    int insertSelective(TbCoursetable record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_coursetable
     *
     * @mbggenerated Mon Jan 22 14:17:54 CST 2018
     */
    TbCoursetable selectByPrimaryKey(Integer scorenum);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_coursetable
     *
     * @mbggenerated Mon Jan 22 14:17:54 CST 2018
     */
    int updateByPrimaryKeySelective(TbCoursetable record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_coursetable
     *
     * @mbggenerated Mon Jan 22 14:17:54 CST 2018
     */
    int updateByPrimaryKey(TbCoursetable record);
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
     * @author wangbo
     * 根据日期查当天的课程
     * 
     */
    List<TbCoursetable> getCourseScoreByDate();
    /**
     * 获取课程表信息
     * @return
     */
    List<TbCoursetable> getAllCourseInfo();
    /***
     * 获取上课老师
     * @return
     */
    List<TbCourseif> getTheachers();
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