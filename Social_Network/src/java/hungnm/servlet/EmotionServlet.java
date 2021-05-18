/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDTO;
import hungnm.emotion.EmotionDAO;
import hungnm.emotion.EmotionDTO;
import hungnm.notification.NotificationDAO;
import hungnm.notification.NotificationDTO;
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
public class EmotionServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(EmotionServlet.class);
    private final String ERROR_PAGE = "error.html";
    private static final String LOGIN_PAGE = "login.jsp";

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
                String button = request.getParameter("btAction");
                String typeId = request.getParameter("txtTypeId");
                String articleId = request.getParameter("txtArticleId");
                String email = request.getParameter("txtEmail");
                String emailAuthor = request.getParameter("txtEmailAuthor");
                String tittle = request.getParameter("txtTittle");
                //process if button is Like or Dislike
                if (button.equals("Like")) {
                    switch (typeId) {
                        case "": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "1");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.makeEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>liked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "1": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "3");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>unliked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "2": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "1");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>liked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "3": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "1");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>liked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        default:
                            break;
                    }
                    url = "DispathController?btAction=View Detail&txtArticleId=" + articleId;
                } else {
                    switch (typeId) {
                        case "": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "2");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.makeEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>disliked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "1": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "2");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>disliked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "2": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "3");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>undisliked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        case "3": {
                            EmotionDTO emotionDto = new EmotionDTO(articleId, email, "2");
                            EmotionDAO emotionDao = new EmotionDAO();
                            emotionDao.updateEmotion(emotionDto);
                            request.setAttribute("EmotionDto", emotionDto);
                            String contentNotification = email + " <b>disliked</b> on your artilce: " + tittle;
                            NotificationDTO notificationDto = new NotificationDTO(articleId, emailAuthor, contentNotification);
                            NotificationDAO notificationDao = new NotificationDAO();
                            notificationDao.insertNotification(notificationDto);
                            break;
                        }
                        default:
                            break;
                    }
                    url = "DispathController?btAction=View Detail&txtArticleId=" + articleId;
                }
            } else {
                url = LOGIN_PAGE;
            }//end if Like
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at EmotionServlet: " + ex.getMessage());
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at EmotionServlet: " + ex.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            url = ERROR_PAGE;
            LOG.error("NoSuchAlgorithmException at EmotionServlet: " + ex.getMessage());
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
