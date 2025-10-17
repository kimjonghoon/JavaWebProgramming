package net.java_school.commons;

public class PagingNumbers {

    private int lastPage;
    private int startPage;
    private int finalPage;
    private int finalOfPrevGroup;
    private int startOfNextGroup;
    private int listItemNo;
    
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getFinalPage() {
		return finalPage;
	}
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}
	public int getFinalOfPrevGroup() {
		return finalOfPrevGroup;
	}
	public void setFinalOfPrevGroup(int finalOfPrevGroup) {
		this.finalOfPrevGroup = finalOfPrevGroup;
	}
	public int getStartOfNextGroup() {
		return startOfNextGroup;
	}
	public void setStartOfNextGroup(int startOfNextGroup) {
		this.startOfNextGroup = startOfNextGroup;
	}
	public int getListItemNo() {
		return listItemNo;
	}
	public void setListItemNo(int listItemNo) {
		this.listItemNo = listItemNo;
	}
}