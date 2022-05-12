
package ConexBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vargas
 */
public class conex {
     Connection cnx;
    String url = "jdbc:mysql://localhost/inventario";
    String usr = "root";
    String pass = "";

    public Connection ConexBD() {

        try {
            //se carga el driver mysql
            Class.forName("com.mysql.jdbc.Driver");
            //se hace la autentificacion de la bd
            cnx = (Connection) DriverManager.getConnection(url, usr, pass);
            if (cnx != null) {
                System.out.println("Conexión establecida");
                return cnx;
            }
        } catch (ClassNotFoundException ex) {
           Logger.getLogger(conex.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error" + ex);
        } catch (SQLException ex) {
           Logger.getLogger(conex.class.getName()).log(Level.SEVERE, null, ex);
             System.out.println("el error" + ex);
        }
        return null;

    }

    public static void main(String[] args) {
        conex miCone = new conex();
        miCone.ConexBD();
    }

}