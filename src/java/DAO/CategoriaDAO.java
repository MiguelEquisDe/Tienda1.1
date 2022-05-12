/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConexBD.conex;
import beens.BeensCategorias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author varga
 */
public class CategoriaDAO {
    
    conex con = new conex();
    Connection cnx;
    PreparedStatement ps;
    ResultSet rs;
    int resultado;
    
    public int insertar(BeensCategorias Cr){
    
        String SQL = "insert into pro_categoria(nombre) values (?)";
        
        try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            
            ps.setString(1, Cr.getNombre());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
        return resultado;
    }
    public List getAll(){
        String SQL = " select * from pro_categoria";
          List<BeensCategorias> lista = new ArrayList<>();
          try {
            cnx = con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            rs= ps.executeQuery();
            while(rs.next()){
                BeensCategorias BeensD = new BeensCategorias();
                BeensD.setId_categoria(rs.getInt("id_categoria"));
                BeensD.setNombre(rs.getString("nombre"));
                BeensD.setEstado(rs.getInt("estado"));
                lista.add(BeensD);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    public boolean eliminar(int id){
        String SQL = "delete from pro_categoria where id_categoria=" + id;
         try {
            cnx = con.ConexBD();
            Statement st = cnx.createStatement();
            int estado = st.executeUpdate(SQL);
            if (estado > 0) {
                return true;
            }

        } catch (Exception ex) {
            System.err.println(ex);
            Logger.getLogger(BeensCategorias.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public BeensCategorias cargar(int id_categoria){
        BeensCategorias BeensC = new BeensCategorias();
        String SQL = "select * from pro_categoria where id_categoria=" + id_categoria;
        try {
            cnx=con.ConexBD();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while(rs.next()){
                BeensC.setNombre(rs.getString(2));
            }
        } catch (Exception e) {
        }
        return BeensC;
    }
    public int modificar(BeensCategorias Br){
        String SQL = "update pro_categoria set nombre=? where id_categoria=?";
    
        try {
        cnx = con.ConexBD();
        ps = cnx.prepareStatement(SQL);
                
        ps.setString(1,Br.getNombre());
        ps.setInt(2, Br.getId_categoria());
        
        ps.executeUpdate();
        } catch (Exception e) {
        }
        return resultado;
    }
    
}
