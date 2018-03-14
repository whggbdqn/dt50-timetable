package qs.classhelper.util;

import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtil {

	public static List<Row> getExcelRead(String fileName, InputStream is, boolean isTitle) throws Exception {
		try {
			Workbook workbook = getWorkbook(fileName, is);
			Sheet sheet = workbook.getSheetAt(0);
			int count = 0;
			List<Row> list = new ArrayList<Row>();
			for (Row row : sheet) {
				if (count == 0 && isTitle) {
					count++;
					continue;
				}
				list.add(row);
			}
			return list;
		} catch (Exception e) {
			throw e;
		}
	}

	public static Workbook getWorkbook(String fileName, InputStream is) throws Exception {
		if (isExcel2007(fileName)) {
			return new XSSFWorkbook(is);
		} else if (isExcel2003(fileName)) {
			return new HSSFWorkbook(is);
		} else {
			throw new Exception("非excel文件格式");
		}
	}

	/**
	 * 获取单元格数据
	 * 
	 * @param cell
	 * @return
	 */
	public static String getValue(Cell cell) {
		if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
			return String.valueOf(cell.getBooleanCellValue());
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			double value = cell.getNumericCellValue();
			return new BigDecimal(value).toString();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			return String.valueOf(cell.getStringCellValue());
		} else {
			return String.valueOf(cell.getStringCellValue());
		}
	}

	public static String getDateValue(Cell cell) {
		String str = "";
		if (0 == cell.getCellType()) {

			// 判断是否为日期类型

			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				// 用于转化为日期格式

				Date d = cell.getDateCellValue();

				DateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				str = formater.format(d);

			} else {

				// 用于格式化数字，只保留数字的整数部分

				DecimalFormat df = new DecimalFormat("########");

				str = df.format(cell.getNumericCellValue());

			}
		}
		return str;
	}

	/**
	 * 根据文件扩展名，判断是否为excel2003
	 * 
	 * @param filePath
	 * @return
	 */
	public static boolean isExcel2003(String filePath) {
		return filePath.matches("^.+\\.(?i)(xls)$");
	}

	/**
	 * 根据文件扩展名，判断是否为excel2007
	 * 
	 * @param filePath
	 * @return
	 */
	public static boolean isExcel2007(String filePath) {
		return filePath.matches("^.+\\.(?i)(xlsx)$");
	}
}
