/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDTO;
import hungnm.article.ArticleDAO;
import hungnm.article.ArticleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
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
public class PostArticleServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(PostArticleServlet.class);
    private final String LOGIN_PAGE = "login.jsp";
    private final String ERROR_PAGE = "error.html";

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
        //get session
        HttpSession session = request.getSession();
        AccountDTO accountDto = (AccountDTO) session.getAttribute("USER");
        //default url
        String url = ERROR_PAGE;
        try {
            if (accountDto != null) {
                //get params
                String email_user = accountDto.getEmail();
                String tittle = request.getParameter("txtTittle");
                String content = request.getParameter("txtContent");
                content = content.replaceAll("\n","<br>");
                String linkImageArticle = request.getParameter("txtLinkImageArticle");
                String isDelete = "Active";  
                String txtSearchValue = "";
                //process function
                ArticleDTO articleDto = new ArticleDTO(null, email_user, tittle, content, linkImageArticle, isDelete, content);
                ArticleDAO articleDao = new ArticleDAO();
                boolean result = false;
                result = articleDao.createArticle(articleDto);
                //process result
                if(result){
                url = "DispathController?btAction=search&txtSearchValue=" + txtSearchValue;
                }//end of if result
            } else {
                url = LOGIN_PAGE;
            }//end if accountDto != null
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at PostArticleServlet: " + ex.getMessage());
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at PostArticleServlet: " + ex.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            url = ERROR_PAGE;
            LOG.error("NoSuchAlgorithmException at PostArticleServlet: " + ex.getMessage());
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
