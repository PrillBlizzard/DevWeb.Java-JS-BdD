package dao;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.PolyBayDatabase;
import models.Product;
import webserver.WebServerContext;
import webserver.WebServerResponse;

public class ProductsDAO {

    PolyBayDatabase poly_bay_dataB;

    public ProductsDAO() throws SQLException{
        poly_bay_dataB = new PolyBayDatabase("localhost", 3306,"poly_bay","gc","poly_bay");
    }

   
    public ArrayList<Product> findAll(WebServerContext contxt) throws SQLException{
        ArrayList<Product> results = new ArrayList<Product>();
        PreparedStatement statement = poly_bay_dataB.prepareStatement("SELECT * FROM product");
        ResultSet res = statement.executeQuery();
        while(res.next()){
            Product prod = getProductFromResultSet(res);
            results.add(prod);
        }        
        contxt.getResponse().json(results);
        return results;
    }



    public Product getProductFromResultSet(ResultSet _input) throws SQLException{
        int id = _input.getInt("id");
        String name = _input.getString("name");
        String owner = _input.getString("owner");
        Float bid = _input.getFloat("bid");
        
        Product output = new Product(id,name,owner,bid);
        return output;
    }

}
