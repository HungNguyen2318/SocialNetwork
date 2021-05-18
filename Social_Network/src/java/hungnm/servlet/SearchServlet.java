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
import java.sql.SQLException;
import java.util.ArrayList;
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
public class SearchServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(SearchServlet.class);
    private final String ERROR_PAGE = "error.html";
    private final String LOGIN_PAGE = "login.jsp";
    private final String HOME_PAGE = "home_page.jsp";

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
        //get session, attribute USER
        HttpSession session = request.getSession();
        AccountDTO accountDto = (AccountDTO) session.getAttribute("USER");
        //default url
        String url = ERROR_PAGE;
        try {
            if (accountDto != null) {
                //get params
                String searchValue = request.getParameter("txtSearchValue");
                String offset = request.getParameter("txtPageNumber");
                //process offset for paging
                if (offset == null) {
                    offset = "1";
                }//end of if offset == null
                //process function
                ArticleDAO articleDao = new ArticleDAO();
                List<ArticleDTO> listOfArticle = new ArrayList<>();             //list of ArticleDTO
                listOfArticle = articleDao.findByLikeContent(searchValue, Integer.valueOf(offset) * 20 - 20);
                int totalResult = articleDao.countArticle(searchValue);         //number of article found
                List<Integer> listOfPageNumber = new ArrayList<>();
                for (int i = 0; i < totalResult / 20 + 1 && i*20 < totalResult; i++) {
                    Integer pageNumber = new Integer(i + 1);
                    listOfPageNumber.add(pageNumber);
                }//end of for
                //check result
                if (listOfArticle != null) {
                    session.setAttribute("ListOfArticle", listOfArticle);
                    session.setAttribute("listOfPageNumber", listOfPageNumber);
                    url = HOME_PAGE;
                }//end of if listOfArticle != null
            } else {
                url = LOGIN_PAGE;
            }//end of if accountDto != null
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at SearchServlet: " + ex.getMessage());
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at SearchServlet: " + ex.getMessage());
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
