package sql2;

import getset2.varia;
import java.sql.Connection;
import javax.swing.JOptionPane;
import java.sql.ResultSet;

public class crudsql2 extends sqlcon2 {
    
    java.sql.Statement stat;
    ResultSet rs2;
    varia var2=new varia();

    public void insert2(String id_tienda, String descripcion_tienda, String ciudad_tienda) {
        try {
            Connection conexion = connect();
            stat = conexion.createStatement();
            String sql = "insert into tienda(id_tienda,descripcion_tienda,ciudad_tienda) values('" + id_tienda + "','" + descripcion_tienda + "','" + ciudad_tienda + "');";
            stat.execute(sql);
            stat.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro guardado con éxito. ", "Éxito", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Registro no se ha guardado. " + e, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void selectthe2(String id_tienda) {
        try {
            Connection conexion=connect();
            stat=conexion.createStatement();
            String sql="select * from tienda where id_tienda='"+id_tienda+"';";
            rs2=stat.executeQuery(sql);
            if(rs2.next()) {
                var2.setIdtienda(rs2.getString("id_tienda"));
                var2.setDescripciontienda(rs2.getString("descripcion_tienda"));
                var2.setCiudadtienda(rs2.getString("ciudad_tienda"));
            } else {
                var2.setIdtienda("");
                var2.setDescripciontienda("");
                var2.setCiudadtienda("");
                JOptionPane.showMessageDialog(null,"Registro no encontrado. ","No hay registro",JOptionPane.INFORMATION_MESSAGE);
            }
            stat.close();
            conexion.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error. "+e,"Error",JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void update2(String descripcion_tienda,String ciudad_tienda,String id_tienda) {
        try {
            Connection conexion=connect();
            stat=conexion.createStatement();
            String sql="update tienda set descripcion_tienda='"+descripcion_tienda+"',ciudad_tienda='"+ciudad_tienda+"' where id_tienda='"+id_tienda+"';";
            stat.executeUpdate(sql);
            stat.close();
            conexion.close();
            JOptionPane.showMessageDialog(null,"Registro actualizado con éxito. ","Actualización",JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error. "+e,"Error",JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void delete2(String id_tienda) {
        try {
            Connection conexion=connect();
            stat=conexion.createStatement();
            String sql="delete from tienda where id_tienda='"+id_tienda+"';";
            stat.executeUpdate(sql);
            stat.close();
            conexion.close();
            JOptionPane.showMessageDialog(null,"Registro eliminado con éxito. ","Eliminación",JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error. "+e,"Error",JOptionPane.ERROR_MESSAGE);
        }
    }
}
