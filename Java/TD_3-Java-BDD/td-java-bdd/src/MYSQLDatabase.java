import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

public class MYSQLDatabase {
    private String host;
    private int port;
    private String databaseName;
    private String user;
    private String password;
    private Connection connection;
    static private boolean driverLoaded;
    
    public MYSQLDatabase(String _host, int _port, String _databaseName, String _user, String _password){
        host = _host;
        port = _port;
        databaseName = _databaseName;
        user = _user;
        password = _password;
        connection = null;
        driverLoaded = false;

        loadDriver();
        connect();
    }

    public void connect(){
        try {
            Connection mysqlConnection = DriverManager.getConnection(
                "jdbc:mysql://" + host + ":" + port + "/" + databaseName,
                user,
                password);
            connection = mysqlConnection;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
    public Statement createStatement() throws SQLException{
        Statement newStatement;
        newStatement = connection.createStatement();
        return newStatement;
    }

    private static void loadDriver(){
        if(driverLoaded == false){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                driverLoaded = true;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }


}
