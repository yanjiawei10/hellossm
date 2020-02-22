package cn.ppdxzz.service;

import cn.ppdxzz.domain.Student;

import java.io.InputStream;
import java.util.List;

/**
 * Description:学生业务层
 *
 * @Date: 2020/2/17 14:21
 * @Author: PeiChen
 */
public interface StudentService {

    List<Student> findAll(int page,int size) throws Exception;

    Student findBySno(String sno) throws Exception;

    List<Student> search(int page, int size, String keyword) throws Exception;

    boolean add(Student student) throws Exception;

    void delete(String sno) throws Exception;

    void update(Student student) throws Exception;

    //返回一个携带所有学生信息数据的InputStream输入流
    InputStream getInputStream() throws Exception;

    List<Student> findByDormId(String dorm_id,Integer status) throws Exception;

    List<Student> findByTeacher(int page,int size,String teacher) throws Exception;

    List<Student> searchStudent(int page,int size,String teacher,String keyword) throws Exception;
}
