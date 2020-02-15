package cn.ppdxzz.service.impl;

import cn.ppdxzz.dao.AdminDao;
import cn.ppdxzz.domain.Admin;
import cn.ppdxzz.service.AdminService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/10 15:30
 * @Author: PeiChen
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao;
    @Autowired
    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    /**
     * 调用持久层中的findAdmin()方法校验用户名密码是否正确
     * @param admin
     * @return
     * @throws Exception
     */
    @Override
    public Admin findAdmin(Admin admin) throws Exception {
        return adminDao.findAdmin(admin);
    }

    /**
     * 通过id查询管理员信息
     * @param id
     * @return Admin
     * @throws Exception
     */
    @Override
    public Admin findAdminById(Integer id) throws Exception {
        return adminDao.findAdminById(id);
    }

    /**
     * 查询所有管理员信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Admin> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return adminDao.findAll();
    }

    /**
     * 通过id删除管理员
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteAdminById(Integer id) throws Exception {
        adminDao.deleteAdminById(id);
    }

    /**
     * 更新管理员信息
     * @param admin
     * @throws Exception
     */
    @Override
    public void updateAdmin(Admin admin) throws Exception {
        adminDao.updateAdmin(admin);
    }

    /**
     * 添加管理员信息
     * @param admin
     * @throws Exception
     */
    @Transactional
    @Override
    public void addAdmin(Admin admin) throws Exception {
        adminDao.addAdmin(admin);
    }

    @Override
    public Boolean checkUserName(String u_name) throws Exception {
        //System.out.println(adminDao.checkUserName(u_name));
        //用户名不存在则返回空，直接false
        if (adminDao.checkUserName(u_name) != null) {
            return true;
        }
        return false;
    }

    /**
     * 管理员信息模糊查询
     * @param tip
     * @return
     * @throws Exception
     */
    @Override
    public List<Admin> serarchInfo(int page,int size,String tip) throws Exception {
        PageHelper.startPage(page,size);
        List<Admin> list = adminDao.serarchInfo(tip);
        return list;
    }
}
