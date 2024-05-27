import java.sql.ResultSet;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");

        MYSQLDatabase polySport = new MYSQLDatabase("localhost",3306,"poly_sports","Gael","Bob13792468");

       

        ResultSet results = polySport.createStatement().executeQuery(
            "SELECT name,required_participants FROM sport");

        while(results.next()){
            final String nom = results.getString("name");
            final String nbJoueur = results.getString("required_participants");
            final String toDsiplay = nom + " " + nbJoueur ;

            System.out.println(toDsiplay);
        }
    }

    // POLYSPORT DATABASE 
    // PolysportDatavase au lieu de "SportsDatabase"
}
