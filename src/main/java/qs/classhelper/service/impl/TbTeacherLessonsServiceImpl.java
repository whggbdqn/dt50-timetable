package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbTeacherLessonsMapper;
import qs.classhelper.entity.TbTeacherLessons;
import qs.classhelper.service.TbTeacherLessonsService;

@Service("tbTeacherLessonsService")
public class TbTeacherLessonsServiceImpl implements TbTeacherLessonsService {
	@Autowired
	private TbTeacherLessonsMapper tbTeacherLessonsMapper;
	

	@Override
	public int deleteByPrimaryKey(Integer teacherLessonsId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TbTeacherLessons record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TbTeacherLessons record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TbTeacherLessons selectByPrimaryKey(Integer teacherLessonsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TbTeacherLessons record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TbTeacherLessons record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TbTeacherLessons> select() {
		// TODO Auto-generated method stub
		return tbTeacherLessonsMapper.select();
	}

	@Override
	public List<TbTeacherLessons> showban() {
		// TODO Auto-generated method stub
		return tbTeacherLessonsMapper.showban();
	}

	@Override
	public List<TbTeacherLessons> showc() {
		// TODO Auto-generated method stub
		return tbTeacherLessonsMapper.showc();
	}

}
