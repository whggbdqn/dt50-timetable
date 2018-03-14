package qs.classhelper.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import qs.classhelper.dao.TbTeacharinfoMapper;
import qs.classhelper.entity.TbTeacharinfo;
import qs.classhelper.service.TbTeacharinfoService;
@Service("tbTeacharinfoService")
@Transactional
public class TbTeacharinfoServiceImpl implements TbTeacharinfoService {
	
	@Autowired
	private TbTeacharinfoMapper tbTeacharinfoMapper;
	
	@Override
	public int insert(TbTeacharinfo record) {
		// TODO Auto-generated method stub
		return tbTeacharinfoMapper.insert(record);
	}

	@Override
	
	public TbTeacharinfo getTbTeacharinfo(Integer teacherID) {
		// TODO Auto-generated method stub
		return tbTeacharinfoMapper.getTbTeacharinfo(teacherID);
	}

	@Override
	public int updateByPrimaryKeySelective(TbTeacharinfo record) {
		// TODO Auto-generated method stub
		return tbTeacharinfoMapper.updateByPrimaryKeySelective(record);
	}

}
