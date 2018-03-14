package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbClassnodeMapper;
import qs.classhelper.entity.TbClassnode;
import qs.classhelper.service.TbClassnodeService;
@Service
public class TbClassnodeServiceImpl implements TbClassnodeService {
	@Autowired
private TbClassnodeMapper tbClassnodeMapper;
	/**
	 * @author wangbo:根据班级查询所有课程节点
	 */
	@Override
	public List<TbClassnode> getAllNodeByClass(String classname) {
		// TODO Auto-generated method stub
		return tbClassnodeMapper.getAllNodeByClass(classname);
	}
	/**
	 * @author wangbo:查询所有cto课程
	 */
	@Override
	public List<TbClassnode> getAllNCtoCourse() {
		// TODO Auto-generated method stub
		return tbClassnodeMapper.getAllNCtoCourse();
	}
  
	/**
	 * @author 杨菲:批量删除课程节点
	 */
	@Override
	public int delClassnode(String[] s) {
		// TODO Auto-generated method stub
		return tbClassnodeMapper.delClassnode(s);
	}
	
	/**
	 * @author 杨菲:添加课程节点
	 */
	@Override
	public int insertSelective(TbClassnode record) {
		// TODO Auto-generated method stub
		return tbClassnodeMapper.insertSelective(record);
	}
}
