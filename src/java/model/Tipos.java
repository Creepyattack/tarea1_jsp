/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author ppbet
 */
public class Tipos {
    private int id_sangre;
    private String Sangre;        
    private Conexion cn;
    public Tipos(){
        
    }
    public Tipos(int id_sangre, String Sangre) {
        this.id_sangre = id_sangre;
        this.Sangre = Sangre;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }

    public String getSangre() {
        return Sangre;
    }

    public void setSangre(String Sangre) {
        this.Sangre = Sangre;
    }
    
         public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            cn = new Conexion();
            String query="SELECT id_sangre as id,Sangre FROM tipos_sangre;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while(consulta.next()){
                drop.put(consulta.getString("id"), consulta.getString("Sangre"));
            }
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}
