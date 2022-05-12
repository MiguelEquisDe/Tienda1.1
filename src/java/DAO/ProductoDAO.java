/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConexBD.conex;
import beens.BeensProducto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author varga
 */
public class ProductoDAO {

    conex con = new conex();
    Connection cnx;
    PreparedStatement ps;
    ResultSet rs;
    int resultado;

    public int insertar(BeensProducto Pr) {
        String SQL = "insert into productos(nombres,img,costo,descripcion,cantidad,id_categoria)" + "values(?,?,?,?,?,?)";

        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);

            ps.setString(1, Pr.getNombres());
            ps.setBlob(2, Pr.getImg());
            ps.setFloat(3, Pr.getCosto());
            ps.setString(4, Pr.getDescrip());
            ps.setInt(5, Pr.getCantidad());
            ps.setInt(6, Pr.getId_categoria());

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return resultado;
    }

    public BeensProducto listarId(int id_producto) {
        String SQL = "select * from productos where id_producto=" + id_producto;
        BeensProducto BP = new BeensProducto();
        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                BP.setId_prducto(rs.getInt("id_producto"));
                BP.setNombres(rs.getString("nombres"));
                BP.setImg(rs.getBinaryStream("img"));
                BP.setCosto(rs.getFloat("costo"));
                BP.setDescrip(rs.getString("descripcion"));
                BP.setCantidad(rs.getInt("cantidad"));
                BP.setEstado(rs.getInt("estado"));
                BP.setId_categoria(rs.getInt("id_categoria"));
            }
        } catch (Exception e) {
        }
        return BP;

    }

    public List getAll() {
        String SQL = " select * from productos";
        List<BeensProducto> lista = new ArrayList<>();
        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();

            while (rs.next()) {
                BeensProducto BP = new BeensProducto();
                BP.setId_prducto(rs.getInt("id_producto"));
                BP.setNombres(rs.getString("nombres"));
                BP.setImg(rs.getBinaryStream("img"));
                BP.setCosto(rs.getFloat("costo"));
                BP.setDescrip(rs.getString("descripcion"));
                BP.setCantidad(rs.getInt("cantidad"));
                BP.setEstado(rs.getInt("estado"));
                BP.setId_categoria(rs.getInt("id_categoria"));

                lista.add(BP);
            }

        } catch (Exception e) {
        }
        return lista;
    }

    public BeensProducto cargar(int id_producto) {

        BeensProducto BeP = new BeensProducto();
        String SQL = "select * from productos where id_producto=" + id_producto;
        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                BeP.setNombres(rs.getString(2));
                BeP.setImg(rs.getBinaryStream(3));
                BeP.setCosto(rs.getFloat(4));
                BeP.setDescrip(rs.getString(5));
                BeP.setCantidad(rs.getInt(6));
                BeP.setId_categoria(rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return BeP;
    }

    public boolean eliminar(int id_producto) {
        String SQL = "delete from productos where id_producto=" + id_producto;
        try {
            cnx = con.ConexBD();
            Statement st = cnx.createStatement();
            int estado = st.executeUpdate(SQL);
            if (estado > 0) {
                return true;
            }

        } catch (Exception ex) {
            System.err.println(ex);
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int modificar(BeensProducto Pr) {

        String SQL = "update productos set nombres=?, img=?, costo=?, descripcion=?, cantidad=?, id_categoria=?" + " where id_producto=?";
        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);

            ps.setString(1, Pr.getNombres());
            ps.setBinaryStream(2, Pr.getImg());
            ps.setFloat(3, Pr.getCosto());
            ps.setString(4, Pr.getDescrip());
            ps.setInt(5, Pr.getCantidad());
            ps.setInt(6, Pr.getId_categoria());

            ps.setInt(7, Pr.getId_producto());

            ps.executeUpdate();

        } catch (Exception e) {
        }
        return resultado;

    }

    public void listarImg(int id_producto, HttpServletResponse response) {
        String sql = "select * from productos where id_producto=" + id_producto;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getAsciiStream("img");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception ex) {

        }
    }

}
