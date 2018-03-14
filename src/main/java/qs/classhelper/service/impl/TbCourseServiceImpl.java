package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbCourseMapper;
import qs.classhelper.entity.TbCourse;
import qs.classhelper.service.TbCourseService;
@Service
public class TbCourseServiceImpl implements TbCourseService {
@Autowired
private TbCourseMapper tbCourseMapper;

@Override
public List<TbCourse> getAllCcd() {
	// TODO Auto-generated method stub
	return tbCourseMapper.getAllCcd();
}
//@Override
//public List<TbCourse> getAllCourse() {
//	// TODO Auto-generated method stub
//	return tbCourseMapper.getAllCourse();
//}

@Override
public int deleteByPrimaryKey(Integer courseid) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int insert(TbCourse record) {
	// TODO Auto-generated method stub
	return 0;
}
/**
 *@杨菲:插入课程类型
 */
@Override
public int insertSelective(TbCourse record) {
	// TODO Auto-generated method stub
	return tbCourseMapper.insertSelective(record);
}

@Override
public TbCourse selectByPrimaryKey(Integer courseid) {
	// TODO Auto-generated method stub
	return null;
}
/**
 * @author 杨菲：修改课程类型
 */
@Override
public int updateByPrimaryKeySelective(TbCourse record) {
	// TODO Auto-generated method stub
	return tbCourseMapper.updateByPrimaryKeySelective(record);
}

@Override
public int updateByPrimaryKey(TbCourse record) {
	// TODO Auto-generated method stub
	return 0;
}
/**
 * @杨菲:删除课程节点
 */
@Override
public int delNodes(String[] s) {
	// TODO Auto-generated method stub
	return tbCourseMapper.delNodes(s);
}
/**
 * @author 杨菲:删除课程类型
 */
@Override
public int delCourse(String[] s) {
	// TODO Auto-generated method stub
	return tbCourseMapper.delCourse(s);
}

}
