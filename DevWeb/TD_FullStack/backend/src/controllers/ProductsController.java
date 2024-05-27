package controllers;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ProductsDAO;
import models.Product;
import webserver.WebServerContext;

public class ProductsController {

    public static ArrayList<Product> findAll(WebServerContext context) throws SQLException{
     
            ProductsDAO prodDAO = new ProductsDAO();
            ArrayList<Product> bob = prodDAO.findAll(context);

            context.getResponse().ok("Tous les produits");
        return bob;
    }
}
