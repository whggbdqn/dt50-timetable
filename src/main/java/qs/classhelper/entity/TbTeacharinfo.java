package qs.classhelper.entity;

public class TbTeacharinfo {
    public TbTeacharinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_teacharinfo.teacherJobNumber
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    private Integer teacherjobnumber;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_teacharinfo.teacherPhone
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    private String teacherphone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_teacharinfo.teacherAge
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    private Integer teacherage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_teacharinfo.teacherSex
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    private Integer teachersex;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_teacharinfo.teacherPic
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    private String teacherpic;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_teacharinfo.teacherJobNumber
     *
     * @return the value of tb_teacharinfo.teacherJobNumber
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public Integer getTeacherjobnumber() {
        return teacherjobnumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_teacharinfo.teacherJobNumber
     *
     * @param teacherjobnumber the value for tb_teacharinfo.teacherJobNumber
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public void setTeacherjobnumber(Integer teacherjobnumber) {
        this.teacherjobnumber = teacherjobnumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_teacharinfo.teacherPhone
     *
     * @return the value of tb_teacharinfo.teacherPhone
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public String getTeacherphone() {
        return teacherphone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_teacharinfo.teacherPhone
     *
     * @param teacherphone the value for tb_teacharinfo.teacherPhone
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public void setTeacherphone(String teacherphone) {
        this.teacherphone = teacherphone == null ? null : teacherphone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_teacharinfo.teacherAge
     *
     * @return the value of tb_teacharinfo.teacherAge
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public Integer getTeacherage() {
        return teacherage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_teacharinfo.teacherAge
     *
     * @param teacherage the value for tb_teacharinfo.teacherAge
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public void setTeacherage(Integer teacherage) {
        this.teacherage = teacherage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_teacharinfo.teacherSex
     *
     * @return the value of tb_teacharinfo.teacherSex
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public Integer getTeachersex() {
        return teachersex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_teacharinfo.teacherSex
     *
     * @param teachersex the value for tb_teacharinfo.teacherSex
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public void setTeachersex(Integer teachersex) {
        this.teachersex = teachersex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_teacharinfo.teacherPic
     *
     * @return the value of tb_teacharinfo.teacherPic
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public String getTeacherpic() {
        return teacherpic;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_teacharinfo.teacherPic
     *
     * @param teacherpic the value for tb_teacharinfo.teacherPic
     *
     * @mbg.generated Fri Jan 19 17:30:12 CST 2018
     */
    public void setTeacherpic(String teacherpic) {
        this.teacherpic = teacherpic == null ? null : teacherpic.trim();
    }
}