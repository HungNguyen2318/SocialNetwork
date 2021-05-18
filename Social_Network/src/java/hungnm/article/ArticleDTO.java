/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.article;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class ArticleDTO  implements Serializable{
    private String articleId;
    private String email;
    private String tittle;
    private String contentArticle;
    private String linkImageArticle;
    private String isDelete;
    private String createdDate;

    public ArticleDTO(String articleId, String email, String tittle, String contentArticle, String linkImageArticle, String isDelete, String createdDate) {
        this.articleId = articleId;
        this.email = email;
        this.tittle = tittle;
        this.contentArticle = contentArticle;
        this.linkImageArticle = linkImageArticle;
        this.isDelete = isDelete;
        this.createdDate = createdDate;
    }

    

    public ArticleDTO() {
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

    public String getContentArticle() {
        return contentArticle;
    }

    public void setContentArticle(String contentArticle) {
        this.contentArticle = contentArticle;
    }

    public String getLinkImageArticle() {
        return linkImageArticle;
    }

    public void setLinkImageArticle(String linkImageArticle) {
        this.linkImageArticle = linkImageArticle;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }
    
}
