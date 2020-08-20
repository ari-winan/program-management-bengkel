/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ari
 */
public class Koneksi {
    private Connection koneksi;
        public Connection connect(){
            try{
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex){
                System.out.println("Koneksi Gagal "+ex);
            }
            String url = "jdbc:mysql://localhost:3306/db_bengkel";
            try{
                koneksi = DriverManager.getConnection(url, "root", "");
                
            }catch (SQLException ex){
                System.out.println("Gagal Koneksi "+ex);
            }
            return koneksi;
        }
}
