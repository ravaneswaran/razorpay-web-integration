package com.demo.razorpay.dao;

import com.demo.razorpay.models.OrderProductJoin;

import javax.persistence.Query;
import java.util.List;

public class OrderProductJoinDAO extends AbstractDAO<OrderProductJoin>{

    public OrderProductJoinDAO() {
        super(OrderProductJoin.class);
    }

    public OrderProductJoin findById(String id){
        return this.getEntityManager().find(OrderProductJoin.class, id);
    }

    public List<OrderProductJoin> findByOrderId(String orderId){
        Query query = this.getEntityManager().createQuery("SELECT opj FROM OrderProductJoin AS opj WHERE opj.order.id = :orderId");
        query.setParameter("orderId", orderId);

        return query.getResultList();
    }
}
