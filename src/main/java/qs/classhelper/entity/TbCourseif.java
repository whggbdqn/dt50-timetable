package qs.classhelper.entity;

import java.util.ArrayList;
import java.util.List;

public class TbCourseif {

    private String cDatetime;

    private String cMorning1Teacher;

	List<TbCoursetableMy> info=new ArrayList<TbCoursetableMy>();
    
    private String date1; 
    private int count=1;
    
    public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	List<String> dates=new ArrayList<String>();
    
    
    public List<String> getDates() {
		return dates;
	}

	public void setDates(List<String> dates) {
		this.dates = dates;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}



	public List<TbCoursetableMy> getInfo() {
		return info;
	}

	public void setInfo(List<TbCoursetableMy> info) {
		this.info = info;
	}

	public String getcDatetime() {
		return cDatetime;
	}

	public void setcDatetime(String cDatetime) {
		this.cDatetime = cDatetime;
	}

	public String getcMorning1Teacher() {
		return cMorning1Teacher;
	}

	public void setcMorning1Teacher(String cMorning1Teacher) {
		this.cMorning1Teacher = cMorning1Teacher;
	}

}
