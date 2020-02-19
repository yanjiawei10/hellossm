package cn.ppdxzz.controller;

import cn.ppdxzz.domain.Visitor;
import cn.ppdxzz.service.VisitorService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Description:
 *
 * @Date: 2020/2/18 16:26
 * @Author: PeiChen
 */
@Controller
@RequestMapping("/visitor")
public class VisitorController {

    private VisitorService visitorService;

    @Autowired
    public void setVisitorService(VisitorService visitorService) {
        this.visitorService = visitorService;
    }

    @RequestMapping("/login")
    public String register() {
        return "regist_visitor";
    }

    /**
     * 来访登记实现（C操作）
     * @param visitor
     * @return
     * @throws Exception
     */
    @RequestMapping("/addLogin")
    public ModelAndView addVisitor(Visitor visitor) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (visitor == null || visitor.getName() == null || visitor.getSno() == null || visitor.getPhone() == null || visitor.getPlace() == null) {
            mv.addObject("error_msg","来访登记失败，请重新登记！");
            mv.setViewName("regist_visitor");
            return mv;
        }
        if (visitor.getId() == null || "".trim().equals(visitor.getId())) {
            String uuid = UUID.randomUUID().toString().replace("-", "");
            visitor.setId(uuid);
        }
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        visitor.setBegin_date(date);//设置来访时间为提交来访登记时间
        //先设置离开时间为空串，后续注销时再修改为注销时系统时间
        if (visitor.getEnd_date() == null || "".trim().equals(visitor.getEnd_date())) {
            visitor.setEnd_date("");
        }
        visitorService.add(visitor);
        mv.addObject("id",visitor.getId());
        mv.setViewName("visitor-success");
        return mv;
    }

    /**
     * 访客记录注销
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/login_out")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        if (id == null || "".trim().equals(id)) {
            mv.addObject("logout_msg","系统繁忙，请稍后再试！");
            mv.setViewName("regist_visitor");
        }
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        visitorService.logout(id,date);
        mv.addObject("logout_msg","注销成功");
        mv.setViewName("regist_visitor");
        return mv;
    }

    /**
     * 管理员手动注销来访状态
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateStatus")
    public void updateStatus(HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        String id = request.getParameter("id");
        if (id == null || "".trim().equals(id)) {
            writer.write("false");
            return;
        }
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        visitorService.logout(id,date);
        writer.write("true");
    }

    /**
     * 查询所有访客记录
     * @param page
     * @param size
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size,HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ModelAndView mv = new ModelAndView();
        List<Visitor> visitors = null;
        String keyword = request.getParameter("keyword");
        if (keyword == null || "".trim().equals(keyword) || keyword.length() == 0) {
            visitors = visitorService.findAll(page,size);
        }else {
            visitors = visitorService.search(page,size,keyword);
        }
        PageInfo pageInfo = new PageInfo(visitors);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("visitor-list");

        return mv;
    }

    /**
     * 导出访客信息
     * @param response
     * @throws Exception
     */
    @RequestMapping("/visitorInfo")
    public void export(HttpServletResponse response) throws Exception {
        InputStream is = visitorService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition","attachment;filename=visitorInfo.xls");
        ServletOutputStream outputStream = response.getOutputStream();
        IOUtils.copy(is,outputStream);

    }
}
