package qs.classhelper.dao;

import java.util.List;

import qs.classhelper.entity.TbDutyMenu;

public interface TbDutyMenuMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int deleteByPrimaryKey(Integer dutyMenuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int insert(TbDutyMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int insertSelective(TbDutyMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    TbDutyMenu selectByPrimaryKey(Integer dutyMenuid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int updateByPrimaryKeySelective(TbDutyMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_duty_menu
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    int updateByPrimaryKey(TbDutyMenu record);

    List<TbDutyMenu> gettbDutyMenu(int dutyID); 
}