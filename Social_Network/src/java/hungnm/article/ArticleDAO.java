/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.article;

import hungnm.database.DatabaseUtil;
import java.security.NoSuchAlgorithmException;
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
public class ArticleDAO {

    public boolean createArticle(ArticleDTO articleDto) throws NamingException, SQLException, NoSuchAlgorithmException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "Insert into Article(Email,Tittle,ContentArticle,LinkImageArticle,IsDelete) "
                        + "values(?,?,?,?,?)";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, articleDto.getEmail());
                stm.setString(2, articleDto.getTittle());
                stm.setString(3, articleDto.getContentArticle());
                stm.setString(4, articleDto.getLinkImageArticle());
                stm.setString(5, articleDto.getIsDelete());
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

    public List<ArticleDTO> findByLikeContent(String searchValue, int offset) throws SQLException, NamingException {
        ArticleDTO articleDto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = null;
        List<ArticleDTO> listOfArticle = new ArrayList<>();
        try {
            con = DatabaseUtil.makeConnection();
            sql = "SELECT ArticleId,Email,Tittle,ContentArticle,LinkImageArticle,IsDelete,CreatedDay "
                    + "FROM Article "
                    + "Where ContentArticle like ? and IsDelete = ? "
                    + "ORDER BY CreatedDay DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            stm.setString(2, "Active");
            stm.setInt(3, offset);
            rs = stm.executeQuery();
            while (rs.next()) {
                String articleId = rs.getString("ArticleId");
                String email = rs.getString("Email");
                String tittle = rs.getString("Tittle");
                String contentArticle = rs.getString("ContentArticle");
                String linkImageArticle = rs.getString("LinkImageArticle");
                String isDelete = rs.getString("IsDelete");
                String createdDate = rs.getString("CreatedDay");
                articleDto = new ArticleDTO(articleId, email, tittle, contentArticle, linkImageArticle, isDelete, createdDate);
                listOfArticle.add(articleDto);
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
        return listOfArticle;
    }

    public int countArticle(String searchValue) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        String sql = null;
        ResultSet rs = null;
        int result = 0;
        try {
            con = DatabaseUtil.makeConnection();
            sql = "Select ArticleID from Article where ContentArticle like ? and IsDelete = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            stm.setString(2, "Active");
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
    
    public boolean deleteArticle(String articleId)
            throws NamingException, SQLException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "UPDATE Article SET IsDelete = 'Delete' Where ArticleId = ?";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, articleId);
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
    
    public ArticleDTO findByArticleId(String searchValue)
            throws SQLException, NamingException {
        ArticleDTO articleDto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.makeConnection();
            String sql = "SELECT ArticleId,Email,Tittle,ContentArticle,LinkImageArticle,IsDelete,CreatedDay "
                    + "FROM Article "
                    + "Where ArticleId = ? and IsDelete = ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, searchValue);
            stm.setString(2, "Active");
            rs = stm.executeQuery();

            if (rs.next()) {
                String articleId = rs.getString("ArticleId");
                String email = rs.getString("Email");
                String tittle = rs.getString("Tittle");
                String contentArticle = rs.getString("ContentArticle");
                String linkImageArticle = rs.getString("LinkImageArticle");
                String isDelete = rs.getString("IsDelete");
                String createdDate = rs.getString("CreatedDay");
                articleDto = new ArticleDTO(articleId, email, tittle, contentArticle, linkImageArticle, isDelete, createdDate);
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
        return articleDto;
    }
}
