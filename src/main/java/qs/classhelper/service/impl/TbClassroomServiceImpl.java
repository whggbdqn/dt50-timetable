package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import qs.classhelper.dao.TbClassroomMapper;
import qs.classhelper.entity.TbClassroom;
import qs.classhelper.service.TbClassroomService;
@Service
public class TbClassroomServiceImpl implements TbClassroomService {
	@Autowired
  private TbClassroomMapper tbClassroomMapper;
	@Override
	public List<TbClassroom> getAllTbClassroom() {
		// TODO Auto-generated method stub
		return tbClassroomMapper.getAllTbClassroom();
	}
	@Override
	public int getSizeByClassroom(String name) {
		// TODO Auto-generated method stub
		return tbClassroomMapper.getSizeByClassroom(name);
	}
	
	//通过ID删除单条
/**
 * 	
 * @author lixuan
 * 
 */

		@Override
		@Transactional
		public int deleteByPrimaryKey(Integer roomid) {
			// TODO Auto-generated method stub
			return tbClassroomMapper.deleteByPrimaryKey(roomid);
		}
		
	       //添加教室信息
		@Override
		@Transactional
		public int insert(TbClassroom tbClassroom){
			// TODO Auto-generated method stub
			return tbClassroomMapper.insert(tbClassroom);
		}

		@Override
		public TbClassroom selectByPrimaryKey(Integer roomid) {
			// TODO Auto-generated method stub
			return tbClassroomMapper.selectByPrimaryKey(roomid);
		}

		@Override
		public int updateByPrimaryKeySelective(TbClassroom record) {
			return tbClassroomMapper.updateByPrimaryKeySelective(record);
		}
		
}
