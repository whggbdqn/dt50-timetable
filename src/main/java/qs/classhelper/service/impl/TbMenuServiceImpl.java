package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qs.classhelper.dao.TbMenuMapper;
import qs.classhelper.entity.TbMenu;
import qs.classhelper.service.TbMenuService;
@Service("tbMenuService")
public class TbMenuServiceImpl implements TbMenuService {
	
	@Autowired
	private TbMenuMapper tbMenuMapper;

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
	public List<TbMenu> getAllParentMenu() {
		// TODO Auto-generated method stub
		List<TbMenu>  list=tbMenuMapper.getAllParentMenu();
		//循环大类  添加小类
		for (TbMenu tbMenu : list) {
			List<TbMenu> childslist=tbMenuMapper.getAllchildsMenu(tbMenu.getMenuid());
			tbMenu.setChildsMenu(childslist);
			//小类再次添加小类
			for (TbMenu tbMenu2 : childslist) {
				tbMenu2.setChildsMenu(tbMenuMapper.getAllchildsMenu(tbMenu2.getMenuid()));
			}
		}
		return list;
	}


	@Override
	public List<TbMenu> gettbparentMenu(int dutyID) {
		List<TbMenu> list=tbMenuMapper.gettbchildMenu(dutyID);
		
		return list;
	}

}
