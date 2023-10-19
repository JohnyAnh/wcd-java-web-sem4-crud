package dao;

import entity.User;
import utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class UserDAO {
    private EntityManager em = JpaUtils.getEntityManager();
    @Override
    protected  void finalize() throws Throwable{
        em.close();
        super.finalize();
    }

    public User create(User entity){
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
            return entity;

        }catch (Exception e){
            e.printStackTrace();
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public User update( User entity){
        try {
            em.getTransaction().begin();
            em.merge(entity);//ham sua
            em.getTransaction().commit();
            return entity;

        }catch (Exception e){
            e.printStackTrace();
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public User remove(String id){
        try {
            em.getTransaction().begin();
            User entity = this.findById(id);
            em.remove(entity);//ham xoas
            em.getTransaction().commit();
            return entity;

        }catch (Exception e){
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public User findById(String id){
        return em.find(User.class, id);
    }

    //Tim theo quyen
    public List<User> findByRole(boolean role){
        String jpql = "Select o from User o where o.admin=:role";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("role", role);
        return query.getResultList();
    }
    //Tim theo keyword
    public List<User> findByKeyWord(String keyword){
        String jpql = "Select o from User o where  o.fullname like ?1";
        TypedQuery<User>  query = em.createQuery(jpql, User.class);
        query.setParameter(1, keyword);
        return query.getResultList();
    }

    //Tim theo email
    public User findByEmail(String email){
        String jpql = "Select o from User o where o.email=:email";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("email", email);
        return query.getSingleResult();
    }

    //Tim theo dong
    public User findOne(String username, String password){
        String jpql = "Select o from User o where o.id=:id and o.password=:pass";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("id", username);
        query.setParameter("pass", password);
        return query.getSingleResult();
    }

    //Tim kiem phan trang
    public List<User> findPage(int page, int size){
        String jpql = "Select o from User o";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setFirstResult(page*size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    //lấy hêt User
    public List<User> findAll(){
        String jpql = "Select o from User o";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        return query.getResultList();
    }

}
