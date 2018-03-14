package qs.classhelper.service;

import java.util.List;

import qs.classhelper.entity.TbSuggestion;


public interface TbSuggestionService {
	
	/**
	 * 查询所有建议
	 * @return
	 */
	List<TbSuggestion> getSuggestion();
	
	/**
	 * 查询所有建议和建议的老师
	 * @return
	 */
	List<TbSuggestion> getAllSuggestion();
	
	/**
	 * 批量删除建议
	 * @param suggestionID
	 */
	int batchDeleteSuggestions(String[] suggestionID);
	
	/**
	 * 添加建议
	 * @param record
	 * @return
	 */
	int insert(TbSuggestion record);
	
	/**
	 * 查询单条
	 * @param suggestionid
	 * @return
	 */
	TbSuggestion selectByPrimaryKey(Integer suggestionid);
	
	/**
	 * 修改建议
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(TbSuggestion record);
}
