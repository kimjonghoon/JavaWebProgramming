package net.java_school.commons;

public class Paginator {

	public PagingNumbers getPagingNumbers(int totalRecords, int page, int recordsPerPage, int pagesPerGroup) {
		int totalPages = totalRecords / recordsPerPage;
		if (totalRecords % recordsPerPage != 0) {
			totalPages++;
		}

		int totalGroups = totalPages / pagesPerGroup;

		if (totalPages % pagesPerGroup != 0) {
			totalGroups++;
		}

		int group = page / pagesPerGroup;
		if (page % pagesPerGroup != 0) {
			group++;
		}

		int startPage = (group - 1) * pagesPerGroup + 1;
		int finalPage = group * pagesPerGroup;

		int finalOfPrevGroup = 0;
		if (group > 1) {
			finalOfPrevGroup = startPage - 1;
		}

		int startOfNextGroup = 0;
		if (group < totalGroups) {
			startOfNextGroup = finalPage + 1;
		}
		if (group >= totalGroups) {
			finalPage = totalPages;
		}

		int listItemNo = totalRecords - (page - 1) * recordsPerPage;

		PagingNumbers numbers = new PagingNumbers();

		numbers.setLastPage(totalPages);
		numbers.setStartPage(startPage);
		numbers.setFinalPage(finalPage);
		numbers.setFinalOfPrevGroup(finalOfPrevGroup);
		numbers.setStartOfNextGroup(startOfNextGroup);
		numbers.setListItemNo(listItemNo);

		return numbers;
	}
}