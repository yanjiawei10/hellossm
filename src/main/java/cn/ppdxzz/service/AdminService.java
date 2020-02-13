package cn.ppdxzz.service;

import cn.ppdxzz.domain.Admin;

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
}
