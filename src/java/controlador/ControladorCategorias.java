/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.CategoriaDAO;
import beens.BeensCategorias;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 *
 * @author varga
 */
@WebServlet(name = "ControladorCategorias", urlPatterns = {"/ControladorCategorias"})
public class ControladorCategorias extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    BeensCategorias BeensCat = new BeensCategorias();
    CategoriaDAO DAOCat = new CategoriaDAO();
    int IdCat;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String men = request.getParameter("menu");
       String acc = request.getParameter("accion");
       
       if(acc.equals("prin")){
           request.getRequestDispatcher("Catego_productos.jsp").forward(request,response);
       }
       if(men.equals("Cat")){
           switch(acc){
               case "mostrar":
                   request.getRequestDispatcher("Catego_productos.jsp").forward(request,response);
                    break;                    
               case "Insertar":
                   String nom = request.getParameter("nomCat");                 
                   BeensCat.setNombre(nom);                 
                   DAOCat.insertar(BeensCat);
                   request.getRequestDispatcher("Catego_productos.jsp").forward(request,response);
                   break;
               case "Borrar":
                    IdCat = Integer.parseInt(request.getParameter("id_categoria"));
                    DAOCat.eliminar(IdCat);
                    request.getRequestDispatcher("Catego_productos.jsp").forward(request,response);
                    break;
               case "Cargar":
                    IdCat=Integer.parseInt(request.getParameter("id_categoria"));
                    BeensCategorias BeensCt = DAOCat.cargar(IdCat);
                    request.setAttribute("cat",BeensCt);
                    request.getRequestDispatcher("Catego_productos.jsp").forward(request, response);
                    break;
                case"Modificar":
                    String nomMo = request.getParameter("nomCat");
                    
                    BeensCat.setNombre(nomMo);
                    BeensCat.setId_categoria(IdCat);
                    
                    DAOCat.modificar(BeensCat);
                    request.getRequestDispatcher("Catego_productos.jsp").forward(request, response);
                    break;
                    
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
