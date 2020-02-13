package cn.ppdxzz.domain;

import java.io.Serializable;

/**
 * Description:管理员实体类
 *
 * @Date: 2020/2/10 15:13
 * @Author: PeiChen
 */
public class Admin implements Serializable {
    private Integer id;         //id 主键自增
    private String username;    //用户名
    private String password;    //密码
    private String name;        //姓名
    private String phone;       //手机号
    private int power;          //是否开启权限
    private String description; //描述

    public Admin() {
    }

    public Admin(Integer id, String username, String password, String name, String phone, int power, String description) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.power = power;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", power=" + power +
                ", description='" + description + '\'' +
                '}';
    }
}
