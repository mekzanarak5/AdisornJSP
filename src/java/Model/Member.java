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

public class Member {

    private int memberno;
    private String username;
    private String password;
    private String fname;
    private String lname;
    private String gender;
    private String telno;

    public Member() {
    }

    public Member(int memberno, String username, String password, String fname, String lname, String gender, String telno) {
        this.memberno = memberno;
        this.username = username;
        this.password = password;
        this.fname = fname;
        this.lname = lname;
        this.gender = gender;
        this.telno = telno;
    }

    public int getMemberno() {
        return memberno;
    }

    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTelno() {
        return telno;
    }

    public void setTelno(String telno) {
        this.telno = telno;
    }

    
    @Override
    public String toString() {
        return "Member{" + "memberno=" + memberno + ", username=" + username + ", password=" + password + ", fname=" + fname + ", lname=" + lname + ", gender=" + gender + ", telno=" + telno + '}';
    }

    
    public static Member findByUsername(String username) {
        String sqlCmd = "SELECT * FROM member WHERE username = ?";
        Connection con = ConnectionAgent.getConnection();
        Member m = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                m = new Member();
                rToO(m, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

    
    public static int register(Member m) {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "INSERT INTO APP.MEMBER VALUES(?, ?, ?, ?, ?, ?, ?)";
        int value = 0;
        try {
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setInt(1, countMaxUserId());
            pstm.setString(2, m.getUsername());
            pstm.setString(3, m.getPassword());
            pstm.setString(4, m.getFname());
            pstm.setString(5, m.getLname());
            pstm.setString(6, m.getGender());
            pstm.setString(7, m.getTelno());
            value = pstm.executeUpdate();
            System.out.println("Add Complete!!!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return value;
    }

    
    public static int countMaxUserId() {
        Connection con = ConnectionAgent.getConnection();
        String sqlCmd = "select MAX(memberno) from APP.MEMBER";
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
    
    public static void updateMember(Member member) {
        String sql = "UPDATE APP.MEMBER SET USERNAME = ?, PASSWORD = ?, FNAME = ?, LNAME = ?, GENDER = ?,TELNO = ? WHERE MEMBERNO = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getUsername());
            ps.setString(2, member.getPassword());
            ps.setString(3, member.getFname());
            ps.setString(4, member.getLname());
            ps.setString(5, member.getGender());
            ps.setString(6, member.getTelno());

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Member> showMember() {
        String sql = "select * from member";
        Connection con = ConnectionAgent.getConnection();
        Member m = null;
        List<Member> member = new ArrayList<Member>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                m = new Member();
                rToO(m, rs);
                member.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return member;
    }
   
    public static List<Member> find(String str) {
        String sqlCmd = "SELECT * FROM member WHERE memberno like ? OR fname like ? OR lname like ? OR gender like ?";
        Connection con = ConnectionAgent.getConnection();
        Member m = null;
        List<Member> mb = new ArrayList<Member>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str + "%");
            ps.setString(2, str + "%");
            ps.setString(3, str + "%");
            ps.setString(4, str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                m = new Member();
                rToO(m, rs);
                mb.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mb;
    }
    
    public static void deleteMember(String username) {
        String sql = "DELETE FROM member WHERE USERNAME = ?";
        Connection con = ConnectionAgent.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
    
    private static void rToO(Member m, ResultSet rs) {
        try {
            m.setMemberno(rs.getInt("Memberno"));
            m.setUsername(rs.getString("Username"));
            m.setPassword(rs.getString("password"));
            m.setFname(rs.getString("fName"));
            m.setLname(rs.getString("lName"));
            m.setGender(rs.getString("gender"));
            m.setTelno(rs.getString("telNo"));
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
