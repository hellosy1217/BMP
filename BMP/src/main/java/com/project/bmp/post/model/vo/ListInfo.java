package com.project.bmp.post.model.vo;

import com.project.bmp.common.Paging;

public class ListInfo {
	private int accessorNo;
	private int blogNo;
	private String sort;
	private String searchFilter;
	private String keyword;
	private Paging paging;

	public ListInfo() {
	}

	public ListInfo(int accessorNo, String sort, String searchFilter, String keyword) {
		super();
		this.accessorNo = accessorNo;
		this.sort = sort;
		this.searchFilter = searchFilter;
		this.keyword = keyword;
	}

	public ListInfo(int accessorNo, int blogNo, String sort, String searchFilter, String keyword, Paging paging) {
		super();
		this.accessorNo = accessorNo;
		this.blogNo = blogNo;
		this.sort = sort;
		this.searchFilter = searchFilter;
		this.keyword = keyword;
		this.paging = paging;
	}

	public int getAccessor_no() {
		return accessorNo;
	}

	public void setAccessor_no(int accessorNo) {
		this.accessorNo = accessorNo;
	}

	public int getBlog_no() {
		return blogNo;
	}

	public void setBlog_no(int blogNo) {
		this.blogNo = blogNo;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
				+ searchFilter + ", keyword=" + keyword + ", paging=" + paging + "]";
	}

}
