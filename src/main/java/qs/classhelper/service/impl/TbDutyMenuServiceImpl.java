package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbDutyMenuMapper;
import qs.classhelper.dao.TbMenuMapper;
import qs.classhelper.entity.TbDutyMenu;
import qs.classhelper.entity.TbMenu;
import qs.classhelper.service.TbDutyMenuService;
import qs.classhelper.service.TbMenuService;
@Service("tbDutyMenuService")
public class TbDutyMenuServiceImpl implements TbDutyMenuService {
	@Autowired
	private TbDutyMenuMapper tbDutyMenuMapper;
	
	public TbDutyMenuMapper getTbDutyMenuMapper() {
		return tbDutyMenuMapper;
	}

	public void setTbDutyMenuMapper(TbDutyMenuMapper tbDutyMenuMapper) {
		this.tbDutyMenuMapper = tbDutyMenuMapper;
	}

	@Override
	public List<TbMenu> getAllchildsMenu(Integer menuid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TbMenu> getAllParentMenu() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteByPrimaryKey(Integer menuid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TbMenu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TbMenu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TbMenu selectByPrimaryKey(Integer menuid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TbMenu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TbMenu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TbDutyMenu> gettbDutyMenu(int dutyID) {
		// TODO Auto-generated method stub
		return tbDutyMenuMapper.gettbDutyMenu(dutyID);
	}

	

}
