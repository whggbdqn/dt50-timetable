package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbCourseMapper;
import qs.classhelper.dao.TbInfoMapper;
import qs.classhelper.entity.TbInfo;
import qs.classhelper.service.TbInfoService;
@Service
public class TbInfoServiceImpl implements TbInfoService{
	@Autowired
	private TbInfoMapper infoMapper;
	/**
	 *@author 杨菲:查询所有通告
	 */
	@Override
	public List<TbInfo> getAllInfo() {
		// TODO Auto-generated method stub
		return infoMapper.getAllInfo();
	}

}
