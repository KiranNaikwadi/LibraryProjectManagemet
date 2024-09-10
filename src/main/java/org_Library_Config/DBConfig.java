package org_Library_Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConfig {

 protected Connection conn;
 protected PreparedStatement stmt;
 protected ResultSet rs;
    
   public DBConfig() {
	   try {
		   //Class.forName("com.mysql.cj.jdbc.Driver");
		   Class.forName("com.mysql.cj.jdbc.Driver");
		   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms_servlet","root","manasi");
		   
		   //conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smprowor_lms_servlet","smprowor_manasi","(kTgL6hD,OVN");
		   
	   }
	   catch(Exception ex) {
		   System.out.println("Error is this error"+ex);
	   }
   }


}
