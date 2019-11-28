package com.fh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

import com.fh.model.Student;
import com.fh.service.DemoService;
import com.opensymphony.xwork2.ActionSupport;

public class DemoAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
       private String name;
       private int age;
       private List<Student> list = new ArrayList<Student>();
       private DemoService ds = new DemoService();
       private Student stu = new Student();
       public String queryList(){
    	   list = ds.queryList(stu);
		return "one";
       }
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       public void test1(){
   		System.out.println(name+"今年"+age+"岁了");
   	}
       public  void test2(){
   		Student stu = new Student();
   		stu.setName("人生不相见 ");
   		stu.setAge(18);
   		//把对象 转化为json对象
   		JSON json = JSONSerializer.toJSON(stu);
   		
   		HttpServletResponse response = ServletActionContext.getResponse();
   		response.setCharacterEncoding("utf-8");
   		response.setContentType("application/json");
   		PrintWriter writer =null;
   		try {
   			 writer = response.getWriter();
   			 writer.write(json.toString());
   			 writer.flush();
   		} catch (IOException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}finally{
   			if(writer!= null){
   				writer.close();
   			}
   			
   		}
   		
   	}
       public void test3(){
    	   Student stu = new Student(); 
    	   stu.setName("小红");
      	   stu.setAge(18);
      	   Student stu1 = new Student(); 
      	   stu1.setName("小红1");
      	   stu1.setAge(18);
      	   Student stu2 = new Student(); 
      	   stu2.setName("小红2");
      	   stu2.setAge(18);
      	   Student stu3 = new Student(); 
      	   stu3.setName("小红3");
      	   stu3.setAge(18);
      	   List<Student> list = new ArrayList<Student>();
      	   list.add(stu);
      	   list.add(stu1);
      	   list.add(stu2);
      	   list.add(stu3);
      	 JSON json = JSONSerializer.toJSON(list);
 		
 		
 		HttpServletResponse response = ServletActionContext.getResponse();
 		response.setCharacterEncoding("utf-8");
 		response.setContentType("application/json");
 		PrintWriter writer =null;
 		try {
 			 writer = response.getWriter();
 			 writer.write(json.toString());
 			 writer.flush();
 		} catch (IOException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally{
 			if(writer!= null){
 				writer.close();
 				writer =null;
 			}
 	}
       }
       public String tset4(){
    	   Student stu = new Student(); 
    	   stu.setName("小红");
      	   stu.setAge(18);
      	   Student stu1 = new Student(); 
      	   stu1.setName("小红1");
      	   stu1.setAge(18);
      	   Student stu2 = new Student(); 
      	   stu2.setName("小红2");
      	   stu2.setAge(18);
      	   Student stu3 = new Student(); 
      	   stu3.setName("小红3");
      	   stu3.setAge(18);
      	  
      	   list.add(stu);
      	   list.add(stu1);
      	   list.add(stu2);
      	   list.add(stu3);
    	   return "one";
       }
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public List<Student> getList() {
		return list;
	}
	public void setList(List<Student> list) {
		this.list = list;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
       
}
