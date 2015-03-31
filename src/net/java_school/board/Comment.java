package net.java_school.board;

import java.util.Date;

public class Comment {
    private int commentNo;
    private int articleNo;
    private String email;//댓글 작성자ID에 해당하는 email
    private String name;//댓글 작성자 이름
    private String memo;
    private Date regdate;
    
    public int getCommentNo() {
        return commentNo;
    }
    public void setCommentNo(int commentNo) {
        this.commentNo = commentNo;
    }
    public int getArticleNo() {
        return articleNo;
    }
    public void setArticleNo(int articleNo) {
        this.articleNo = articleNo;
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
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    
}