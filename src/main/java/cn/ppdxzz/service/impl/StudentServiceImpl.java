package cn.ppdxzz.service.impl;

import cn.ppdxzz.dao.StudentDao;
import cn.ppdxzz.domain.Student;
import cn.ppdxzz.poi.WriteExcel;
import cn.ppdxzz.service.StudentService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/17 14:22
 * @Author: PeiChen
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    private StudentDao studentDao;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    /**
     * 查询所有学生信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return studentDao.findAll();
    }

    /**
     * 通过学号sno查询学生信息
     * @return
     * @throws Exception
     */
    @Override
    public Student findBySno(String sno) throws Exception {
        return studentDao.findBySno(sno);
    }

    /**
     * 模糊查询学生信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> search(int page, int size, String keyword) throws Exception {
        PageHelper.startPage(page,size);
        return studentDao.search(keyword);
    }

    /**
     * 添加学生信息
     * @param student
     * @throws Exception
     */
    @Override
    public boolean add(Student student) throws Exception {
        if (student == null || student.getName() == null || student.getSex() == null || student.getSno() == null
                || student.getPhone() == null || student.getPlace() == null || student.getDorm_id() == null
                || student.getTeacher() == null || student.getStu_class() == null || student.getStatus() == null)  {
            return false;
        }
        studentDao.add(student);
        return true;
    }

    /**
     * 根据学号删除学生
     * @param sno
     * @throws Exception
     */
    @Override
    public void delete(String sno) throws Exception {
        studentDao.delete(sno);
    }

    /**
     * 修改学生信息
     * @param student
     * @throws Exception
     */
    @Override
    public void update(Student student) throws Exception {
        studentDao.update(student);
    }

    /**
     * 导出学生信息
     * @return
     * @throws Exception
     */
    @Override
    public InputStream getInputStream() throws Exception {
        //Excel中的每列列名，依次对应数据库的字段
        String[] title = new String[]{"姓名","性别","学号","班级","联系方式","家庭住址","宿舍号","育人导师","状态"};
        List<Student> students = studentDao.findAll();
        List<Object[]> datalist = new ArrayList<>();
        for (int i = 0; i < students.size(); i++) {
            Object[] obj = new Object[9];
            obj[0] = students.get(i).getName();
            obj[1] = students.get(i).getSex();
            obj[2] = students.get(i).getSno();
            obj[3] = students.get(i).getStu_class();
            obj[4] = students.get(i).getPhone();
            obj[5] = students.get(i).getPlace();
            obj[6] = students.get(i).getDorm_id();
            obj[7] = students.get(i).getTeacher();
            obj[8] = students.get(i).getStatus();
            datalist.add(obj);
        }
        WriteExcel excel = new WriteExcel(title,datalist);

        return excel.export();
    }

    /**
     * 根据宿舍号查询状态为status的学生
     * @param dorm_id
     * @param status
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> findByDormId(String dorm_id, Integer status) throws Exception {
        return studentDao.findByDormId(dorm_id, status);
    }

    /**
     * 查询育人导师为teacher的学生集合
     * @param teacher
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> findByTeacher(int page,int size,String teacher) throws Exception {
        PageHelper.startPage(page,size);
        return studentDao.findByTeacher(teacher);
    }

    @Override
    public List<Student> searchStudent(int page, int size, String teacher, String keyword) throws Exception {
        PageHelper.startPage(page,size);
        return studentDao.searchStudent(teacher,keyword);
    }
}
