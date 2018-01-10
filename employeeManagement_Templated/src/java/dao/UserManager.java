package dao;

import com.mail.GMailSender;
import dto.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class UserManager {
    public int addUser(User u)
    {
        int result=0;
       
        try{
            String otp="";
            Random rnd=new Random();
            for (int i = 0; i < 5; i++) {
                otp+=rnd.nextInt(9);                
            }
            
            PreparedStatement ps = ConnectionManager.con.prepareStatement("insert into user values(?,?,?,?,'deny',?)");
            ps.setString(4, u.getName());
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getRole());
            ps.setString(5, otp);
            
            result = ps.executeUpdate();
            
            //send email to user
            String subject="OTP verification";
            String body="Dear "+u.getName()+"! Generated OTP is : "+otp+"  you can verify by following thi url: http://localhost:8084/EmployeeManagement_JSP7/verify.jsp?email="+u.getEmail();
            String from ="test.meeteish2@gmail.com";
            String to = u.getEmail();
            
            GMailSender gmail=new GMailSender("test.meeteish2@gmail.com", "meeteish@123");
            gmail.sendMail(subject, body, from, to);
        }
        catch(Exception e)
        {
            System.out.println("Error@AddUser : "+e.toString());
        }
        return result;
    }
    
    public String isAuthenticate(User u)
    {
        String role="";
        
        try{
            PreparedStatement ps = ConnectionManager.con.prepareStatement("select role from user where emailid=? and password=? and status='allow'");
            System.out.println("select role from user where emailid="+u.getEmail()+" and password="+u.getPassword()+" and status='allow'");
            
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getPassword());

            ResultSet rs =ps.executeQuery();
            if(rs.next())
            {
                role = rs.getString("role");
            }
        }
        catch(Exception e)
        {
            System.out.println("Error@isAuthenticate : "+e.toString());
        }
        
        return role;
    }
    
    public boolean verify(String otp,String email)
    {
        boolean result=false;
        try
        {
            PreparedStatement ps = ConnectionManager.con.prepareStatement("select otp from user where emailid=?");
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equals(otp))
                {
                    //code to allow user
                    PreparedStatement ps2 = ConnectionManager.con.prepareStatement("update user set status='allow' where emailid=?");
                    ps2.setString(1, email);
                    if(ps2.executeUpdate()>0)
                    {
                        return true;
                    }
                }   
                else
                {
                   return false;
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Error@Verification : "+e.toString());
        }
        return result;
    }
}
