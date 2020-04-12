package jsp.jdbc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jsp.jdbc.bean.Employee;
public class EmployeeDao {

    public int registerEmployee(Employee employee) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO patient" +
            " (f_name, l_name,age,loc, uname, pass,email ,mob, regdate) VALUES " +
            " (?, ?, ?, ?, ?,?,?,?,CURDATE());";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoprj?useSSL=false", "root", "Rahul@123");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, employee.getFname());
            preparedStatement.setString(2, employee.getLname());
            preparedStatement.setInt(3, employee.getAge());
            preparedStatement.setString(4, employee.getLoc());
            preparedStatement.setString(5, employee.getUname());
            preparedStatement.setString(6, employee.getPass());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getMob());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    public Employee getPatient(String uname, String pass) {
		// TODO Auto-generated method stub
		Employee p=new Employee();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoprj?useSSL=false", "root", "Rahul@123");
			PreparedStatement ps;
			ps=con.prepareStatement("select * from patient where uname=? and pass=?");
			ps.setString(1,uname);
			ps.setString(2,pass);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				//f_name, l_name,age,loc, uname, pass,email ,mob, regdate
				p.setFname(rs.getString(2));
				p.setLname(rs.getString(3));
				p.setAge(Integer.parseInt(rs.getString(4)));
				p.setLoc(rs.getString(5));
				p.setUname(rs.getString(6));
				p.setPass(rs.getString(7));
				p.setEmail(rs.getString(8));
				p.setMob(rs.getString(9));
			}
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return p;
	}
    
    public ResultSet searchPatient(String loc, String spec) {
    	ResultSet rs=null;
    	try {
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoprj?useSSL=false", "root", "Rahul@123");
		PreparedStatement ps;
		ps=con.prepareStatement("select * from doctor where loc=? and spec=?");
		ps.setString(1,loc);
		ps.setString(2,spec);
		rs=ps.executeQuery();
    	}catch(Exception e)
		{
			System.out.println(e);
		}
    	return rs;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}