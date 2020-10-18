package Dao;

import Classes.Product;

import java.sql.*;
import java.util.ArrayList;

public class ProductDao extends DaoClass {
    public ProductDao() {

    }
    public void add(Product product) throws SQLException, ClassNotFoundException {

    }
    public Product getById(Integer id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpass);

        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * from products where product_id = ? ");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Product product = new Product();
            while(rs.next()) {
                product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
            }
            System.out.println(product.getProductId() + " " + product.getProductName());
            stmt.close();
            return product;

        }
        catch(SQLException e){
            e.printStackTrace();
            return null;
        }
        finally{
            con.close();
        }
    }
    public ArrayList<Product> getAllByCategory(String category) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpass);

        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * from products where category = ?");
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            ArrayList<Product> products = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
                products.add(product);
            }
            stmt.close();
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            con.close();
        }
        return null;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ProductDao productDao = new ProductDao();
        System.out.println(productDao.getAllByCategory("clothes"));
    }
}
