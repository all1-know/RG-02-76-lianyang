package DBOP;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBOperator{
public Connection getConnection() throws SQLException,
        InstantiationException, IllegalAccessException,
        ClassNotFoundException {
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/robot?useUnicode=true&characterEncoding=gbk";
            String user = "root";
            String password = "123456";
            conn = DriverManager.getConnection(url, user, password);
            return conn;
}
    public ResultSet select(String sql) throws Exception {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            return rs;
        } catch (SQLException sqle) {
            throw new SQLException("select data exception: "
                    + sqle.getMessage());
        } catch (Exception e) {
            throw new Exception("System e exception: " + e.getMessage());
        }
    }

    public ResultSet select2(String Excel, String key1, String key2, String str1,String str2){
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try{
            conn = getConnection();
            pre = conn.prepareStatement("select * from Excel where str1=? and str2=?");
            pre.setString(1,"key1");
            pre.setString(2,"key2");
            rs = pre.executeQuery();
            rs.close();
            pre.close();
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }

//     * 根据传入的SQL语句向数据库增加一条记录
    public void insert(String sql) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            throw new Exception("insert data exception: " + sqle.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                throw new Exception("ps close exception: " + e.getMessage());
            }
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            throw new Exception("connection close exception: " + e.getMessage());
        }
    }

//     * 根据传入的SQL语句更新数据库记录
    public void update(String sql) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            throw new Exception("update exception: " + sqle.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                throw new Exception("ps close exception: " + e.getMessage());
            }
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            throw new Exception("connection close exception: " + e.getMessage());
        }
    }

//     * 根据传入的SQL语句删除一条数据库记录
    public void delete(String sql) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            throw new Exception("delete data exception: " + sqle.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                throw new Exception("ps close exception: " + e.getMessage());
            }
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            throw new Exception("connection close exception: " + e.getMessage());
        }
    }
}