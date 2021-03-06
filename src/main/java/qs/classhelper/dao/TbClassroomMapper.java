package qs.classhelper.dao;

import java.util.List;

import qs.classhelper.entity.TbClassroom;

public interface TbClassroomMapper {
   
    int deleteByPrimaryKey(Integer roomid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_classroom
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int insert(TbClassroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_classroom
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int insertSelective(TbClassroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_classroom
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    TbClassroom selectByPrimaryKey(Integer roomid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_classroom
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int updateByPrimaryKeySelective(TbClassroom record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb_classroom
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    int updateByPrimaryKey(TbClassroom record);
    //查所有机房
    List<TbClassroom> getAllTbClassroom();
    
    //根据机房名称查机房大小
    int getSizeByClassroom(String name);
    
}