package sql2;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class sqlcon2 {
    Connection conne=null;
    String url="jdbc:postgresql://127.0.0.1/BD_MUDANZAS";
    String user="postgres";
    String password="openpgpwd";
    
    public Connection connect() {
    try {
        Class.forName("org.postgresql.Driver");
        conne=DriverManager.getConnection(url, user, password);
        
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null,"Error al intentar la conexión. "+e,"Error",JOptionPane.ERROR_MESSAGE);
    }
    return conne;
}
    
}
