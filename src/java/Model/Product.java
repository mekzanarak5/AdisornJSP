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
public class Product {

    private int productno;
    private String productname;
    private String detail;
    private double price;
    private String color;
    private String img;

    public Product() {
    }

    public Product(int productno, String productname, String detail, double price, String color, String img) {
        this.productno = productno;
        this.productname = productname;
        this.detail = detail;
        this.price = price;
        this.color = color;
        this.img = img;
    }

    public int getProductno() {
        return productno;
    }

    public void setProductno(int productno) {
        this.productno = productno;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Product{" + "productno=" + productno + ", productname=" + productname + ", detail=" + detail + ", price=" + price + ", color=" + color + ", img=" + img + '}';
    }

    public static List<Product> showFlower() {
        String sql = "select * from product";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> product = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    
    public static List<Product> showFlowerHomePage() {
        String sql = "select * from product OFFSET 15 ROWS FETCH NEXT 9 ROWS ONLY";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> product = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public static List<Product> findByProduct(String str) {
        String sqlCmd = "SELECT * FROM product WHERE productname like ? or color like ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> fp = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1,"%" + str + "%");
            ps.setString(2,"%" + str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                fp.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fp;
    }
    
    
    public static List<Product> findByProductPrice(double price) {
        String sqlCmd = "SELECT * FROM product WHERE price <= ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> fp = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setDouble(1,price);          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                fp.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fp;
    }
    

    public static Product findByProductNo(int id) {
        String sqlCmd = "SELECT * FROM product WHERE PRODUCTNO = ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                rToO(p, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
//    public static Product findByProductName(String name) {
//        String sqlCmd = "SELECT * FROM product WHERE PRODUCTNAME = ?";
//        Connection con = ConnectionAgent.getConnection();
//        Product p = null;
//        try {
//            PreparedStatement ps = con.prepareStatement(sqlCmd);
//            ps.setString(1, name);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new Product();
//                rToO(p, rs);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }
//    
//    public static Product findByPrice(Double price) {
//        String sqlCmd = "SELECT * FROM product WHERE PRICE = ?";
//        Connection con = ConnectionAgent.getConnection();
//        Product p = null;
//        try {
//            PreparedStatement ps = con.prepareStatement(sqlCmd);
//            ps.setDouble(1, price);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new Product();
//                rToO(p, rs);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }
//    
//    public static Product findByColor(String color) {
//        String sqlCmd = "SELECT * FROM product WHERE PRODUCTNAME = ?";
//        Connection con = ConnectionAgent.getConnection();
//        Product p = null;
//        try {
//            PreparedStatement ps = con.prepareStatement(sqlCmd);
//            ps.setString(1, color);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new Product();
//                rToO(p, rs);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }

    public static int countMaxProductNo() {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "select MAX(productno) from product";
        int result = 0;
        try {
            Statement st = con.createStatement();
            ResultSet rst = st.executeQuery(sqlCmd);
            rst.next();
            result = rst.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        result += 1;
        return result;
    }

    public static int addProduct(Product p) {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "INSERT INTO product VALUES(?, ?, ?, ?, ?, ?)";
        int value = 0;
        try {
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setInt(1, countMaxProductNo());
            pstm.setString(2, p.getProductname());
            pstm.setString(3, p.getDetail());
            pstm.setDouble(4, p.getPrice());
            pstm.setString(5, p.getColor());
            pstm.setString(6, "images/"+p.getImg());
            value = pstm.executeUpdate();
            System.out.println("Add Complete!!!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return value;
    }

    public static void updateProduct(Product p) {
        String sql = "UPDATE APP.PRODUCT SET PRODUCTNAME = ?, DETAIL = ?, PRICE = ?, COLOR = ?, IMG = ? WHERE PRODUCTNO = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getProductname());
            ps.setString(2, p.getDetail());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getColor());
            ps.setString(5, p.getImg());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE productno = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void rToO(Product product, ResultSet rs) {
        try {
            product.setProductno(rs.getInt("productno"));
            product.setProductname(rs.getString("productname"));
            product.setDetail(rs.getString("detail"));
            product.setPrice(rs.getDouble("price"));
            product.setImg(rs.getString("img"));
            product.setColor(rs.getString("color"));


        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + this.productno;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (this.productno != other.productno) {
            return false;
        }
        return true;
    }
}
