package com.ifly.contro;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import com.ifly.dao.DbHelper;
import com.ifly.page.PageInfo;
import com.ifly.pojo.Brand;
import com.ifly.pojo.Result;
import com.sun.org.apache.regexp.internal.RE;

/**
 * 查询设备信息
 * @author Administrator
 *
 */
public class BrandInfo {
	private DbHelper db = new DbHelper();
	public List<Brand> getAllBrands(){
		
		List<Brand> brands=null;
		try {
		brands=new ArrayList<>();
		String sql="select bNumber,bId,bName,btype,bAddress,bDate,bstatic from jzy_brand";
		ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
			Brand brand1=new Brand();
			String bNumber=rs.getString("bNumber");
			String bId=rs.getString("bId");
			String bName=rs.getString("bName");
			String btype=rs.getString("btype");
			String bAddress=rs.getString("bAddress");
			String bDate=rs.getString("bDate");
			String bstatic=rs.getString("bstatic");
			brand1.setbNumber(bNumber);
			brand1.setbId(bId);
			brand1.setbName(bName);
			brand1.setBtype(btype);
			brand1.setbAddress(bAddress);
			brand1.setbDate(bDate);
			brand1.setBstatic(bstatic);
			brands.add(brand1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
				return brands;
	}
	
	/**
	 * 按照类型分组
	 */
	public Map<String, Integer> getcountByType(){
		Map<String, Integer> map=null;
try {
			
			String sql="select btype,count(*) as num from JZY_BRAND group by btype";
			ResultSet rs=db.executeQuery(sql);
			 map=new HashMap<String ,Integer>();
			while(rs.next()){
				
				int num= rs.getInt("num");
				String type=rs.getString("btype");
				System.out.println(type+"===="+num);
				map.put(type, num);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		//System.out.println(lists);
		return map;
	}
	
	/**
	 * 按照类型及月份分组查询
	 * @return
	 */
	public List<Result> getcount(){
		
		List<Result> lists=null;
		try {
			
			String sql="select btype,bDate, count(*) as num from JZY_BRAND group by btype ,bDate";
			ResultSet rs=db.executeQuery(sql);
			 lists=new ArrayList<>();
			while(rs.next()){
				Result result=new Result();
				int i= rs.getInt("num");
				String type=rs.getString("btype");
				String date=rs.getString("bDate").split("-")[1];
				result.setCount(i);
				result.setDate(date);
				result.setType(type);
				lists.add(result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		//System.out.println(lists);
		return lists;
	}
	
	/**
	 * 查出所有记录的月份，返回月份集合
	 * @return
	 */
	public List<String> getMonth(){
		List<String> months=null;
		try {
			months=new ArrayList<>();
			String sql="select bDate from JZY_BRAND";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				String month=rs.getString("bDate").split("-")[1];
				System.out.println(month);
				months.add(month);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return months;
	}
	
	/**
	 * 查出所有设备的id
	 */
	public List<String> getBIDs(){
		List<String> list=null;
		try {
			list=new ArrayList<>();
			String sql="select bid from jzy_brand";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				String bid=rs.getString("bid");
				list.add(bid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list;
	}
	
	/**
	 * 根据设备id查询设备信息
	 * @author Administrator
	 *
	 */
	public Brand getBrand(String bid){
		Brand brand=null;
		try {
			brand=new Brand();
			String sql="select bNumber,bId,bName,btype,bAddress,bDate,bstatic from jzy_brand where bId=?";
			ResultSet rs=db.executeQuery(sql,bid);
			
			while(rs.next()){
				Brand brand1=new Brand();
				String bNumber=rs.getString("bNumber");
				String bId=rs.getString("bId");
				String bName=rs.getString("bName");
				String btype=rs.getString("btype");
				String bAddress=rs.getString("bAddress");
				String bDate=rs.getString("bDate");
				String bstatic=rs.getString("bstatic");
				brand1.setbNumber(bNumber);
				brand1.setbId(bId);
				brand1.setbName(bName);
				brand1.setBtype(btype);
				brand1.setbAddress(bAddress);
				brand1.setbDate(bDate);
				brand1.setBstatic(bstatic);
				brand=brand1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return brand;
	}
	
	public void addBrand(Brand brand){
		String sql="insert into jzy_brand values(?,?,?,?,?,?,?)";
		int  result=db.executeUpdate(sql,brand.getbNumber(),brand.getbId(),brand.getbName(),brand.getBtype(),brand.getbAddress(),brand.getbDate(),brand.getBstatic());
		if(result!=-1){
			System.out.println("插入成功");
		}
	}
	
	public void deleteBrand(String bid){
		String sql="delete from jzy_brand where bId=?";
		int  result=db.executeUpdate(sql,bid);
		if(result!=-1){
			System.out.println("删除成功");
		}
	}
	
	public void modifyBrand(String bid,Brand brand){
		String sql="update jzy_brand set bNumber=?, bName=?,btype=?,bAddress=?,bDate=?,bstatic=? where bId=?";
		int  result=db.executeUpdate(sql,brand.getbNumber(),brand.getbName(),brand.getBtype(),brand.getbAddress(),brand.getbDate(),brand.getBstatic(),bid);
		if(result!=-1){
			System.out.println("修改成功");
		}else{
			System.out.println("======");
		}
	}
	
	public PageInfo queryPage(PageInfo page){
		List<Brand> brands=new ArrayList<>();
		String sql="select   bNumber,bId,bName,btype,bAddress,bDate,bstatic from (select rownum as rr,bNumber,bId,bName,btype,bAddress,bDate,bstatic from jzy_brand where rownum <= ?) T where T.rr > ?";
		try {
			System.out.println(page.getCurrentPage());
			ResultSet rs=db.executeQuery(sql,page.getCurrentPage()*page.getPageCount(),(page.getCurrentPage()-1)*page.getPageCount());
			while(rs.next()){
				Brand brand1=new Brand();
				String bNumber=rs.getString("bNumber");
				String bId=rs.getString("bId");
				String bName=rs.getString("bName");
				String btype=rs.getString("btype");
				String bAddress=rs.getString("bAddress");
				String bDate=rs.getString("bDate");
				String bstatic=rs.getString("bstatic");
				brand1.setbNumber(bNumber);
				brand1.setbId(bId);
				brand1.setbName(bName);
				brand1.setBtype(btype);
				brand1.setbAddress(bAddress);
				brand1.setbDate(bDate);
				brand1.setBstatic(bstatic);
				brands.add(brand1);
			}
			page.setValue(brands);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return page;
	}
	
	public static void main(String[] args) {
//		List<Brand> brands=new ArrayList<>();
	BrandInfo b=new BrandInfo();
//		brands=b.getAllBrands();
//		for(Brand b1:brands){
//			System.out.println(b1);
//		}
		
//		List<Integer> list=b.getcount();
	//b.getcountByType();
		
	}
}
