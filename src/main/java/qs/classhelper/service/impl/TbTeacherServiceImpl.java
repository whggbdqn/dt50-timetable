package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import qs.classhelper.dao.TbTeacharinfoMapper;
import qs.classhelper.dao.TbTeacherMapper;
import qs.classhelper.entity.TbTeacher;
import qs.classhelper.entity.TbTeacherInfos;
import qs.classhelper.service.TbTeacherService;
@Service("tbTeacherService")
//@Transactional
public class TbTeacherServiceImpl implements TbTeacherService {
	@Autowired
	private TbTeacherMapper tbTeacherMapper;
	
	@Autowired
	private TbTeacharinfoMapper tbTeacharinfoMapper;
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TbTeacher> getAllTeacher() {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getAllTeacher();
	}

	@Override
	public int deleteByPrimaryKey(Integer teacherid) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.deleteByPrimaryKey(teacherid);
	}

	@Override
	public int insert(TbTeacher record) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.insert(record);
	}

	@Override
	public int insertSelective(TbTeacher record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TbTeacher selectByPrimaryKey(Integer teacherid) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.selectByPrimaryKey(teacherid);
	}

	@Override
	public int updateByPrimaryKeySelective(TbTeacher record) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TbTeacher record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delTeachers(String[] teacherids) {
		// TODO Auto-generated method stub
		
		int temp=0;
		//查询教员对应的信息
		for (int i = 0; i < teacherids.length; i++) {
			TbTeacher tbTeacher=tbTeacherMapper.selectByPrimaryKey(Integer.parseInt(teacherids[i]));
			//按照编号删除
			if(!(tbTeacher.getTeacherjobnumber()==null)) {
				temp=tbTeacharinfoMapper.delTbTeacharinfo(tbTeacher.getTeacherjobnumber());
			}
		}
		//删除教员
		int count=	tbTeacherMapper.delTeachers(teacherids);
		count=count+temp;
		return count;
	}

	@Override
	public List<TbTeacherInfos> getAllTeachersInfos() {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getAllTeachersInfos();
	}
	
	public TbTeacher getTbTeacher(String teacherName) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getTbTeacher(teacherName);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TbTeacher getNewTeacher() {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getNewTeacher();
	}

	@Override
	public List<TbTeacher> getTeacherByClass(String name) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getTeacherByClass(name);
	}

	@Override
	public int getPositionByName(String teachername) {
		// TODO Auto-generated method stub
		return tbTeacherMapper.getPositionByName(teachername);
	}

	@Override
	public List<TbTeacher> showteacher() {
		// TODO Auto-generated method stub
		return tbTeacherMapper.showteacher();
	}
	@Override
	public List<TbTeacher> showjy() {
		// TODO Auto-generated method stub
		return tbTeacherMapper.showjy() ;
	}



}
