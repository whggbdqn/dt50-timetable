package qs.classhelper.entity;

import java.util.ArrayList;
import java.util.List;

public class TbDate {
  private String cDatetime;
  private int count;
  private List<TbCoursetable>  tbCourseTable=new ArrayList<TbCoursetable>();
public String getcDatetime() {
	return cDatetime;
}
public void setcDatetime(String cDatetime) {
	this.cDatetime = cDatetime;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public List<TbCoursetable> getTbCourseTable() {
	return tbCourseTable;
}
public void setTbCourseTable(List<TbCoursetable> tbCourseTable) {
	this.tbCourseTable = tbCourseTable;
}

}
