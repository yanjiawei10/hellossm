package cn.ppdxzz.dao;

import cn.ppdxzz.domain.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description:学生类的持久层
 *
 * @Date: 2020/2/17 14:19
 * @Author: PeiChen
 */
@Repository
public interface StudentDao {

    /**
     * 查询所有学生信息
     * @return
     * @throws Exception
     */
    @Select("select * from students")
    List<Student> findAll() throws Exception;

    /**
     * 通过学号sno查询学生信息
     * @return
     * @throws Exception
     */
    @Select("select * from students where sno = #{sno}")
    Student findBySno(String sno) throws Exception;

    /**
     * 模糊查询学生信息
     * @return
     * @throws Exception
     */
    @Select("select * from students where name like '%${keyword}%' or sex like '%${keyword}%' or sno like '%${keyword}%' or  stu_class like '%${keyword}%' or phone like '%${keyword}%' or place like '%${keyword}%' or dorm_id like '%${keyword}%' or teacher like '%${keyword}%' ")
    List<Student> search(@Param(value = "keyword") String keyword) throws Exception;

    /**
     * 添加学生信息
     * @param student
     * @throws Exception
     */
    @Insert("insert into students(name, sex, sno, stu_class, phone, place, dorm_id, teacher, status) values(#{name},#{sex},#{sno},#{stu_class},#{phone},#{place},#{dorm_id},#{teacher},#{status})")
    void add(Student student) throws Exception;

    /**
     * 根据id删除学生
     * @param sno
     * @throws Exception
     */
    @Delete("delete from students where sno = #{sno}")
    void delete(String sno) throws Exception;

    /**
     * 根据id修改学生信息
     * @param student
     * @throws Exception
     */
    @Update("update students set name = #{name},sex = #{sex},sno = #{sno},stu_class = #{stu_class},phone = #{phone},place = #{place},dorm_id = #{dorm_id},teacher = #{teacher},status = #{status} where id = #{id}")
    void update(Student student) throws Exception;

    /**
     * 根据宿舍号查询状态为status的宿舍学生
     * @param dorm_id
     * @return
     * @throws Exception
     */
    @Select("select * from students where dorm_id = #{dorm_id} and status = #{status}")
    List<Student> findByDormId(@Param(value = "dorm_id") String dorm_id,@Param(value = "status") Integer status) throws Exception;

    /**
     * 查询育人导师为teacher的学生集合
     * @param teacher
     * @return
     * @throws Exception
     */
    @Select("select * from students where teacher = #{teacher}")
    List<Student> findByTeacher(String teacher) throws Exception;

    /**
     * 模糊查询固定育人导师所带学生信息
     * @param teacher
     * @param keyword
     * @return
     * @throws Exception
     */
    @Select("select * from students where teacher = #{teacher} and sno = #{keyword} ")
    List<Student> searchStudent(@Param(value = "teacher") String teacher,@Param(value = "keyword") String keyword) throws Exception;

}
