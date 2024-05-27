
import java.sql.SQLException;

import controllers.ProductsController;
import webserver.WebServer;
import webserver.WebServerContext;

public class App {
    public static void main(String[] args) throws Exception {

  
        WebServer firstWebServer  =  new WebServer();
        firstWebServer.listen(8080);

        firstWebServer.getRouter().get("/products",
        ( WebServerContext context)->{ 
            try {
            ProductsController.findAll(context);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } } );
       


        System.out.println("Hello, World!");
    }
}
