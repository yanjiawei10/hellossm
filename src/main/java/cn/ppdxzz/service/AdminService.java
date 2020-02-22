package cn.ppdxzz.service;

import cn.ppdxzz.domain.Admin;

import java.io.InputStream;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/10 15:27
 * @Author: PeiChen
 */
public interface AdminService {
    /**
     * 校验用户名密码是否正确
     */
    Admin findAdmin(Admin admin) throws Exception;
    //通过id查询管理员信息
    Admin findAdminById(Integer id) throws Exception;

    List<Admin> findAll(int page,int size) throws Exception;

    void deleteAdminById(Integer id) throws Exception;

    void updateAdmin(Admin admin) throws Exception;

    void addAdmin(Admin admin) throws Exception;

    Boolean checkUserName(String u_name) throws Exception;
    //模糊搜索管理员信息，查询结果返回一个list集合
    List<Admin> serarchInfo(int page,int size,String keyword) throws Exception;

    //授权
    void put_power(Admin admin) throws Exception;

    //返回一个携带所有管理员信息数据的InputStream输入流
    InputStream getInputStream() throws Exception;

    //校验学工号是否被注册
    Admin checkUid(String uid) throws Exception;

}
