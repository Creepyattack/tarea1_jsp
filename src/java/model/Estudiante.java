/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author ppbet
 */
public class Estudiante extends Persona{
    private String carnet;
    private int id_sangre;
    private Conexion cn;
    public Estudiante(){
        
    }
    public Estudiante(String carnet, int id_sangre, int id, String nombres, String apellidos, String direccion, String telefono, String correo, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, correo, fecha_nacimiento);
        this.carnet = carnet;
        this.id_sangre = id_sangre;
    }
    
    
    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }
    
     public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT e.id_estudiante as id,e.Carnet,e.Nombres,e.Apellidos,e.Direccion,e.Telefono,e.Correo_electronico,s.id_sangre,s.Sangre,e.Fecha_nacimiento FROM estudiantes as e inner join tipos_sangre as s on e.id_sangre = s.id_sangre;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","carnet","nombres","apellidos","direccion","telefono","correo","Sangre","id_sangre","nacimiento"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[10];
            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("Carnet");
                datos[2] = consulta.getString("Nombres");
                datos[3] = consulta.getString("Apellidos");
                datos[4] = consulta.getString("Direccion");
                datos[5] = consulta.getString("Telefono");
                datos[6] = consulta.getString("Correo_electronico");
                datos[7] = consulta.getString("id_sangre");
                datos[8] = consulta.getString("Sangre");
                datos[9] = consulta.getString("Fecha_nacimiento");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
           System.out.println(ex.getMessage());
        }
        
        return tabla;
    }
    
    @Override
    public int agregar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="INSERT INTO estudiantes(Carnet,Nombres,Apellidos,Direccion,Telefono,Correo_electronico,id_sangre,Fecha_nacimiento) VALUES(?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getCarnet());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo());
            parametro.setInt(7, this.getId_sangre());
            parametro.setString(8, this.getFecha_nacimiento());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    
    @Override
    public int modificar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="update estudiantes set Carnet=?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,Correo_electronico=?,id_sangre=?,Fecha_nacimiento=? where id_estudiante=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, this.getCarnet());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getCorreo());
            parametro.setInt(7, this.getId_sangre());
            parametro.setString(8, this.getFecha_nacimiento());
            parametro.setInt(9, this.getId());
            parametro.executeUpdate();
            retorno = 1;
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno =0;
        }
        return retorno;
    }
    
    
    @Override
    public int eliminar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="delete from estudiantes where id_estudiante=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
}
