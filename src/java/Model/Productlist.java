/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import static Model.Orderlist.countMaxOrderNo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adisorn
 */
public class Productlist {

    private int orderno;
    private String productname;
    private int quantity;

    public Productlist() {
    }

    public Productlist(int orderno, String productname, int quantity) {
        this.orderno = orderno;
        this.productname = productname;
        this.quantity = quantity;
    }

    public int getOrderno() {
        return orderno;
    }

    public void setOrderno(int orderno) {
        this.orderno = orderno;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Productlist{" + "orderno=" + orderno + ", productname=" + productname + ", quantity=" + quantity + '}';
    }


    public static int addProductList(Productlist p) {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "INSERT INTO ProductList VALUES(?, ?, ?)";
        int value = 0;
        try {
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setInt(1, p.getOrderno());
            pstm.setString(2, p.getProductname());
            pstm.setInt(3, p.getQuantity());
            value = pstm.executeUpdate();
            System.out.println("Add Complete!!!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return value;
    }
}
