package qs.classhelper.entity;

import java.util.Date;

public class TbClass {
    private Integer state;
	
    public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_class.classID
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    private Integer classid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_class.className
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    private String classname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_class.totalNum
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    private Integer totalnum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_class.beginYear
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    private Date beginyear;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_class.classType
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    private Integer classtype;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_class.classID
     *
     * @return the value of tb_class.classID
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public Integer getClassid() {
        return classid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_class.classID
     *
     * @param classid the value for tb_class.classID
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_class.className
     *
     * @return the value of tb_class.className
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public String getClassname() {
        return classname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_class.className
     *
     * @param classname the value for tb_class.className
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_class.totalNum
     *
     * @return the value of tb_class.totalNum
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public Integer getTotalnum() {
        return totalnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_class.totalNum
     *
     * @param totalnum the value for tb_class.totalNum
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public void setTotalnum(Integer totalnum) {
        this.totalnum = totalnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_class.beginYear
     *
     * @return the value of tb_class.beginYear
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public Date getBeginyear() {
        return beginyear;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_class.beginYear
     *
     * @param beginyear the value for tb_class.beginYear
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public void setBeginyear(Date beginyear) {
        this.beginyear = beginyear;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_class.classType
     *
     * @return the value of tb_class.classType
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public Integer getClasstype() {
        return classtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_class.classType
     *
     * @param classtype the value for tb_class.classType
     *
     * @mbg.generated Fri Jan 19 00:18:10 CST 2018
     */
    public void setClasstype(Integer classtype) {
        this.classtype = classtype;
    }
}