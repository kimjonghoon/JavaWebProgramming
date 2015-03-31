package net.java_school.commons;

public class PagingHelper {
    private int totalPage; //총페이지수
    private int firstPage; //블록의 첫번째 페이지 번호
    private int lastPage; //블록의 마지막 페이지 번호
    private int prevPage; //[이전]
    private int nextPage; //[다음]
    private int listItemNo; //목록 아이템에 붙여지는 번호
    private int startRecord; //오라클 시작 ROWNUM for 목록조회
    private int endRecord; //오라클 마지막 ROWNUM for 목록조회

    public PagingHelper(
            int totalRecord, 
            int curPage, 
            int numPerPage, 
            int pagePerBlock) {
        
        //총페이지수를 구한다.
        if (totalRecord % numPerPage == 0) {
            this.totalPage = totalRecord / numPerPage;
        } else {
            this.totalPage = totalRecord / numPerPage + 1;
        }
        
        int totalBlock = 1;//총블록수
        if (totalPage % pagePerBlock == 0) {
            totalBlock = totalPage / pagePerBlock;
        } else {
            totalBlock = totalPage / pagePerBlock + 1;
        }
        
        int block = 1;//현재 블록
        if (curPage % pagePerBlock == 0) {
            block = curPage / pagePerBlock;
        } else {
            block = curPage / pagePerBlock + 1;
        }
        
        //현재 블록에 속한 첫번째 페이지와 마지막 페이지를 구한다.
        this.firstPage = (block - 1) * pagePerBlock + 1;
        this.lastPage = block * pagePerBlock;
        
        //현재 블록이 총블록수(마지막블록번호)보다 크거나 같다면 마지막 페이지를 총페이지수로 바꾼다. 
        if (block >= totalBlock) {
            this.lastPage = totalPage;
        }
        
        //블록이 1보다 크다면 [이전]링크에 해당하는 페이지 번호를 구한다.
        if (block > 1) {
            this.prevPage = firstPage - 1;
        }
        
        //블록이 총블록수(마지막 블록번호)보다 작다면 [다음]링크에 해당하는 페이지 번호를 구한다. 
        if (block < totalBlock) {
            this.nextPage = lastPage + 1;
        }
        
        //list.jsp 에서 목록 아이템앞에 붙여지는 번호를 계산한다.
        this.listItemNo = totalRecord - (curPage - 1) * numPerPage;
        
        //목록을 구하기 위해서 첫번째 레코드번호와 마지막 레코드 번호를 구한다.
        this.startRecord = (curPage - 1) * numPerPage + 1;
        this.endRecord = startRecord + numPerPage - 1;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public int getPrevPage() {
        return prevPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public int getListItemNo() {
        return listItemNo;
    }

    public int getStartRecord() {
        return startRecord;
    }

    public int getEndRecord() {
        return endRecord;
    }

}
