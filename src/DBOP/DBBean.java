package DBOP;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBBean{
    private String driverName = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/robot?useUnicode=true&characterEncoding=gbk";
    private String user = "root";
    private String password = "123456";
    public void setDriverName(String newDriverName){
        driverName = newDriverName;
    }
    public String getDriverName(){
        return driverName;
    }

    public void setUrl(String newUrl){
        url = newUrl;
    }

    public String getUrl(){
        return url;
    }

    public void setUser(String newUser){
        user = newUser;
    }

    public String getUser() {
        return user;
    }

    public void setPassword(String newPassword){
        password = newPassword;
    }

    public String getPassword() {
        return password;
    }

    public Connection getConnection(){
        try {
            Class.forName(driverName);
            return DriverManager.getConnection(url,user,password);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}