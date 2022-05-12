/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConexBD.conex;
import beens.BeensCategorias;
import beens.BeensProducto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author varga
 */
public class CarritoDAO {

    conex con = new conex();
    Connection cnx;
    PreparedStatement ps;
    ResultSet rs;
    int resultado;

    public int agregar(BeensProducto Pr, BeensCategorias Cr) {

        String SQL = "insert into carrito(id_categoria,id_producto)";

        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);

            ps.setString(1, SQL);
        } catch (Exception e) {
        }
        return resultado;
    }

    public List getAll(int IdU) {
        return null;

    }
}
