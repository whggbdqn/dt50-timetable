package qs.classhelper.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbExceltableMapper;
import qs.classhelper.entity.TbExceltable;
import qs.classhelper.service.TbExceltableService;
@Service
public class TbExceltableServiceImpl implements TbExceltableService {
@Autowired
private TbExceltableMapper tbExceltableMapper;
	@Override
	public int insertSelective(TbExceltable record) {
		return tbExceltableMapper.insert(record);
	}

}
