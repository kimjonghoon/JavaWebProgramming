package net.java_school.board;

import java.util.Date;

public class Article {
    private int articleNo;
    private String boardCd;
    private String title;
    private String content;
    private String email; //글 소유자 ID에 해당하는 email
    private String name; //글 소유자 이름
    private int hit;
    private Date regdate;
    private int attachFileNum;
    private int commentNum;
    
    public int getArticleNo() {
        return articleNo;
    }
    public void setArticleNo(int articleNo) {
        this.articleNo = articleNo;
    }
    public String getBoardCd() {
        return boardCd;
    }
    public void setBoardCd(String boardCd) {
        this.boardCd = boardCd;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getHit() {
        return hit;
    }
    public void setHit(int hit) {
        this.hit = hit;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public int getAttachFileNum() {
        return attachFileNum;
    }
    public void setAttachFileNum(int attachFileNum) {
        this.attachFileNum = attachFileNum;
    }
    public int getCommentNum() {
        return commentNum;
    }
    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }
    
}
