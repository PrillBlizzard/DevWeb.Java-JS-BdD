package database;

import java.sql.SQLException;

public class PolyBayDatabase extends MySQLDatabase {
 
    public PolyBayDatabase(String _host, int _port, String _databaseName, String _user, String _password) throws SQLException{
        super(_host,_port,_databaseName,_user,_password);
        
    }

}
