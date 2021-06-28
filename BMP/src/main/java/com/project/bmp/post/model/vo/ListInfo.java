package com.project.bmp.post.model.vo;

import com.project.bmp.common.Paging;

public class ListInfo {
	private int accessorNo;
	private int blogNo;
	private String sort;
	private String keyword;
	private String tab;
	private Paging paging;

	public ListInfo() {
	}

	public ListInfo(int accessorNo, String sort, String keyword, String tab) {
		super();
		this.accessorNo = accessorNo;
		this.sort = sort;
		this.keyword = keyword;
		this.tab = tab;
	}

	public ListInfo(int accessorNo, int blogNo, String sort, String searchFilter, String keyword, String tab,
			Paging paging) {
		super();
		this.accessorNo = accessorNo;
		this.blogNo = blogNo;
		this.sort = sort;
		this.keyword = keyword;
		this.tab = tab;
		this.paging = paging;
	}

	public int getAccessor_no() {
		return accessorNo;
	}

	public void setAccessor_no(int accessorNo) {
		this.accessorNo = accessorNo;
	}

	public int getBlogNo() {
		return blogNo;
	}

	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	@Override
	public String toString() {
		return "ListInfo [accessorNo=" + accessorNo + ", blogNo=" + blogNo + ", sort=" + sort + ", searchFilter="
				+ ", keyword=" + keyword + ", tab=" + tab + ", paging=" + paging + "]";
	}

}
