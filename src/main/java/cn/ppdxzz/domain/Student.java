package cn.ppdxzz.domain;

import java.io.Serializable;

/**
 * Description:
 *
 * @Date: 2020/2/17 14:08
 * @Author: PeiChen
 */
public class Student implements Serializable {
    private Integer id;
    private String name;//姓名
    private String sex;//性别
    private String sno;//学号
    private String stu_class;//班级
    private String phone;//联系方式
    private String place;//家庭住址
    private String dorm_id;//宿舍号
    private String teacher;//育人导师
    private Integer status;//学生状态是否激活：1 激活 0 禁用

    public Student() {
    }

    public Student(Integer id, String name, String sex, String sno, String stu_class, String phone, String place, String dorm_id, String teacher, Integer status) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.sno = sno;
        this.stu_class = stu_class;
        this.phone = phone;
        this.place = place;
        this.dorm_id = dorm_id;
        this.teacher = teacher;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getStu_class() {
        return stu_class;
    }

    public void setStu_class(String stu_class) {
        this.stu_class = stu_class;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getDorm_id() {
        return dorm_id;
    }

    public void setDorm_id(String dorm_id) {
        this.dorm_id = dorm_id;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", sno='" + sno + '\'' +
                ", stu_class='" + stu_class + '\'' +
                ", phone='" + phone + '\'' +
                ", place='" + place + '\'' +
                ", dorm_id='" + dorm_id + '\'' +
                ", teacher='" + teacher + '\'' +
                ", status=" + status +
                '}';
    }
}
