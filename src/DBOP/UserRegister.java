package DBOP;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class UserRegister{
    private UserInfo userinfo;
    private DBBean db;
    private Connection con;

    //获取数据库连接
    public UserRegister(){
        try {
            Class.forName(db.getDriverName());
            con = (Connection)DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    //设置待注册的用户信息
    public void setUserinfo(UserInfo userinfo){
        this.userinfo = userinfo;
    }

    //注册
    public void register() throws Exception{
        String userName = userinfo.getUserName();
        String Password = userinfo.getPassword();
        String Email = userinfo.getEmail();
        String Telephone = userinfo.getTelephone();
        String  Age = userinfo.getAge();
        String regsql = "insert into userinfo values('"+userName+"','"+Password+"','"+Email+"','"+Telephone+"','"+Age+"')";
        try {
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement(regsql);
        }catch (Exception e){
            e.printStackTrace();
            throw e;
        }
    }

    public String  transFormat(String s) {
        try {
            byte[] b = s.getBytes("iso-8859-1");
            s = new String(b);
        } catch (UnsupportedEncodingException e) {
            System.out.println(e.toString());
        }
        return s;
    }
}