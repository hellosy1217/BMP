package com.project.bmp.post.model.vo;

import com.project.bmp.common.Paging;

public class ListInfo {
	private int accessor_no;
	private int blog_no;
	private String sort;
	private String searchFilter;
	private String keyword;
	private Paging paging;

	public ListInfo() {
	}

	public ListInfo(int accessor_no, String sort, String searchFilter, String keyword) {
		super();
		this.accessor_no = accessor_no;
		this.sort = sort;
		this.searchFilter = searchFilter;
		this.keyword = keyword;
	}

	public ListInfo(int accessor_no, int blog_no, String sort, String searchFilter, String keyword, Paging paging) {
		super();
		this.accessor_no = accessor_no;
		this.blog_no = blog_no;
		this.sort = sort;
		this.searchFilter = searchFilter;
		this.keyword = keyword;
		this.paging = paging;
	}

	public int getAccessor_no() {
		return accessor_no;
	}

	public void setAccessor_no(int accessor_no) {
		this.accessor_no = accessor_no;
	}

	public int getBlog_no() {
		return blog_no;
	}

	public void setBlog_no(int blog_no) {
		this.blog_no = blog_no;
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
		return "ListInfo [accessor_no=" + accessor_no + ", blog_no=" + blog_no + ", sort=" + sort + ", searchFilter="
				+ searchFilter + ", keyword=" + keyword + ", paging=" + paging + "]";
	}

}
