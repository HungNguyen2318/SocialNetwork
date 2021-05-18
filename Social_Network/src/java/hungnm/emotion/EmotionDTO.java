/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.emotion;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class EmotionDTO implements Serializable{
    private String emotionsId;
    private String articleId;
    private String Email;
    private String typeId;
    private String createdDate;

    public EmotionDTO() {
    }

    public EmotionDTO(String emotionsId, String articleId, String Email, String typeId, String createdDate) {
        this.emotionsId = emotionsId;
        this.articleId = articleId;
        this.Email = Email;
        this.typeId = typeId;
        this.createdDate = createdDate;
    }

    public EmotionDTO(String articleId, String Email, String typeId) {
        this.articleId = articleId;
        this.Email = Email;
        this.typeId = typeId;
    }
    
    

    public String getEmotionsId() {
        return emotionsId;
    }

    public void setEmotionsId(String emotionsId) {
        this.emotionsId = emotionsId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
    
}
