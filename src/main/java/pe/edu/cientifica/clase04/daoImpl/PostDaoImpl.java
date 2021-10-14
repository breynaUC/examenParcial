/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.cientifica.clase04.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.cientifica.clase04.config.Conexion;
import pe.edu.cientifica.clase04.dao.PostDao;
import pe.edu.cientifica.clase04.entity.Post;

/**
 *
 * @author BReyna
 */
public class PostDaoImpl implements PostDao{
    private PreparedStatement ps;
    private ResultSet rs;
    private Connection cx;
    @Override
    public List<Post> readAll() {
        List<Post> posts = new ArrayList<>();
        String SQL = "select *from post";
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while(rs.next()){
                Post post = new Post();
                post.setIdpost(rs.getInt("idpost"));
                post.setTitulo(rs.getString("titulo"));
                post.setDescripcion(rs.getString("descripcion"));
                posts.add(post);
            }
        } catch (SQLException e) {
            System.out.println("Error:"+e);
        }
        return posts;
    }

    @Override
    public int create(Post post) {
        System.out.println("jonas");
        int x = 0;
        String SQL = "INSERT INTO post(titulo, descripcion) VALUES(?,?)"; 
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            ps.setString(1, post.getTitulo());
            ps.setString(2, post.getDescripcion());
            x = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        return x;
    }

    @Override
    public int update(Post post) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Post read(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
