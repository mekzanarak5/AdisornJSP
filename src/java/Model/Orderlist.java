/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Adisorn
 */
public class Orderlist {

    private int orderno;
    private int memberno;
    private double totalprice;
    private String address;
    private String date;

    public Orderlist() {
    }

    public Orderlist(int orderno, int memberno, double totalprice, String address, String date) {
        this.orderno = orderno;
        this.memberno = memberno;
        this.totalprice = totalprice;
        this.address = address;
        this.date = date;
    }

    public int getOrderno() {
        return orderno;
    }

    public void setOrderno(int orderno) {
        this.orderno = orderno;
    }

    public int getMemberno() {
        return memberno;
    }

    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Orderlist{" + "orderno=" + orderno + ", memberno=" + memberno + ", totalprice=" + totalprice + ", address=" + address + ", date=" + date + '}';
    }

    public static int countMaxOrderNo() {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "select MAX(orderno) from orderlist";
        int result = 0;
        try {
            Statement st = con.createStatement();
            ResultSet rst = st.executeQuery(sqlCmd);
            rst.next();
            result = rst.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Orderlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        result += 1;
        return result;
    }

    public static int addOrderList(Orderlist o) {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "INSERT INTO orderlist VALUES(?, ?, ?, ?, CURRENT_DATE )";
        int value = 0;
        try {
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setInt(1, countMaxOrderNo());
            pstm.setInt(2, o.getMemberno());
            pstm.setDouble(3, o.getTotalprice());
            pstm.setString(4, o.getAddress());
            value = pstm.executeUpdate();
            System.out.println("Add Complete!!!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return value;
    }

    public static List<Orderlist> ShowOrderlistbyMemberno(int id) {
        String sql = "SELECT * FROM orderlist WHERE MEMBERNO = ?";
        Connection con = ConnectionAgent.getConnection();
        Orderlist o = null;
        List<Orderlist> orderlist = new ArrayList<Orderlist>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Orderlist();
                rToO(o, rs);
                orderlist.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Orderlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderlist;
    }
    
    public static List<Orderlist> showOrderlist() {
        String sql = "select * from orderlist";
        Connection con = ConnectionAgent.getConnection();
        Orderlist o = null;
        List<Orderlist> orderlist = new ArrayList<Orderlist>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Orderlist();
                rToO(o, rs);
                orderlist.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Orderlist.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderlist;
    }

    private static void rToO(Orderlist orderlist, ResultSet rs) {
        try {
            orderlist.setOrderno(rs.getInt("orderno"));
            orderlist.setMemberno(rs.getInt("memberno"));
            orderlist.setTotalprice(rs.getDouble("totalprice"));
            orderlist.setAddress(rs.getString("address"));
            orderlist.setDate(rs.getString("date"));

        } catch (SQLException ex) {
            Logger.getLogger(Orderlist.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
