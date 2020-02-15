package cn.ppdxzz.dao;

import cn.ppdxzz.domain.Admin;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description:持久层
 *
 * @Date: 2020/2/10 15:33
 * @Author: PeiChen
 */
@Repository
public interface AdminDao {

    /**
     * 通过用户名密码查询用户信息
     * @param admin
     * @return
     * @throws Exception
     */
    @Select("select * from admins where username = #{username} and password = #{password}")
    Admin findAdmin(Admin admin) throws Exception;

    /**
     * 通过id查询用户信息
     */
    @Select("select * from admins where id = #{id}")
    Admin findAdminById(Integer id) throws Exception;

    /**
     * 查询所有管理员信息
     */
    @Select("select * from admins")
    List<Admin> findAll() throws Exception;

    /**
     * 根据id删除管理员信息
     * @param id
     * @throws Exception
     */
    @Delete("delete from admins where id = #{id}")
    void deleteAdminById(Integer id) throws Exception;

    /**
     * 修改管理员信息
     * @param admin
     * @throws Exception
     */
    @Update("update admins set username= #{username},password = #{password},name = #{name}, phone = #{phone}, power = #{power}, description = #{description} where id = #{id}")
    void updateAdmin(Admin admin) throws Exception;

    /**
     * 添加管理员信息
     * @param admin
     * @throws Exception
     */
    @Insert("insert into admins(username,password,name,phone,power,description) values (#{username},#{password},#{name},#{phone},#{power},#{description})")
    void addAdmin(Admin admin) throws Exception;

    /**
     * 校验用户名是否存在
     */
    @Select("select * from admins where username = #{u_name}")
    Boolean checkUserName(String u_name) throws Exception;

    /**
     * 重置密码
     * @param password
     * @param id
     * @throws Exception
     */
    @Update("update admins set password = #{password} where id = #{id}")
    void updatePassword(String password,Integer id) throws Exception;

    //select * from admins where username like '%p%' or name like '%万%' or power like '%1%' or description like '%管理员%';
    //模糊搜索管理员信息，查询结果返回一个list集合
    @Select("select * from admins where username like '%${tip}%' or name like '%${tip}%' or power like '%${tip}%' or description like '%${tip}%'")
    List<Admin> serarchInfo(@Param(value="tip") String tip) throws Exception;

}
