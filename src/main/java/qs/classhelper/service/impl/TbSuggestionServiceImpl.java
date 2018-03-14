package qs.classhelper.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import qs.classhelper.dao.TbSuggestionMapper;
import qs.classhelper.entity.TbSuggestion;
import qs.classhelper.service.TbSuggestionService;


@Service("tbSuggestionService")
public class TbSuggestionServiceImpl implements TbSuggestionService {
	@Autowired//自动注入
	private TbSuggestionMapper tbSuggestionMapper;
	
	/**
	 * 查询所有留言
	 */
	public List<TbSuggestion> getSuggestion() {
		return tbSuggestionMapper.getSuggestion();
	}
	
	/**
	 * 批量删除建议
	 */
	@Transactional
	public int batchDeleteSuggestions(String[] suggestionID) {
		int count = tbSuggestionMapper.batchDeleteSuggestions(suggestionID);
		return count;
	}

	/**
	 * 添加建议
	 */
	@Transactional
	public int insert(TbSuggestion record) {
		// TODO Auto-generated method stub
		return tbSuggestionMapper.insert(record);
	}

	/**
	 * 查询单条
	 */
	public TbSuggestion selectByPrimaryKey(Integer suggestionid) {
		// TODO Auto-generated method stub
		return tbSuggestionMapper.selectByPrimaryKey(suggestionid);
	}

	/**
	 * 修改建议
	 */
	@Transactional
	public int updateByPrimaryKey(TbSuggestion record) {
		return tbSuggestionMapper.updateByPrimaryKey(record);
	}
	
	/**
	 * 查询所有建议及教师
	 */
	public List<TbSuggestion> getAllSuggestion() {
		return tbSuggestionMapper.getAllSuggestion();
	}
	
	public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		TbSuggestionService  tss=(TbSuggestionService)ctx.getBean("tbSuggestionService");
		List<TbSuggestion> list=tss.getAllSuggestion();
		System.out.println(list.size());
	}
}
