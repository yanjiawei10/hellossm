package cn.ppdxzz.service.impl;

import cn.ppdxzz.dao.AdminDao;
import cn.ppdxzz.domain.Admin;
import cn.ppdxzz.poi.WriteExcel;
import cn.ppdxzz.service.AdminService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
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
     * @param keyword
     * @return
     * @throws Exception
     */
    @Override
    public List<Admin> serarchInfo(int page,int size,String keyword) throws Exception {
        PageHelper.startPage(page,size);
        List<Admin> list = adminDao.serarchInfo(keyword);
        return list;
    }

    /**
     * 授权
     * @param admin
     * @throws Exception
     */
    @Override
    public void put_power(Admin admin) throws Exception {
        adminDao.put_power(admin);
    }

    /**
     * 导出管理员信息
     * @return
     * @throws Exception
     */
    @Override
    public InputStream getInputStream() throws Exception {
        //Excel中的每列列名，依次对应数据库的字段
        String[] title = new String[]{"ID","用户名","密码","姓名","学/工号","手机号","权限","描述"};
        List<Admin> admins = adminDao.exportAdminInfo();
        List<Object[]>  dataList = new ArrayList<Object[]>();
        for (int i = 0; i < admins.size(); i++) {
            Object[] obj = new Object[7];
            obj[0] = admins.get(i).getId();
            obj[1] = admins.get(i).getUsername();
            obj[2] = admins.get(i).getPassword();
            obj[3] = admins.get(i).getName();
            obj[4] = admins.get(i).getUid();
            obj[5] = admins.get(i).getPhone();
            obj[6] = admins.get(i).getPower();
            obj[7] = admins.get(i).getDescription();
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList);
        InputStream in;
        in = ex.export();
        return in;
    }

    /**
     * 校验学/工号是否已被注册
     * @param uid
     * @return
     * @throws Exception
     */
    @Override
    public Admin checkUid(String uid) throws Exception {
        return adminDao.checkUid(uid);
    }
}
