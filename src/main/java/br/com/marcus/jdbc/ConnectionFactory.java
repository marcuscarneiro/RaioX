package br.com.marcus.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	public Connection getConnection(){
		System.out.println("conectando ao banco");
		try {
		
				Class.forName("org.postgresql.Driver");
			
			  
           // DriverManager.registerDriver(new com.mysql.jdbc.Driver()); //Essa linha foi a diferença 
			return DriverManager.getConnection("jdbc:postgresql://localhost:5432/raiox", "postgres", "123");
//			return DriverManager.getConnection("jdbc:postgresql://pgsql.andreregis.com.br:5432/andreregis1", "andreregis1", "g8t8c3n7");
		       
        } catch (SQLException e) {  
            e.printStackTrace();  
            throw new RuntimeException(e);  
              
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
            throw new RuntimeException(e);  
        }  
	}
		
}
