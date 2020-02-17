package cn.ppdxzz.controller;

import cn.ppdxzz.domain.Student;
import cn.ppdxzz.service.StudentService;
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
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/17 14:17
 * @Author: PeiChen
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    private StudentService studentService;
    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    /**
     * 查询所有学生信息
     * @param page
     * @param size
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ModelAndView mv = new ModelAndView();
        List<Student> list = null;
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().equals("") || keyword.length() == 0) {
            list = studentService.findAll(page, size);
        }else {
            list = studentService.search(page,size,keyword);
        }
        //PageInfo就是一个封装了分页数据的bean
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("student-list");

        return mv;
    }

    /**
     * 根据学号删除学生
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/delete")
    public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        String sno = request.getParameter("sno");
        if (sno == null || "".equals(sno) || sno.length() == 0) {
            writer.write("false");
            return;
        }
        studentService.delete(sno);
        writer.write("true");

    }

    /**
     * 判断指定学号是否存在
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/isExist")
    public void isSnoExist(HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        String sno = request.getParameter("sno");
        Student isExist = studentService.findBySno(sno);
        if (isExist == null) {
            return;
        }
        //如果isExist不为空说明学号已被注册
        writer.write("true");

    }

    @RequestMapping("/addStudent")
    public String addStudent() {
        return "student-add";
    }

    /**
     * 添加学生信息
     * @param student
     * @param response
     * @throws Exception
     */
    @RequestMapping("/add")
    public void add(Student student,HttpServletResponse response) throws Exception {
        PrintWriter writer = response.getWriter();
        if (student == null || studentService.findBySno(student.getSno()) != null) {
            writer.write("false");
            return;
        }
        boolean isAdd = studentService.add(student);
        if (isAdd) {
            writer.write("true");
        }else {
            writer.write("false");
        }

    }

    /**
     * 修改学生信息
     * @param student
     * @param response
     * @throws Exception
     */
    @RequestMapping("/update")
    public void update(Student student,HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        if (student == null || student.getId() == null) {
            return;
        }
        if (student.getName() == null || "".equals(student.getName()) || student.getName().length() == 0
            || student.getSex() == null || student.getSex().length() == 0 || "".equals(student.getSex())
            || student.getSno() == null || "".equals(student.getSno()) || student.getSno().length() == 0
            || student.getPhone() == null || "".equals(student.getPhone()) || student.getPhone().length() == 0
            || student.getStu_class() == null || "".equals(student.getStu_class()) || student.getStu_class().length() == 0
            || student.getPlace() == null || "".equals(student.getPlace()) || student.getPlace().length() == 0
            || student.getDorm_id() == null || "".equals(student.getDorm_id()) || student.getDorm_id().length() == 0
            || student.getTeacher() == null || "".equals(student.getTeacher()) || student.getTeacher().length() == 0 ) {
            return;
        }
        studentService.update(student);
        writer.write("true");

    }

    /**
     * 导出学生数据为Excel
     * @param response
     * @throws Exception
     */
    @RequestMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        InputStream is = studentService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=studentsInfo.xls");
        ServletOutputStream outputStream = response.getOutputStream();
        IOUtils.copy(is,outputStream);
    }



}
