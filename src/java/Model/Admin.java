/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adisorn
 */
public class Admin {
    private String name;
    private String pass;

    public Admin() {
    }

    public Admin(String name, String pass) {
        this.name = name;
        this.pass = pass;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public static Admin findAdmin(String username) {
        Admin a = null;
        String sqlCmd = "SELECT * FROM admin WHERE adminuser = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
                PreparedStatement ps = con.prepareStatement(sqlCmd);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    a = new Admin();
                    a.setName(rs.getString("adminuser"));
                    a.setPass(rs.getString("pass"));
                }
            
        } catch (SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
}
