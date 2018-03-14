package qs.classhelper.service;

import qs.classhelper.entity.TbTeacharinfo;

public interface TbTeacharinfoService {
	
	
	 /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_teacharinfo
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int insert(TbTeacharinfo record);
    
    
    /**
     * 查询单个对象
     * @param teacherID
     * @return
     */
    TbTeacharinfo getTbTeacharinfo(Integer teacherID);
    
    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(TbTeacharinfo record);
    
}