/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.comment;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CommentDTO implements Serializable{
    private String commentId;
    private String articleId;
    private String email;
    private String content;
    private String createdDate;
    private String isDelete;

    public CommentDTO() {
    }

    public CommentDTO(String articleId, String email, String content) {
        this.articleId = articleId;
        this.email = email;
        this.content = content;
    }

    public CommentDTO(String commentId, String articleId, String email, String content, String createdDate, String isDelete) {
        this.commentId = commentId;
        this.articleId = articleId;
        this.email = email;
        this.content = content;
        this.createdDate = createdDate;
        this.isDelete = isDelete;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
    
    
}
