package com.ifly.page;

import java.util.List;

public class PageInfo {
/** ����**/
	private List<?> value;
	
	/** ÿҳ�ܹ���ʾ�ļ�¼��*/
	private Integer pageCount=4;
	/** ��һҳ*/
    private Integer prePage;
    /** ��һҳ*/
	private Integer nextPage;
	/** ��ǰҳ*/
	private Integer currentPage = 1;
	/** ҳ��*/
	private Integer count;
	public List<?> getValue() {
		return value;
	}
	public void setValue(List<?> value) {
		this.value = value;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getPrePage() {
		return prePage;
	}
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}
	public Integer getNextPage() {
		return nextPage;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
