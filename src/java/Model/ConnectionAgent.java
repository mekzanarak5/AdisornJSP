/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adisorn
 */
public class ConnectionAgent {
    private static final String DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private static final String URL="jdbc:derby://localhost:1527/AdisornJSP";
    private static final String USER = "app";
    private static final String PASSWORD = "app";
    public static Connection getConnection() {
        Connection con = null ;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionAgent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionAgent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
