/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.ProductoDAO;
import beens.BeensProducto;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author varga
 */
@MultipartConfig
@WebServlet(name = "ControladorP", urlPatterns = {"/ControladorP"})
public class ControladorP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<BeensProducto> productos = new ArrayList<>();
    BeensProducto BeensP = new BeensProducto();
    ProductoDAO DAO_P = new ProductoDAO();
    int IdPro;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String men = request.getParameter("menu");
        String acc = request.getParameter("accion");

        if (acc.equals("prin")) {
            request.getRequestDispatcher("Productos.jsp").forward(request, response);
        }
        if (men.equals("Produ")) {
            switch (acc) {
                case "Mostrar":
                    request.setAttribute("BeensProducto", productos);
                    request.getRequestDispatcher("Productos.jsp").forward(request, response);
                case "Cargar":
                    IdPro = Integer.parseInt(request.getParameter("id"));
                    BeensProducto BeensC = DAO_P.cargar(IdPro);
                    request.setAttribute("Produ", BeensC);
                    request.getRequestDispatcher("Productos.jsp").forward(request, response);
                    break;
                case "Insertar":
                    String nomP = request.getParameter("nom");
                    Part imgP = request.getPart("img");
                    InputStream inputStream = imgP.getInputStream();
                    float cosP = Float.parseFloat(request.getParameter("cos"));
                    String desP = request.getParameter("des");
                    int canP = Integer.parseInt(request.getParameter("can"));
                    int catP = Integer.parseInt(request.getParameter("cat"));

                    BeensP.setNombres(nomP);
                    BeensP.setImg(inputStream);
                    BeensP.setCosto(cosP);
                    BeensP.setDescrip(desP);
                    BeensP.setCantidad(canP);
                    BeensP.setId_categoria(catP);

                    DAO_P.insertar(BeensP);
                    request.getRequestDispatcher("Productos.jsp").forward(request, response);
                    break;
                case "Borrar":
                    IdPro = Integer.parseInt(request.getParameter("id"));
                    DAO_P.eliminar(IdPro);
                    request.getRequestDispatcher("Productos.jsp").forward(request, response);
                    break;
                case "Modificar":
                    String nomPM = request.getParameter("nom");
                    Part imgPM = request.getPart("img");
                    InputStream iS = imgPM.getInputStream();
                    float cosPM = Float.parseFloat(request.getParameter("cos"));
                    String desPM = request.getParameter("des");
                    int canPM = Integer.parseInt(request.getParameter("can"));
                    int catPM = Integer.parseInt(request.getParameter("cat"));

                    BeensP.setNombres(nomPM);
                    BeensP.setImg(iS);
                    BeensP.setCosto(cosPM);
                    BeensP.setDescrip(desPM);
                    BeensP.setCantidad(canPM);
                    BeensP.setId_categoria(catPM);

                    BeensP.setId_prducto(IdPro);
                    DAO_P.modificar(BeensP);
                    request.getRequestDispatcher("Productos.jsp").forward(request, response);
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
