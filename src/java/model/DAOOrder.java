/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.CartItem;
import entity.Order;
import entity.User;
import entity.Cart;
import entity.Book;
import entity.Category;
import entity.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAOOrder extends DBConnect {

    public void insertOrder(User u, Cart cart, String notes) {
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            String sql = "insert into [Order] ([user_id],[order_date],[total],[notes],[status]) values (?,GETDATE(), ?, ?,1)";
            pre = connection.prepareStatement(sql);
            pre.setInt(1, u.getId());
            pre.setDouble(2, cart.getTotalMoney());
            pre.setString(3, notes);
            pre.executeUpdate();
            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            pre = connection.prepareStatement(sql1);
            rs = pre.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] ([order_id],[book_id]  ,[price],[quantity]) values (?,?, ?, ?)";
                    pre = connection.prepareStatement(sql2);
                    pre.setInt(1, oid);
                    pre.setInt(2, item.getBook().getId());
                    pre.setDouble(3, item.getBook().getPrice());
                    pre.setInt(4, item.getQuantity());
                    pre.executeUpdate();
                }
            }
            String sql3 = "update [Book] set [stock] = [stock] - ? "
                    + "where book_id = ?";
            pre = connection.prepareStatement(sql3);
            for (CartItem item : cart.getItems()) {
                pre.setInt(1, item.getQuantity());
                pre.setInt(2, item.getBook().getId());
                pre.executeUpdate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Order> getAllOrderByuId(int uid, String fdate, String tdate) {
        ArrayList<Order> ol = new ArrayList<>();
        String sql = "  select * from [Order] where user_id = ? and [order_date] between ? and ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, uid);
            pre.setString(2, fdate);
            pre.setString(3, tdate);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getInt(1), new User(rs.getInt(2)), rs.getDate(3), rs.getDouble(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ol;
    }

    public ArrayList<Order> getAllOrder(String uid, String fdate, String tdate) {
        if (fdate.isEmpty()) {
            fdate = "1990-01-01";
        }
        if (tdate.isEmpty()) {
            tdate = "2990-01-01";
        }
        ArrayList<Order> ol = new ArrayList<>();
        String sql = "  select * from [Order] where [order_date] between ? and ? ";
        if (!uid.isEmpty()) {
            sql = sql + " and user_id = ? ";
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, fdate);
            pre.setString(2, tdate);
            if (!uid.isEmpty()) {
                pre.setString(3, uid);
            }
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getInt(1), new User(rs.getInt(2)), rs.getDate(3), rs.getDouble(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ol;
    }

    public ArrayList<OrderDetail> getAllOrderDetailByoId(int oid) {
        ArrayList<OrderDetail> odl = new ArrayList<>();
        String sql = " SELECT b.*, o.*\n"
                + "FROM OrderDetail o\n"
                + "INNER JOIN Book b ON o.book_id = b.book_id\n"
                + "WHERE o.order_id =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, oid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(8), rs.getString(9), rs.getDate(10));
                odl.add(new OrderDetail(rs.getInt("detail_id"), rs.getInt("order_id"), b, rs.getDouble("price"), rs.getInt("quantity")));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return odl;
    }

    public int getNumberOrder() {
        String sql = "  SELECT COUNT(DISTINCT order_id) AS distinct_id_count FROM [Order];";
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

    public double getTotalProfit() {
        String sql = "  select sum(price*quantity) from OrderDetail";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public void updateStatusOrder(int status, int id) {
        try {
            String sql = " update [Order] set status = " + status + " where [order_id] =" + id;
            System.out.println(sql);
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteOrder(int oid) {
        String sql = " DELETE FROM [OrderDetail] WHERE order_id = ?\n" 
                   + " DELETE FROM [Order] WHERE order_id =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, oid);
            pre.setInt(2, oid);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
