package com.fh.service;

import java.util.List;

import com.fh.dao.DemoDao;
import com.fh.model.Student;

public class DemoService {
       DemoDao dd = new DemoDao();
	public List<Student> queryList(Student stu) {
		return dd.queryList(stu);
	}

}
