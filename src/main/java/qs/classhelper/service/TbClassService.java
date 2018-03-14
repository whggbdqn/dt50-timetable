package qs.classhelper.service;

import java.util.List;

import qs.classhelper.entity.TbClass;
import qs.classhelper.entity.TbClassVo;

public interface TbClassService {
	 //wangbo:根据机房大小查班级
    List<TbClass> getClassBySize(int size);
    
    
    /**
	 * 添加班级时，判断是否有该班级
	 * @param className
	 * @return
	 */
	public int getOneClassName(String className); 
	/**
	 * 计算从开班到目前的上课天数
	 * @return
	 */
	public int getDate(Integer classID);
	/**
	 * 查询所有班级
	 * @return  班级集合
	 */
	public List<TbClass> getAllClass();
	
	/**
	 * 查询状态为1的班级
	 * @return
	 */
	public List<TbClass> getAllClassByState(); 
	/**
	 * 实现逻辑删除
	 * @param classid
	 * @return
	 */
	public int delClassWhenState(List<Integer> classIDs);
    
    /**
	 * 查询班级对应的老师按班级编号
	 * @param className
	 * @return
	 */
	public List<TbClass> getTbClassAndTbTeacherByclassID(String className);
	/**
	 * 批量删除班级
	 * @param classIDs
	 */
	public int batchDeleteClasss(List<Integer> classIDs);
	
	/**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_class
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int deleteByPrimaryKey(Integer classid);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_class
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int insert(TbClass record);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_class
     *
     * @mbggenerated Sat Jan 27 22:30:20 CST 2018
     * 查单条
     */
    TbClassVo selectByPrimaryKey(Integer classid);
    
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_class
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int updateByPrimaryKey(TbClass record);
    //查询班级
    public List<TbClass>selectclass();
}