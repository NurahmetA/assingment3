package Dao;

import Classes.User;

import java.sql.*;

public class UserDao extends DaoClass {

    public void add(User user) throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpass);

        try {
            PreparedStatement stmt = con.prepareStatement("insert into users values(null,?,?,?);");
            stmt.setString(1, user.getLogin());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            int stmtExecuted = stmt.executeUpdate();
            System.out.println(stmtExecuted + " records were inserted");
            stmt.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            con.close();
        }

    }


    public User getById(String login) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpass);

        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * from users where login = ? ");
            stmt.setString(1, login);
            ResultSet rs = stmt.executeQuery();
            User user = new User();
            while(rs.next()) {
                user = new User(rs.getString(2), rs.getString(3), rs.getString(4));
            }
            System.out.println(user.getLogin() + " " + user.getPassword());
            stmt.close();
            return user;

        }
        catch(SQLException e){
            e.printStackTrace();
            return null;
        }
        finally{
            con.close();
        }
    }
}
