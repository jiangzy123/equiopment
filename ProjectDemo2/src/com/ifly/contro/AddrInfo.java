package com.ifly.contro;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ifly.dao.DbHelper;
import com.ifly.page.PageInfo;
import com.ifly.pojo.Addr;
import com.ifly.pojo.Brand;


public class AddrInfo {
	private DbHelper db = new DbHelper();
	
	/**
	 * ����ȫ���ĵ�ַ��Ϣ
	 * @return
	 */
	public List<Addr> getAllAddrs(){
		List<Addr> addrs=null;
		String sql="select   address,man,atype,phone,aid from JZY_ADDRESS";
		try {
			addrs=new ArrayList<Addr>();
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				Addr addr=new Addr();
				addr.setAddress(rs.getString("address"));
				addr.setMan(rs.getString("man"));
				addr.setAtype(rs.getString("atype"));
				addr.setPhone(rs.getString("phone"));
				addr.setId(rs.getString("aid"));
				addrs.add(addr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return addrs;
	}
	/**
	 * ���ݵ�ַ���������豸��ַ��Ϣ
	 * @param address
	 * @param atype
	 * @return
	 */
	public List<Addr> getAddr(String address,String atype){
		List<Addr> addrs=null;
		String sql="select   address,man,atype,phone from JZY_ADDRESS where address=? and atype=?";
		try {
			
			addrs=new ArrayList<Addr>();
			ResultSet rs=db.executeQuery(sql,address,atype);
			while(rs.next()){
				Addr addr=new Addr();
				addr.setAddress(rs.getString("address"));
				addr.setMan(rs.getString("man"));
				addr.setAtype(rs.getString("atype"));
				addr.setPhone(rs.getString("phone"));
				addrs.add(addr);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return addrs;
	}
	/**
	 * ����
	 * @param addr
	 * @return
	 */
	public void add(Addr addr){
		String sql="insert into JZY_ADDRESS values(?,?,?,?,?)";
		int rl=db.executeUpdate(sql, addr.getAddress(),addr.getMan(),addr.getAtype(),addr.getPhone(),addr.getId());		
		if(rl!=-1){
			System.out.println("�ɹ�");
		}
	}
	
	public void delete(String id){
		String sql="delete from JZY_ADDRESS where aId=?";
		int  result=db.executeUpdate(sql,id);
		if(result!=-1){
			System.out.println("ɾ���ɹ�");
		}
	}
	
	public void modifyAddr(String id,Addr addr){
		String sql="update JZY_ADDRESS set address=?, man=?,atype=?,phone=? where aid=?";
		int  result=db.executeUpdate(sql,addr.getAddress(),addr.getMan(),addr.getAtype(),addr.getPhone(),id);
		if(result!=-1){
			System.out.println("�޸ĳɹ�");
		}else{
			System.out.println("===�޸�ʧ��===");
		}
	}
	
	/**
	 * ����ַ��Ϣ���з�ҳ
	 * @param page
	 * @return
	 */
	public PageInfo queryPage(PageInfo page){
		List<Addr> addrs=new ArrayList<>();
		String sql="select   address,man,atype,phone,aid from (select rownum as rr,address,man,atype,phone,aid from JZY_ADDRESS where rownum <= ?) T where T.rr > ?";
		try {
			ResultSet rs=db.executeQuery(sql,page.getCurrentPage()*page.getPageCount(),(page.getCurrentPage()-1)*page.getPageCount());
			while(rs.next()){
				Addr addr=new Addr();
				addr.setAddress(rs.getString("address"));
				addr.setMan(rs.getString("man"));
				addr.setAtype(rs.getString("atype"));
				addr.setPhone(rs.getString("phone"));
				addr.setId(rs.getString("aid"));
				addrs.add(addr);
			}
			page.setValue(addrs);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return page;
	}
	
	
}
