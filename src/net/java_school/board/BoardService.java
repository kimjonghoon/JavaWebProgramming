package net.java_school.board;

import java.util.*;

import net.java_school.commons.PagingHelper;

public class BoardService {
    private BoardDao dao = BoardDao.getInstance(); //게시판 DAO
    private PagingHelper pagingHelper; //페이징 처리 유틸리티 
    
    public BoardService() {}
    
    //게시판 목록 조회
    public ArrayList<Article> getArticleList(String boardCd, String searchWord) {
        int startRownum = pagingHelper.getStartRecord();
        int endRownum = pagingHelper.getEndRecord();
        return dao.selectListOfArticles(boardCd, searchWord, startRownum, endRownum);
    }
    
    //총레코드수 구하기
    public int getTotalRecord(String boardCd, String searchWord) {
        return dao.selectCountOfArticles(boardCd, searchWord);
    }

    //글쓰기
    public void addArticle(Article article, AttachFile attachFile) {
        dao.insert(article, attachFile);
    }

    //글수정
    public void modifyArticle(Article article, AttachFile attachFile) {
        dao.update(article, attachFile);
    }

    //글삭제
    public void removeArticle(int articleNo) {
        dao.delete(articleNo);
    }
    
    //조회수 증가
    public void increaseHit(int articleNo) {
        dao.updateHitPlusOne(articleNo);
    }
    
    //P.K로 게시글 조회(상세보기view.jsp)
    public Article getArticle(int articleNo) {
        return dao.selectOne(articleNo);
    }
    
    //P.K 에 해당하는 글의 다음글(상세보기view.jsp 다음글)
    public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
        return dao.selectNextOne(articleNo, boardCd, searchWord);
    }

    //P.K 에 해당하는 글의 이전글(상세보기view.jsp 이전글)
    public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
        return dao.selectPrevOne(articleNo, boardCd, searchWord);
    }

    //첨부파일 리스트 조회(상세보기view.jsp)
    public ArrayList<AttachFile> getAttachFileList(int articleNo) {
        return dao.selectListOfAttachFiles(articleNo);
    }
    
    //첨부파일 레코드 삭제
    public void removeAttachFile(int attachFileNo) {
        dao.deleteFile(attachFileNo);
    }
    
    //게시판 이름 조회(목록list.jsp,상세보기view.jsp,글쓰기write_form.jsp,글수정modify_form.jsp)
    public String getBoardNm(String boardCd) {
        return dao.selectOneBoardName(boardCd);
    }

    //댓글 추가
    public void addComment(Comment comment) {
        dao.insertComment(comment);
    }

    //댓글 수정
    public void modifyComment(Comment comment) {
        dao.updateComment(comment);
    }
    
    //댓글 삭제
    public void removeComment(int commentNo) {
        dao.deleteComment(commentNo);
    }

    //댓글 리스트 조회
    public ArrayList<Comment> getCommentList(int articleNo) {
        return dao.selectListOfComments(articleNo);
    }

    //첨부파일 찾기
    public AttachFile getAttachFile(int attachFileNo) {
        return dao.selectOneAttachFile(attachFileNo);
    }

    //P.K로 댓글 찾기
    public Comment getComment(int commentNo) {
        return dao.selectOneOfComment(commentNo);
    }
    
    public int getListItemNo() {
        return this.pagingHelper.getListItemNo();
    }
    
    public int getPrevPage() {
        return pagingHelper.getPrevPage();
    }
    
    public int getFirstPage() {
        return pagingHelper.getFirstPage();
    }
    
    public int getLastPage() {
        return pagingHelper.getLastPage();
    }
    
    public int getNextPage() {
        return pagingHelper.getNextPage();
    }
    
    public void setPagingHelper(PagingHelper pagingHelper) {
    	this.pagingHelper = pagingHelper;
    }
}