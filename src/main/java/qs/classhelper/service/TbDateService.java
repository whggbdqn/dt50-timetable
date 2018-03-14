package qs.classhelper.service;

import java.util.List;

import qs.classhelper.entity.TbDate;

public interface TbDateService {
	 /**根据不同的日期分组查询
     * @author wangbo
     */
	List<TbDate> getAllDate();
}
