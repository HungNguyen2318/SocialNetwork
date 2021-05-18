/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.emotion;

import hungnm.database.DatabaseUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class EmotionDAO implements Serializable {

    public boolean makeEmotion(EmotionDTO emotionDto) throws NamingException, SQLException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                String sql = "Insert into Emotion(ArticleID,Email,TypeID) values (?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, emotionDto.getArticleId());
                stm.setString(2, emotionDto.getEmail());
                stm.setString(3, emotionDto.getTypeId());

                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }//end if con existed
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateEmotion(EmotionDTO emotionDto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                String sql = "Update [Emotion] set TypeID = ? where ArticleID = ? and Email = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, Integer.valueOf(emotionDto.getTypeId()));
                stm.setString(2, emotionDto.getArticleId());
                stm.setString(3, emotionDto.getEmail());

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public EmotionDTO findByEmotionId(String articleId,String email)
            throws SQLException, NamingException {
        EmotionDTO emotionDto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.makeConnection();
            String sql = "Select  EmotionsID,TypeID,CreatedDay from Emotion where ArticleID = ? and Email = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, articleId);
            stm.setString(2, email);
            rs = stm.executeQuery();

            if (rs.next()) {
                String emotionsId = rs.getString("EmotionsID");
                String TypeID = rs.getString("TypeID");
                String createdDate = rs.getString("CreatedDay");
                emotionDto = new EmotionDTO(emotionsId, articleId, email, TypeID, createdDate);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return emotionDto;
    }
    
    public int countEmotion(String ArticleID, int typeId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        String sql = null;
        ResultSet rs = null;
        int result = 0;
        try {
            con = DatabaseUtil.makeConnection();
            sql = "Select ArticleID from Emotion where ArticleID = ? and TypeID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, ArticleID);
            stm.setInt(2, typeId);
            rs = stm.executeQuery();
            while(rs.next()){
                result = result + 1;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
}
