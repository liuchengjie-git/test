package com.fh.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.fh.model.Student;

public class DemoDao {

	public List<Student> queryList(Student stu) {
		Configuration cfg = new Configuration().configure();
		SessionFactory sessionFactory = cfg.buildSessionFactory();
		Session session = sessionFactory.openSession();
		String hql = " from Student  where 1=1 ";
		if(stu != null && stu.getName()!= null && !stu.getName().replaceAll(" ", "").equals("")){
			hql +=" and name like '%"+ stu.getName().trim()+"%'";
		}
		Query query = session.createQuery(hql);
		List<Student> list = query.list();
		session.close();
		sessionFactory.close();
		return list;
	}

}
