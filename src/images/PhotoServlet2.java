package images;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.util.List;
import java.util.Map;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
/*import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
*/

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet( name = "PhotoServlet2",urlPatterns = "/PhotoServlet2")
public class PhotoServlet2 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //头像的存储地址
    String Imagepath = null;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";

    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    //数据库连接参数
    static  final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static  final String url = "jdbc:mysql://localhost:3306/robot?useUnicode=true&characterEncoding=gbk";

    //数据库用户名密码
    static final String USER = "root";
    static final String PASS = "123456";


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Judge multipart or not
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        //检测是否是多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        upload.setHeaderEncoding("UTF-8");

        // 构造临时路径来存储上传的文件，这个路径相对当前应用的目录
        String uploadPath = "C:\\Users\\dell\\Desktop\\廉扬  韩炜\\JspForROS\\web\\images\\" + UPLOAD_DIRECTORY;
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String Image=null;
        String Name = null;
        String year=null;
        String Description=null;
        Date date=new Date();
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            // Process the uploaded items
            Iterator<FileItem> iter = formItems.iterator();
            //parameters map
            Map<String,String> params = new HashMap<String,String>();
            while (iter.hasNext())
            {
                FileItem item = iter.next();
                // Form Field
                if (item.isFormField())
                {
                    // Field name
                    String names = item.getFieldName();

                    // Set charset = UTF-8 Default = ISO-8859-1
                    // Get field value
                    String value = item.getString("utf-8");

                    // Put into map
                    params.put(names, value.trim());
                }
            }
            Image = (String)params.get("Image");
            Name = (String)params.get("Name");
            year = (String)params.get("year");
            Description = (String)params.get("Description");
            for (String key : params.keySet()) {
                System.out.println("Key = " + key);
            }
            //遍历map中的值
            for (String value : params.values()) {
                System.out.println("Value = " + value);
            }
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        Imagepath = "images/upload/" + fileName;
                        System.out.print(filePath);
                        //    Image = "/"+UPLOAD_DIRECTORY+"/"+fileName;
                        File storeFile = new File(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message","文件上传成功!");

                        HttpSession session=request.getSession();
                        DateFormat df5 = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
                        String uploadtime = (df5.format(date)).toString();

                        System.out.println("1");
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println(uploadtime);
                        String url="jdbc:mysql://localhost:3306/robot?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSSL=false";
                        Connection con=DriverManager.getConnection(url,"root","123456");
                        Statement st=con.createStatement();
                        String sql = "insert into movieinfo(Image,Name,year,Description)values('"+Imagepath+"','"+Name+"','"+year+"','"+Description+"')";
                        st.executeUpdate(sql);
                        st.close();
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message","错误信息: " + ex.getMessage());
        }
        response.sendRedirect("../ManagerOperator/SearchMoviesinfo.jsp");
    }
}