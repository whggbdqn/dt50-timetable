package qs.classhelper.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.text.DateFormat;

import java.text.ParseException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import qs.classhelper.entity.TbTeacharinfo;
import qs.classhelper.entity.TbTeacher;
import qs.classhelper.entity.TbTeacherInfos;
import qs.classhelper.service.TbTeacharinfoService;
import qs.classhelper.service.TbTeacherService;
import qs.classhelper.util.ExcelUtil;
import qs.classhelper.util.Result;

@Controller
@RequestMapping("/")
public class TbTeacherController {
	
	@Autowired
	private TbTeacherService tbTeacherService;
	@Autowired
	private TbTeacharinfoService tbTeacharinfoService;
	
	
	@InitBinder
	 public  void init(WebDataBinder wdb){
		wdb.registerCustomEditor(Date.class, 
		   new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)
		); 
	 }
	
	
	
	//分页查询
	@RequestMapping("getAllTeachersInfos.s")
	@ResponseBody
	public Map<String, Object> getAllTeacher(
			Integer page,Integer rows) throws Exception{
		//设置分页 page页码  rows页大小
		PageHelper.startPage(page, rows);
		List<TbTeacherInfos> list=tbTeacherService.getAllTeachersInfos();
		PageInfo pageInfo=new PageInfo(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total", pageInfo.getTotal());  //设置总页数
		map.put("rows", list);
		return map;
	}
	
	//删除多条
	@RequestMapping("delTeachers.s")
	@ResponseBody
	public int delTeachers(String teacherIds) throws Exception{
		//把字符串拼接成数组
		String[] teacherids=teacherIds.split(",");
		//调用删除
		int count=tbTeacherService.delTeachers(teacherids);
		if(count>0)
			return count;
		else
			return -1;
	}
	
	@RequestMapping("addTeacher.s")
	@ResponseBody
	public TbTeacherInfos addTeacher(TbTeacherInfos tbTeacherInfos) throws Exception{
		//创建实体
		TbTeacher tbTeacher=new TbTeacher();
		TbTeacharinfo  tbTeacharinfo=new TbTeacharinfo();
		//传入值
		tbTeacher.setTeachername(tbTeacherInfos.getTeachername());
		tbTeacher.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
		tbTeacher.setTeacherstate(tbTeacherInfos.getTeacherstate());
		tbTeacher.setDutiesid(tbTeacherInfos.getDutiesid());
		tbTeacher.setTeacherintime(tbTeacherInfos.getTeacherintime());
		//加密
		String hashAlgorithmName = "MD5";
		Object credentials = "123";
		Object salt = ByteSource.Util.bytes(tbTeacherInfos.getTeachername());
		int hashIterations = 1024;  //加密1024次
		Object teacherpwd = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		
		tbTeacher.setTeacherpwd(teacherpwd.toString());   //初始默认密码均为123
		
		tbTeacharinfo.setTeachersex(tbTeacherInfos.getTeachersex());
		tbTeacharinfo.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
		tbTeacharinfo.setTeacherphone(tbTeacherInfos.getTeacherphone());
		//添加
		int count=tbTeacherService.insert(tbTeacher);
		
		int temp=tbTeacharinfoService.insert(tbTeacharinfo);
		//查询添加的教员的id
		tbTeacherInfos.setTeacherid(tbTeacherService.getNewTeacher().getTeacherid());
		if(count>0) {
			return tbTeacherInfos;
		}else {
			return null;
		}
	}
	
	
	@RequestMapping("updateTeacher.s")
	@ResponseBody
	public TbTeacherInfos updateTeacher(TbTeacherInfos tbTeacherInfos) throws Exception{
		//获取实体
		TbTeacher tbTeacher=tbTeacherService.selectByPrimaryKey(tbTeacherInfos.getTeacherid());
		//通过教师实体获取教员信息实体
		TbTeacharinfo  tbTeacharinfo= tbTeacharinfoService.getTbTeacharinfo(tbTeacher.getTeacherid());
		
		//加密
		String hashAlgorithmName = "MD5";
		Object credentials = tbTeacherInfos.getTeacherpwd();
		Object salt = ByteSource.Util.bytes(tbTeacherInfos.getTeachername());
		int hashIterations = 1024;  //加密1024次
		Object teacherpwd = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		
		
		//传入值
		tbTeacher.setTeachername(tbTeacherInfos.getTeachername());
		tbTeacher.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
		tbTeacher.setTeacherstate(tbTeacherInfos.getTeacherstate());
		tbTeacher.setDutiesid(tbTeacherInfos.getDutiesid());
		tbTeacher.setTeacherintime(tbTeacherInfos.getTeacherintime());
		tbTeacher.setTeacherpwd(teacherpwd.toString());  
		
		
		if(!(tbTeacharinfo==null)) {
			tbTeacharinfo.setTeachersex(tbTeacherInfos.getTeachersex());
			tbTeacharinfo.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
			tbTeacharinfo.setTeacherphone(tbTeacherInfos.getTeacherphone());
			int temp=tbTeacharinfoService.updateByPrimaryKeySelective(tbTeacharinfo);
		}
		int count=tbTeacherService.updateByPrimaryKeySelective(tbTeacher);
	
		
		if(count>0) {
			return tbTeacherInfos;
		}else {
			return null;
		}
	}
	
	/*导出教员信息Excel*/
	@RequestMapping("downloadExcel.s")
	public void downloadExcel(HttpServletResponse response) throws Exception{
		//调用业务查询所有教员和对应信息
		List<TbTeacherInfos> list=tbTeacherService.getAllTeachersInfos();
		
		 //生成excel  HSSFWorkbook  EXCEL2003     XSSFWorkbook 2007
		//创建工作薄
		XSSFWorkbook workbook=new XSSFWorkbook();
		//工作表
		XSSFSheet sheet=workbook.createSheet("teacherInfos");
		//创建行
		XSSFRow titleRow=sheet.createRow(0);
		//创建行
	    XSSFCell cell1=titleRow.createCell(0);
		cell1.setCellValue("教员姓名");
		XSSFCell cell2=titleRow.createCell(1);
		cell2.setCellValue("入职日期");
		XSSFCell cell3=titleRow.createCell(2);
		cell3.setCellValue("教员电话");
		XSSFCell cell4=titleRow.createCell(3);
		cell4.setCellValue("在职状态");
		SimpleDateFormat f = new SimpleDateFormat("yyyy年MM月dd日");
		for(int i=0;i<list.size();i++){
			TbTeacherInfos tbTeacherInfos=list.get(i);
			
			XSSFRow drow=sheet.createRow(i+1);
			//创建行
		    XSSFCell c1=drow.createCell(0);
			c1.setCellValue(tbTeacherInfos.getTeachername());
			
			//把取到的日期转化
		
			XSSFCell c2=drow.createCell(1);
			if(!(tbTeacherInfos.getTeacherintime()==null)) {
				c2.setCellValue(f.format(tbTeacherInfos.getTeacherintime()));
			}
			XSSFCell c3=drow.createCell(2);
			c3.setCellValue(tbTeacherInfos.getTeacherphone());
			XSSFCell c4=drow.createCell(3);
			if(tbTeacherInfos.getTeacherstate()==0) {
				c4.setCellValue("离职");
			}else {
				c4.setCellValue("在职");
			}
			
		}
		
		//获取workbook的字节数组
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		workbook.write(bos);
	
		//下载
		try {
		    //设置文件下载
		   String filename=System.currentTimeMillis()+".xlsx";
		   response.setHeader("Content-Disposition","attachment;fileName="+filename);
		   //设置服务器返回客户端的文件类型
		   //response.setContentType("image/jpeg");
		   response.setContentType("application/excel");
		  //往响应流中输出即可
		  ServletOutputStream sos=response.getOutputStream();
		  sos.write(bos.toByteArray());
		  sos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
		//导入数据库
	 @RequestMapping(value = "exclImport.s",method = RequestMethod.POST)
	 @ResponseBody
	  public Result importExcl(@RequestParam("file") MultipartFile excl, HttpServletRequest request){
	        Result result = new Result();
	        if(!excl.isEmpty()){//说明文件不为空
	            try {
	                String fileName = excl.getOriginalFilename();
	                InputStream is = excl.getInputStream();//转化为流的形式
	                List<TbTeacherInfos> listMer = new ArrayList<TbTeacherInfos>();
	                List<Row> list = ExcelUtil.getExcelRead(fileName,is, true);
	                //首先是读取行 也就是一行一行读，然后在取到列，遍历行里面的行，根据行得到列的值
	                DateFormat formater=new SimpleDateFormat("yyyy-mm-dd");
	                for (Row row : list) {
	                    /****************得到每个元素的值start**********************/
	                    Cell cell_0 = row.getCell(0);
	                    Cell cell_1 = row.getCell(1);
	                    Cell cell_2 = row.getCell(2);
	                    Cell cell_3 = row.getCell(3);
	                    Cell cell_4 = row.getCell(4);
	                    Cell cell_5 = row.getCell(5);
	                    Cell cell_6 = row.getCell(6);
	                    Cell cell_7 = row.getCell(7);
	                    Cell cell_8 = row.getCell(8);
	                    /*****************得到每个元素的值end**********************/
	                    /******************解析每个元素的值start*******************/
	                    //得到列的值，也就是你需要解析的字段的值
	                    Integer teacherjobnumber = new Integer(ExcelUtil.getValue(cell_0));
	                    String   teachername = ExcelUtil.getValue(cell_1);
	                    String teacherpwd=ExcelUtil.getValue(cell_2);
	                   
						Date teacherintime=formater.parse(ExcelUtil.getDateValue(cell_3));
	                    Integer dutiesid=new Integer(ExcelUtil.getValue(cell_4));
	                    Integer teacherstate=new Integer(ExcelUtil.getValue(cell_5));
	                    String teacherphone=ExcelUtil.getValue(cell_6);
	                    Integer teacherage=new Integer(ExcelUtil.getValue(cell_7));
	                    Integer teachersex=new Integer(ExcelUtil.getValue(cell_8));
	                    
	                  /*  String  express = ExcelUtil.getValue(cell_2);
	                    String  version = ExcelUtil.getValue(cell_3);*/
	                    /******************解析每个元素的值end*******************/
	                    /****************将读取出来的数值进行包装start***********/
	                    TbTeacherInfos tbTeacherInfos = new TbTeacherInfos();
	                   /* grade.setGid(gid);
	                    grade.setGname(gname);*/
	                    /*给实体添加元素*/
	                    tbTeacherInfos.setTeacherjobnumber(teacherjobnumber);
	                    tbTeacherInfos.setTeachername(teachername);
	                    tbTeacherInfos.setTeacherpwd(teacherpwd);
	                    tbTeacherInfos.setTeacherintime(teacherintime);
	                    tbTeacherInfos.setDutiesid(dutiesid);
	                    tbTeacherInfos.setTeacherstate(teacherstate);
	                    tbTeacherInfos.setTeacherphone(teacherphone);
	                    tbTeacherInfos.setTeacherage(teacherage);
	                    tbTeacherInfos.setTeachersex(teachersex);
	                    listMer.add(tbTeacherInfos);
	                    /**************将读取出来的数值进行包装end**************/
	                }
	                if(listMer.size()>0){
	                    for (TbTeacherInfos tbTeacherInfos:listMer) {
	                    //	gradeService.insert(grade);    //添加
	                    	
	                    	TbTeacher tbTeacher=new TbTeacher();
	                		TbTeacharinfo  tbTeacharinfo=new TbTeacharinfo();
	                		//传入值
	                		tbTeacher.setTeachername(tbTeacherInfos.getTeachername());
	                		tbTeacher.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
	                		tbTeacher.setTeacherstate(tbTeacherInfos.getTeacherstate());
	                		tbTeacher.setDutiesid(tbTeacherInfos.getDutiesid());
	                		tbTeacher.setTeacherintime(tbTeacherInfos.getTeacherintime());
	                		//加密
	                		String hashAlgorithmName = "MD5";
	                		Object credentials = "123";
	                		Object salt = ByteSource.Util.bytes(tbTeacherInfos.getTeachername());
	                		int hashIterations = 1024;  //加密1024次
	                		Object teacherpwd = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
	                		
	                		tbTeacher.setTeacherpwd(teacherpwd.toString());   //初始默认密码均为123
	                		
	                		tbTeacharinfo.setTeachersex(tbTeacherInfos.getTeachersex());
	                		tbTeacharinfo.setTeacherjobnumber(tbTeacherInfos.getTeacherjobnumber());
	                		tbTeacharinfo.setTeacherphone(tbTeacherInfos.getTeacherphone());
	                		//添加
	                		int count=tbTeacherService.insert(tbTeacher);
	                		
	                		int temp=tbTeacharinfoService.insert(tbTeacharinfo);
	                		//查询添加的教员的id
	                		tbTeacherInfos.setTeacherid(tbTeacherService.getNewTeacher().getTeacherid());
	                    }
	                }
	                result.setSuccess(true);
	                result.setSuccessMessage("导入成功！");
	            }catch (Exception e){
	                e.printStackTrace();
	                result.setSuccess(false);
	                result.setErrorMessage("导入出现异常！");
	            }
	        }else{
	            result.setSuccess(false);
	            result.setErrorMessage("导入的文件为空！");
	        }
	        return  result;
	    }
	
	 @RequestMapping("getTeacherByClass.s")
	 @ResponseBody
	 public List<TbTeacher>  getTeacherByClass(String name){
	 	 List<TbTeacher> list=tbTeacherService.getTeacherByClass(name);
	 	return list;
	 }
	//异步
     @ResponseBody
	// 班主任教师查询方法
	@RequestMapping("/showt.s")
	public List<TbTeacher> teachershow() {
		List<TbTeacher>show=tbTeacherService.showteacher();
		
		return show;
	}
     //异步
     @ResponseBody
     @RequestMapping("/showteacher.s")
     public List<TbTeacher>show() {
    	List<TbTeacher> show=  tbTeacherService.showjy();
    	return show;
     }
	
	 
	
}
