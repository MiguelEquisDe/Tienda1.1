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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author varga
 */
@WebServlet(name = "ControladorU", urlPatterns = {"/ControladorU"})
public class ControladorU extends HttpServlet {

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
    RegistroDAO DAO = new RegistroDAO();
    int IdUsu;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("menu");
        String opc = request.getParameter("accion");
        if(opc.equals("Ppal")){
            request.getRequestDispatcher("IndexU.jsp").forward(request, response);
        }
        if(op.equals("Datos")){
            switch(opc){
                
                case"mostrar":
                    request.getRequestDispatcher("IndexU.jsp").forward(request, response);
                    break;
                case"Cargar":
                    IdUsu = Integer.parseInt(request.getParameter("id"));
                    RegistroBeens BeensC = DAO.cargar(IdUsu);
                    request.setAttribute("Usuario", BeensC);
                    request.getRequestDispatcher("Datos_Usu.jsp").forward(request, response);
                    break;
                case"Borrar":
                    IdUsu = Integer.parseInt(request.getParameter("id"));
                    DAO.eliminar(IdUsu);
                    request.getRequestDispatcher("Datos_Usu.jsp").forward(request,response);
                    break;
                case "Modificar":
                    String nom = request.getParameter("nombres");
                    String con = request.getParameter("contacto");
                    String cor = request.getParameter("correo");
                    String pas = request.getParameter("password");
                    
                    Beens.setNombres(nom);
                    Beens.setContacto(con);
                    Beens.setCorreo(cor);
                    Beens.setPass(pas);
                    Beens.setId_registro(IdUsu);
                    
                    DAO.modificar(Beens);
                    DAO.validar(nom, pas);
                    request.setAttribute("Usu", Beens);
                    request.getRequestDispatcher("Datos_Usu.jsp").forward(request,response);
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
