package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbDutiesinfoMapper;
import qs.classhelper.entity.TbDutiesinfo;
import qs.classhelper.service.TbDutiesinfoService;
@Service("tbDutiesinfoService")
public class TbDutiesinfoServiceImpl implements TbDutiesinfoService{
	@Autowired
	private TbDutiesinfoMapper tbDutiesinfoMapper;
	
	public TbDutiesinfoMapper getTbDutiesinfoMapper() {
		return tbDutiesinfoMapper;
	}

	public void setTbDutiesinfoMapper(TbDutiesinfoMapper tbDutiesinfoMapper) {
		this.tbDutiesinfoMapper = tbDutiesinfoMapper;
	}

	@Override
	public int deleteByPrimaryKey(Integer dutiesid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TbDutiesinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TbDutiesinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TbDutiesinfo selectByPrimaryKey(Integer dutiesid) {
		// TODO Auto-generated method stub
		return tbDutiesinfoMapper.selectByPrimaryKey(dutiesid);
	}

	@Override
	public int updateByPrimaryKeySelective(TbDutiesinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TbDutiesinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TbDutiesinfo> getAllDutyName() {
		// TODO Auto-generated method stub
		return tbDutiesinfoMapper.getAllDutyName();
	}

}
