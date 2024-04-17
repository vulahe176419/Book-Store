/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.Book;
import entity.Roles;
import entity.User;

public class DAOUser extends DBConnect {

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from [Users]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public User getUserById(int id) {
        String sql = "select * from [Users] where [user_id]=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r);
                return u;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [Users] where [email]= ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r);
                return u;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public void inserUser(String name, String email, String phone, String address, String pass, int gender) {
        String sql = "  insert into [Users] ([user_name],[email],[password],[address],[gender] ,[phone],[role_id]) \n"
                + "  values (?,?,?,?,?,?,1)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, email);
            pre.setString(3, pass);
            pre.setString(4, address);
            pre.setInt(5, gender);
            pre.setString(6, phone);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void UpdateUser(String name, String email, String phone, String address, int gender, int userid) {
        String sql = " update [Users] set [user_name]=? ,[email] =? ,[address]=?, [gender]=? ,[phone]=? where [user_id] =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, email);
            pre.setString(3, address);
            pre.setInt(4, gender);
            pre.setString(5, phone);
            pre.setInt(6, userid);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public int getNumberUser() {
        String sql = "  select count(*)from  Users";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public void changePassword(String uid, String pass) {
        String sql = " update [Users] set [password]=? where [user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setString(2, uid);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteuser(String uid) {
        String sql = " delete [Users] where [user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
