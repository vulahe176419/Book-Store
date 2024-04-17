/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Book;
import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAOBook extends DBConnect {

    public ArrayList<Book> getBook(String cid, String search, int index, String sort) {
        String sortby = "";
        switch (sort) {
            case "1":
                sortby = "order by b.create_date desc";
                break;
            case "2":
                sortby = "order by b.price asc";
                break;
            case "3":
                sortby = "order by b.price desc";
                break;
            default:
                sortby = "order by b.book_name desc";
                break;

        }
        ArrayList<Book> list = new ArrayList<>();
        String sql = "  select * from [Book] b, [Category] c "
                + "where b.category_id = c.category_id \n"
                + "and b.category_id like ?  and b.book_name like ?  "
                + sortby
                + " OFFSET ? ROWS FETCH NEXT 6  ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + cid + "%");
            pre.setString(2, "%" + search + "%");
            pre.setInt(3, (index - 1) * 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(8), rs.getString(9), rs.getDate(10)));
            }
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        return list;
    }

    public ArrayList<Book> getTopSelling() {
        ArrayList<Book> list = new ArrayList<>();
        String sql = "SELECT TOP 6 b.book_id AS book_id, b.book_name, b.author, b.price, c.category_id AS category_id, c.category_name\n"
                + "FROM Book b\n"
                + "INNER JOIN (\n"
                + "    SELECT SUM(quantity) AS numberSell, book_id\n"
                + "    FROM OrderDetail\n"
                + "    GROUP BY book_id\n"
                + ") AS d ON b.book_id = d.book_id\n"
                + "INNER JOIN Category c ON b.category_id = c.category_id\n"
                + "ORDER BY d.numberSell DESC;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(8), rs.getString(9), rs.getDate(10)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public ArrayList<Book> getAllBook(String cid, String search) {
        ArrayList<Book> list = new ArrayList<>();
        String sql = "  select * from Book b, Category c "
                + " where b.category_id = c.category_id \n"
                + " and b.category_id like ?  and b.book_name like ?"
                + " order by b.book_id asc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + cid + "%");
            pre.setString(2, "%" + search + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(8), rs.getString(9), rs.getDate(10)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public int getNumberBook(String cid, String search) {
        ArrayList<Book> list = new ArrayList<>();
        String sql = " select count(*) from Book b, Category c "
                + "where b.category_id = c.category_id \n"
                + "and b.category_id like ?  and b.book_name like ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + cid + "%");
            pre.setString(2, "%" + search + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public Book getBookById(int bid) {
        String sql = " select * from Book b, Category c "
                + "where b.category_id = c.category_id \n"
                + "and b.book_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(8), rs.getString(9), rs.getDate(10));
                return b;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void deleteBook(int bid) {
        String sql = "  DELETE FROM [Book] WHERE book_id =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, bid);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateBook(int id, String name, String author, String publishDate, double price, int cateId, int stock, String createDate, String descri, String img) {
        String sql = "  UPDATE [Book]  set "
                + "[book_name]= ? ,"
                + "[author]= ? ,"
                + "[publish_date]= ? ,"
                + "[price] = ?  ,"
                + "[stock]= ?,  \n"
                + "[category_id] = ? ,"
                + "[img] = ? , "
                + "[description] = ? ,"
                + "[create_date]= ? \n"
                + "where book_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, author);
            pre.setString(3, publishDate);
            pre.setDouble(4, price);
            pre.setInt(5, stock);
            pre.setInt(6, cateId);
            pre.setString(7, img);
            pre.setString(8, descri);
            pre.setString(9, createDate);
            pre.setInt(10, id);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void addBook(String name, String author, String publish, double price, int cateId, int stock, String img, String descri) {
        String sql = "INSERT INTO [Book] \n"
                + "(\n"
                + "    [book_name],\n"
                + "    [author],\n"
                + "    [publish_date],\n"
                + "    [price],\n"
                + "    [stock],\n"
                + "    [category_id],\n"
                + "    [img],\n"
                + "    [description],\n"
                + "    [create_date]\n"
                + ")\n"
                + "VALUES (?,?,?,?,?,?,?,?, GETDATE())";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, author);
            pre.setString(3, publish);
            pre.setDouble(4, price);
            pre.setInt(5, stock);
            pre.setInt(6, cateId);
            pre.setString(7, img);
            pre.setString(8, descri);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "  select * from Category";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("category_id"), rs.getString("category_name")));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void addCategory(String name) {
        String sql = "  insert into [Category] ([category_name])  values (?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void editCategory(String name, String id) {
        String sql = " update [Category] set [category_name] = ? where [category_id] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, id);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteCategory(String id) {
        String sql = "DELETE FROM Category WHERE category_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
