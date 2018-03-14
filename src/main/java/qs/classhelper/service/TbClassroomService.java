package qs.classhelper.service;

import java.util.List;

import qs.classhelper.entity.TbClassroom;

public interface TbClassroomService {
	//查所有机房
	 List<TbClassroom> getAllTbClassroom();
	 //根据机房名称查
	 int getSizeByClassroom(String name);
	 
	 /**
	  * @author lixuan
	  * 
	  */
	//通过主键ID删除
	    int deleteByPrimaryKey(Integer roomid);
	    
	    //添加信息
	    int insert(TbClassroom tbClassroom);
	    
	    TbClassroom selectByPrimaryKey(Integer roomid);
	    
	    int updateByPrimaryKeySelective(TbClassroom record);
	
}
