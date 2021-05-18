/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.comment;

import hungnm.database.DatabaseUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class CommentDAO implements Serializable {

    public boolean postComment(CommentDTO commentDto) throws NamingException, SQLException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                String sql = "Insert into [Comment](ArticleID,Email,Content,IsDelete) values (?,?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, commentDto.getArticleId());
                stm.setString(2, commentDto.getEmail());
                stm.setString(3, commentDto.getContent());
                stm.setInt(4, 0);

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

    public List<CommentDTO> findByEmotionId(String articleId)
            throws SQLException, NamingException {
        CommentDTO commentDto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<CommentDTO> listOfComment = new ArrayList<>();
        try {
            con = DatabaseUtil.makeConnection();
            String sql = "Select CommentID,Email,Content,CreatedDay from [Comment] where ArticleID = ? and IsDelete = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, articleId);
            stm.setInt(2, 0);
            rs = stm.executeQuery();

            while (rs.next()) {
                String commentId = rs.getString("CommentID");
                String email = rs.getString("Email");
                String content = rs.getString("Content");
                String createdDate = rs.getString("CreatedDay");
                commentDto = new CommentDTO(commentId, articleId, email, content, createdDate, "0");
                listOfComment.add(commentDto);
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
        return listOfComment;
    }

    public boolean deleteComment(String commentId)
            throws NamingException, SQLException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "UPDATE [Comment] SET IsDelete = ? Where CommentID = ?";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setInt(1, 1);
                stm.setString(2, commentId);
                //4.Execute Query
                int row = stm.executeUpdate();
                //5.Process result
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
}
