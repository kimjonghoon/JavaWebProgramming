package net.java_school.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import net.java_school.exception.SignUpFailException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class UserDao {
    private Log log = LogFactory.getLog(UserDao.class);
    private static UserDao instance = new UserDao();
    private DataSource ds;
    public static String NEW_LINE = System.getProperty("line.separator");

    public static UserDao getInstance() {
        return instance;
    }
    
    private UserDao() {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/jsppjt");
        } catch (NamingException e) {
            if (log.isDebugEnabled()) {
                log.debug(e.getMessage());
            }
        }
    }
    
    private Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    
    private void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    //회원가입
    public void insert(User user) {
        Connection con = null;
        PreparedStatement pstmt = null;
        
        //email,passwd,name,mobile
        String sql = "insert into member values (?, ?, ?, ?)";
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPasswd());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getMobile());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
            throw new SignUpFailException("회원가입 실패");
        } finally {
            close(null, pstmt, con);
        }
    }
    
    //로그인
    public User login(String email, String passwd) {
        User user = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT email, passwd, name, mobile FROM member "
            + "WHERE email = ? AND passwd = ?";
         
         
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
             
            if (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setPasswd(rs.getString("passwd"));
                user.setName(rs.getString("name"));
                user.setMobile(rs.getString("mobile"));
            }
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
        } finally {
            close(rs, pstmt, con);
        }
         
        return user;
    }
    
    //회원정보 수정
    public int update(User user) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE member SET name = ?, mobile = ? WHERE email = ? AND passwd = ?";
        int ret = 0;
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getMobile());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPasswd());
            ret = pstmt.executeUpdate();
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
            throw new RuntimeException(e);
        } finally {
            close(null, pstmt, con);
        }
        
        return ret;
    }
    
    //비밀번호 변경
    public int update(String currentPasswd, String newPasswd, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE member SET passwd = ? WHERE passwd = ? AND email = ?";
        int ret = 0;
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, newPasswd);
            pstmt.setString(2, currentPasswd);
            pstmt.setString(3, email);
            ret = pstmt.executeUpdate();
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
        } finally {
            close(null, pstmt, con);
        }
        
        return ret;
    }
    
    //탈퇴
    public int delete(String email, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE member WHERE email = ? AND passwd = ?";
        int ret = 0;
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);
            ret = pstmt.executeUpdate();
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
        } finally {
            close(null, pstmt, con);
        }
        
        return ret;
    }
    
    //P.K 로 회원찾기
    public User selectOne(String email) {
        User user = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT email, passwd, name, mobile "
                + "FROM member WHERE email = ?";
        
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setPasswd(rs.getString("passwd"));
                user.setName(rs.getString("name"));
                user.setMobile(rs.getString("mobile"));
            }
        } catch (SQLException e) {
            if (log.isDebugEnabled()) {
                StringBuilder msg = new StringBuilder();
                msg.append("SQLState : " + e.getSQLState() + NEW_LINE);
                msg.append("Message : " + e.getMessage() + NEW_LINE);
                msg.append("Oracle Error Code : " + e.getErrorCode() + NEW_LINE);
                msg.append("sql : " + sql + NEW_LINE);
                log.debug(msg);
            }
        } finally {
            close(rs, pstmt, con);
        }
         
        return user;

    }
        
}