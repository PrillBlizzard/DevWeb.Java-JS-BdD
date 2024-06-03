
import database.MySQLDatabase;
import java.sql.SQLException;

public class PolyNamesDatabase extends MySQLDatabase {

        public PolyNamesDatabase(String _host, int _port, String _databaseName, String _user, String _password) throws SQLException{
            super(_host,_port,_databaseName,_user,_password);
    }
}
