/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.cientifica.clase04.dao;

import java.util.List;
import pe.edu.cientifica.clase04.entity.Post;

/**
 *
 * @author BReyna
 */
public interface PostDao {
    public List<Post> readAll();
    public int create(Post post);
    public int update(Post post);
    public int delete(int id);
    public Post read(int id);
}
