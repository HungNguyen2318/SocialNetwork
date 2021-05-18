/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDTO;
import hungnm.article.ArticleDAO;
import hungnm.article.ArticleDTO;
import hungnm.comment.CommentDAO;
import hungnm.comment.CommentDTO;
import hungnm.emotion.EmotionDAO;
import hungnm.emotion.EmotionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class ViewDetailServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(ViewDetailServlet.class);
    private final String ERROR_PAGE = "error.html";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String ARTICLE_DETAIL_PAGE = "article_detail.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //get session, attribte USER
        HttpSession session = request.getSession();
        AccountDTO accountDto = (AccountDTO) session.getAttribute("USER");
        //default url
        String url = LOGIN_PAGE;
        try {
            if (accountDto != null) {
                //get param
                String txtArticleId = request.getParameter("txtArticleId");
                //process function
                ArticleDAO articleDao = new ArticleDAO();
                ArticleDTO articleDto = articleDao.findByArticleId(txtArticleId);
                EmotionDAO emotionDao = new EmotionDAO();
                EmotionDTO emotionDto = emotionDao.findByEmotionId(txtArticleId, accountDto.getEmail());
                int numberOfLike = emotionDao.countEmotion(txtArticleId, 1);    //number of like
                int numberOfDislike = emotionDao.countEmotion(txtArticleId, 2); //number of dislike
                CommentDAO commentDao = new CommentDAO();
                List<CommentDTO> listOfComment = commentDao.findByEmotionId(txtArticleId);
                //set request Attribute
                request.setAttribute("ListOfComment", listOfComment);
                request.setAttribute("NumberOfLike", numberOfLike);
                request.setAttribute("NumberOfDislike", numberOfDislike);
                request.setAttribute("EmotionDto", emotionDto);
                request.setAttribute("ArticleDetail", articleDto);
                url = ARTICLE_DETAIL_PAGE;
            } else {
                url = ERROR_PAGE;
            }//end of if accountDto != null
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at ViewDetailServlet: " + ex.getMessage());
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at ViewDetailServlet: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
