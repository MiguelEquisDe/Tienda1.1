/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.RegistroDAO;
import beens.RegistroBeens;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vargas
 */
@WebServlet(name = "RegistroControl", urlPatterns = {"/RegistroControl"})
public class RegistroControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    RegistroBeens Beens = new RegistroBeens();
    String[] errores = new String[4];
    RegistroDAO DAO = new RegistroDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String opcion = request.getParameter("accion");
            PrintWriter salida = response.getWriter();
            if(opcion.equals("insertar")){
                if(request.getParameter("nombres").toString().length()>0 && request.getParameter("contacto").toString().length()>0  && request.getParameter("correo").toString().length()>0 && request.getParameter("password").toString().length()>0)
                {
                    String nom =request.getParameter("nombres");
                    String con = request.getParameter("contacto");
                    String cor = request.getParameter("correo");
                    String pas = request.getParameter("password");
                    
                    Beens.setNombres(nom);
                    Beens.setContacto(con);
                    Beens.setCorreo(cor);
                    Beens.setPass(pas);
                    
                    DAO.insertar(Beens);
                    
                    
                    //RequestDispatcher rd;
                    //rd = request.getRequestDispatcher("Exitoso.jsp");
                    //rd.forward(request, response);
                    //response.sendRedirect("/Exitoso.jsp");
                     response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect("Fallo.jsp");
                }
            
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
