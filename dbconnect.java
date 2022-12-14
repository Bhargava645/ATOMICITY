package database.conn;

import java.io.IOException;
import java.sql.*;

public class dbconnect {

	public static void main(String args[]) throws SQLException, IOException, ClassNotFoundException {

		Connection conn;
		Statement stmt1 = null;
		

		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cs623project", "postgres", "Dheeraj@123");

		conn.setAutoCommit(false); // as we are updating to table, we are setting the property of atomicity

		try {

			if (conn != null) { // the condition is put up to just check the connection
				System.out.println("ok");
			} else {
				System.out.println("nok");
			}

			stmt1 = conn.createStatement();
			
			
			String sql1 = "INSERT INTO depot(depid,addr,volume) VALUES('d98','Chicago',100)";
			String sql2 = "INSERT INTO stock(prodid,depid,quantity) VALUES('p4','d98',100)";
			stmt1.executeUpdate(sql1);
			stmt1.executeUpdate(sql2);
			

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(
					"please check code and make sure that depid is same in depot and stock"
					+ " while entering or else prodid is not present in product table");
			
			conn.rollback();
			stmt1.close();
			conn.close();
			return;
		}

		conn.commit();
		stmt1.close();
		conn.close();
	}

}
