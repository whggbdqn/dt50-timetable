package qs.classhelper.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import qs.classhelper.dao.TbClassMapper;
import qs.classhelper.entity.TbClass;
import qs.classhelper.entity.TbClassVo;
import qs.classhelper.service.TbClassService;
@Service
public class TbClassServiceImpl implements TbClassService {
	@Autowired
	private TbClassMapper tbClassMapper;

	@Override
	public List<TbClass> getAllClass() {
		// TODO Auto-generated method stub
		return tbClassMapper.getAllClass();
	}
	//查询状态为1的班级
		@Override
		public List<TbClass> getAllClassByState() {
			// TODO Auto-generated method stub
			return tbClassMapper.getAllClassByState();
		}

		//实现逻辑删除
		@Override
		public int delClassWhenState(List<Integer> classIDs) {
			// TODO Auto-generated method stub
			return tbClassMapper.delClassWhenState(classIDs);
		}

		//计算从开班到目前上课天数
		@Override
		public int getDate(Integer classID) {
			// TODO Auto-generated method stub
			return tbClassMapper.getDate(classID);
		}

		//判断是否有该班级
		@Override
		public int getOneClassName(String className) {
			// TODO Auto-generated method stub
			return tbClassMapper.getOneClassName(className);
		}
	
	@Override
	@Transactional
	public int deleteByPrimaryKey(Integer classid) {
		// TODO Auto-generated method stub
		return tbClassMapper.deleteByPrimaryKey(classid);
	}

	@Override
	@Transactional
	public int insert(TbClass record) {
		// TODO Auto-generated method stub
		return tbClassMapper.insert(record);
	}

	@Override
	@Transactional
	public int updateByPrimaryKey(TbClass record) {
		// TODO Auto-generated method stub
		return tbClassMapper.updateByPrimaryKey(record);
	}

	//查单条
		@Override
		public TbClassVo selectByPrimaryKey(Integer classid) {
			// TODO Auto-generated method stub
			return tbClassMapper.selectByPrimaryKey(classid);
		}

	//批量删除
	@Override
	@Transactional
	public int batchDeleteClasss(List<Integer> classIDs) {
		// TODO Auto-generated method stub
		int count = tbClassMapper.batchDeleteClasss(classIDs);
		return count;
	}

	@Override
	public List<TbClass> getTbClassAndTbTeacherByclassID(String className) {
		// TODO Auto-generated method stub
		return tbClassMapper.getTbClassAndTbTeacherByclassID(className);
	}
	@Override
	public List<TbClass> getClassBySize(int size) {
		// TODO Auto-generated method stub
		return tbClassMapper.getClassBySize(size);
	}
	
	
  
	 public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		TbClassMapper tbClassMapper=(TbClassMapper) ac.getBean("tbClassMapper");
		System.out.println(tbClassMapper.getClassBySize(40).size());
	}
	@Override
	public List<TbClass> selectclass() {
		// TODO Auto-generated method stub
		return tbClassMapper.selectclass();
	}

   
}
