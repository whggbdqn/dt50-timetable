package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbDateMapper;
import qs.classhelper.entity.TbDate;
import qs.classhelper.service.TbDateService;
@Service
public class TbDateServiceImpl implements TbDateService {
@Autowired 
private TbDateMapper tbDateMapper;
	@Override
	public List<TbDate> getAllDate() {
		// TODO Auto-generated method stub
		return tbDateMapper.getAllDate();
	}

}
