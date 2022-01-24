package sql;

import getset.variables;
import java.sql.Connection;
import javax.swing.JOptionPane;
import java.sql.ResultSet;

public class crudsql extends sqlconnection {

    java.sql.Statement sta;
    ResultSet rs;
    variables var=new variables();
    
    public void insert(String id_cliente, String cedula_cliente, String nombre_cliente, String apell_cliente, String direccion_cliente, String tlf_cliente) {
        try {
            Connection conexion = connect();
            sta = conexion.createStatement();
            String sql = "insert into cliente(id_cliente,cedula_cliente,nombre_cliente,apell_cliente,direccion_cliente,tlf_cliente) values('" + id_cliente + "','" + cedula_cliente + "','" + nombre_cliente + "','" + apell_cliente + "','" + direccion_cliente + "','" + tlf_cliente + "');";
            sta.execute(sql);
            sta.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro guardado con éxito. ", "Inserción exitosa", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Registro no guardado. " + e, "Inserción fallida", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void select(String id_cliente) {
        try {
            Connection conexion=connect();
            sta=conexion.createStatement();
            String sql="select * from cliente where id_cliente='"+id_cliente+"';";
            rs=sta.executeQuery(sql);
            if(rs.next()) {
                var.setIdcliente(rs.getString("id_cliente"));
                var.setCedula(rs.getString("cedula_cliente"));
                var.setNombre(rs.getString("nombre_cliente"));
                var.setApellido(rs.getString("apell_cliente"));
                var.setDireccion(rs.getString("direccion_cliente"));
                var.setNumtlf(rs.getString("tlf_cliente"));
            } else {
                var.setIdcliente("");
                var.setCedula("");
                var.setNombre("");
                var.setApellido("");
                var.setDireccion("");
                var.setNumtlf("");
                JOptionPane.showMessageDialog(null, "Registro no encontrado. ","No hay registro",JOptionPane.INFORMATION_MESSAGE);
            }
            sta.close();
            conexion.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error. ","Error búsqueda",JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void update(String nombre_cliente,String apell_cliente, String direccion_cliente,String tlf_cliente,String id_cliente) {
        try {
            Connection conexion=connect();
            sta=conexion.createStatement();
            String sql="update cliente set nombre_cliente='"+nombre_cliente+"',apell_cliente='"+apell_cliente+"',direccion_cliente='"+direccion_cliente+"',tlf_cliente='"+tlf_cliente+"' where id_cliente='"+id_cliente+"';";
            sta.executeUpdate(sql);
            sta.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro actualizado. ","Éxito en el registro",JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al intentar actualizar. "+e,"Error",JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void delete(String id_cliente) {
        try {
            Connection conexion=connect();
            sta=conexion.createStatement();
            String sql="delete from cliente where id_cliente='"+id_cliente+"'; ";
            sta.executeUpdate(sql);
            sta.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro eliminado con éxito. ","Eliminación",JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al intentar eliminar. "+e,"Error",JOptionPane.ERROR_MESSAGE);
        }
    }
}
