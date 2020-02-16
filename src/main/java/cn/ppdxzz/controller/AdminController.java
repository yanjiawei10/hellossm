package cn.ppdxzz.controller;

import cn.ppdxzz.domain.Admin;
import cn.ppdxzz.service.AdminService;
import cn.ppdxzz.utils.MD5Util;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/10 15:20
 * @Author: PeiChen
 */
@Controller
public class AdminController {

    private AdminService adminService;
    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    /**
     * 处理用户登录请求
     * @param model
     * @param admin
     * @param session
     * @param request
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(Model model, Admin admin, HttpSession session, HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        if (admin == null || admin.getUsername() == null || admin.getPassword() == null) {
            return "login";
        }
        admin.setPassword(MD5Util.MD5EncodeUtf8(admin.getPassword()));
        Admin ad = adminService.findAdmin(admin);
        if (ad != null) {
            //登录信息存入session域
            session.setAttribute("adminInfo",ad);
            //System.out.println(ad);
            return "main";
        }
        model.addAttribute("msg","用户名或密码错误，请重新输入！");
        return "login";
    }

    //拦截后跳转至登录页
    @RequestMapping("/to_login")
    public String Login() {
        return "login";
    }
    /**
     * 退出登录
    n */
    @RequestMapping(value = "/loginOut")
    public String loginOut(Admin admin,Model model,HttpSession session) {
        //通过session.invalidate()方法来注销当前的session
        session.invalidate();
        return "login";

    }

    /**
     * 分页查询所有管理员信息
     */
    @RequestMapping(value = "/findAllAdmin")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size,HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ModelAndView mv = new ModelAndView();
        List<Admin> admins = null;
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().equals("") || keyword.length() == 0) {
            admins = adminService.findAll(page,size);
        }else {
            admins = adminService.serarchInfo(page,size,keyword);
        }
        //PageInfo就是一个封装了分页数据的bean
        PageInfo pageInfo = new PageInfo(admins);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin-list");
        return mv;
    }

    /**
     * 删除管理员
     */
    @ResponseBody
    @RequestMapping(value = "/deleteAdmin")
    public void deleteAdmin(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        adminService.deleteAdminById(Integer.parseInt(id));
    }

    /**
     * 校验用户名是否存在
     */
    @RequestMapping(value = "/checkUserName")
    public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        //取值
        String u_name = request.getParameter("u_name");
        //调用service,用户名存在返回true，不存在则返回false
        Boolean result = adminService.checkUserName(u_name);
        //System.out.println(result);
        //回调函数
        if (result) {
            //pw.write("用户名已存在，请重新输入！");
            pw.write("账号可用");
        }else {
            pw.write("账号不存在");
        }
    }
    @RequestMapping(value = "/adminAdd")
    public String adminAdd() {
        return "admin-add";
    }

    /**
     * 添加管理员
     * @param admin
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/addAdmin")
    public void addAdmin(Admin admin,HttpServletRequest request,HttpServletResponse response) throws Exception {
        PrintWriter writer = response.getWriter();
        Boolean check = adminService.checkUserName(admin.getUsername());
        //如果用户名已存在check为true，不存在为false
        if (check) {
            writer.write("false");
            return;
        }
        if (admin == null) {
            writer.write("false");
            return;
        }else {
            if(admin.getUsername() == null || "".trim().equals(admin.getUsername())
                    || admin.getPassword() == null ||"".trim().equals(admin.getPassword())
                    || admin.getName() == null || "".trim().equals(admin.getName())
                    || admin.getPhone() == null || "".trim().equals(admin.getPhone())
                    || admin.getDescription() == null || "".trim().equals(admin.getDescription())) {
                        writer.write("false");
                        return;
            }
        }
        admin.setPassword(MD5Util.MD5EncodeUtf8(admin.getPassword()));
        adminService.addAdmin(admin);
        writer.write("true");
    }
    //跳转管理员信息编辑页面，并回显信息
    @RequestMapping("/adminEdit")
    public ModelAndView editAdmin(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        Admin ad = adminService.findAdminById(Integer.parseInt(id));
        mv.addObject("ad",ad);
        //mv.addObject("id",id);
        mv.setViewName("admin-edit");
        return mv;
    }
    //修改管理员信息
    @RequestMapping("/editAdmin")
    public void editAdmin(Admin admin,HttpServletResponse response) throws Exception {
        PrintWriter writer = response.getWriter();
        if (admin == null) {
            writer.write("false");
            return;
        }else {
            if(admin.getUsername() == null || "".trim().equals(admin.getUsername())
                    || admin.getName() == null || "".trim().equals(admin.getName())
                    || admin.getPhone() == null || "".trim().equals(admin.getPhone())
                    || admin.getDescription() == null || "".trim().equals(admin.getDescription())) {
                writer.write("false");
                return;
            }
        }
        //admin.setPassword(MD5Util.MD5EncodeUtf8(admin.getPassword()));
        adminService.updateAdmin(admin);
        //更新成功进行提示信息回显
        writer.write("true");
    }

    /**
     * 授权操作
     */
    @RequestMapping("/put_power")
    public void put_power(Admin admin,HttpServletResponse response) throws Exception {
        PrintWriter writer = response.getWriter();
        if (admin == null) {
            writer.write("false");
            return;
        }
        if (admin.getPower() < 0 || admin.getPower() > 3) {
            writer.write("false");
            return;
        }
        adminService.put_power(admin);
        writer.write("true");
    }

    @ResponseBody
    @RequestMapping(value = "/exportAdminInfo")
    public List<Admin> export() throws Exception {
        List<Admin> admins = adminService.exportAdminInfo();
        return admins;
    }








}
