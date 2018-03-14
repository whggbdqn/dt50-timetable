package qs.classhelper.service;

import java.util.List;

import qs.classhelper.entity.TbClassnode;

public interface TbClassnodeService {
	 /**
     * 根据班级查询课程节点
     * @author wangbo
     */
    List<TbClassnode> getAllNodeByClass(String classname);
    
    /**
     * @author wangbo
     * 查询所有班级的cto课
     */
    List<TbClassnode> getAllNCtoCourse();
    
    /**
	 * 杨菲:删除课程节点
	 */
	int delClassnode(String[] s);
	
	/**
    @author 杨菲:添加课程节点
    */
   int insertSelective(TbClassnode record);
}
