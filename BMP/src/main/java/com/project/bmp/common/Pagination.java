package com.project.bmp.common;

public class Pagination {
	public Pagination() {
	}

	public Paging getPaging(int currentPage, int boardLimit, int listCount) {
		int pageLimit = 5; // 한 페이지에 표시될 페이지 수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		Paging paging = new Paging(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		return paging;
	}
}
