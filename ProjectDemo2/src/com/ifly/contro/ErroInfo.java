package com.ifly.contro;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ifly.dao.DbHelper;
import com.ifly.page.PageInfo;
import com.ifly.pojo.ErrBs;
import com.ifly.pojo.ErrorB;

public class ErroInfo {
	private DbHelper db = new DbHelper();
	
	public List<ErrorB> getAllErrs(){
		 List<ErrorB> errs=null;
		String sql="select id,bid,etatic,edate from JZY_ERROR_TAB";
		try {
			errs=new ArrayList<>();
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				ErrorB e=new ErrorB();
				e.setId(rs.getString("id"));
				e.setBid(rs.getString("bid"));
				e.setEtatic(rs.getString("etatic"));
				e.setEdate(rs.getString("edate"));
				
				errs.add(e);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return errs;
		
	}
	
	/**
	 * 查询出设备表和故障表的信息显示到页面
	 * @return
	 */
	public List<ErrBs> getAllErrsB(){
		 List<ErrBs> errs=null;
		String sql="select id,bnumber,JZY_BRAND.BID,bname,btype,bdate,etatic,edate from JZY_ERROR_TAB,JZY_BRAND where JZY_ERROR_TAB.Bid=JZY_BRAND.BID";
		try {
			errs=new ArrayList<>();
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				ErrBs e=new ErrBs();
				e.setId(rs.getString("id"));
				e.setBid(rs.getString("bid"));
				e.setEtatic(rs.getString("etatic"));
				e.setEdate(rs.getString("edate"));
				e.setBnumber(rs.getString("bnumber"));
				e.setBname(rs.getString("bname"));
				e.setBtype(rs.getString("btype"));
				e.setBdate(rs.getString("bdate"));
				
				errs.add(e);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return errs;
		
	}
	
	
	
	/**
	 * 新增
	 * @param addr
	 * @return
	 */
	public void add(ErrorB err){
		String sql="insert into JZY_ERROR_TAB values(?,?,?,?)";
		int rl=db.executeUpdate(sql, err.getId(),err.getBid(),err.getEtatic(),err.getEdate());		
		if(rl!=-1){
			System.out.println("成功");
		}
	}
	
	/**
	 * 分页查询全部信息
	 * @param page
	 * @return
	 */
	public PageInfo queryPage(PageInfo page){
		List<ErrBs> errs=new ArrayList<>();
		String sql="select   id,bnumber,bid,bname,btype,bdate,etatic,edate from (select rownum as rr,id,bnumber,JZY_BRAND.BID,bname,btype,bdate,etatic,edate from JZY_ERROR_TAB,JZY_BRAND where JZY_ERROR_TAB.Bid=JZY_BRAND.BID and rownum <= ?) T where T.rr > ?";
		try {
			ResultSet rs=db.executeQuery(sql,page.getCurrentPage()*page.getPageCount(),(page.getCurrentPage()-1)*page.getPageCount());
			while(rs.next()){
				ErrBs e=new ErrBs();
				e.setId(rs.getString("id"));
				e.setBid(rs.getString("bid"));
				e.setEtatic(rs.getString("etatic"));
				e.setEdate(rs.getString("edate"));
				e.setBnumber(rs.getString("bnumber"));
				e.setBname(rs.getString("bname"));
				e.setBtype(rs.getString("btype"));
				e.setBdate(rs.getString("bdate"));
				
				errs.add(e);
			}
			page.setValue(errs);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return page;
	}
	
//	public static void main(String[] args) {
//		ErroInfo eInfo=new ErroInfo();
//		eInfo.getAllErrsB();
//		
//	}
}
