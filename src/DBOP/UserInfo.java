package DBOP;
public class UserInfo {
    //属性名称与表单元素相同时，可实现 自省

    String userName = null;
    String Password = null;
    String Email = null;
    String Telephone = null;
    String  Age = null;
    boolean logined = false;
    //无参数的构造方法
    public UserInfo(){
        //读取userNmae属性
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return Password;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail()
    {
        return Email;
    }
    public void setEmail(String Email){
        this.Email = Email;
    }

    public String getAge(){
        return Age;
    }
    public void  setAge(String age){
        this.Age = age;
    }

    public String getTelephone(){
        return Telephone;
    }
    public void setTelephone(String telephone){
        this.Telephone = telephone;
    }

    public boolean isLogined() {
        return logined;
    }
    public void setLogined(boolean logined) {
        this.logined = logined;
    }


}
