package cn.ppdxzz.service.impl;

import cn.ppdxzz.dao.VisitorDao;
import cn.ppdxzz.domain.Visitor;
import cn.ppdxzz.poi.WriteExcel;
import cn.ppdxzz.service.VisitorService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/18 18:50
 * @Author: PeiChen
 */
@Service("visitorService")
public class VisitorServiceImpl implements VisitorService {

    private VisitorDao visitorDao;

    @Autowired
    public void setVisitorDao(VisitorDao visitorDao) {
        this.visitorDao = visitorDao;
    }

    /**
     * 登记到访信息
     * @param visitor
     * @throws Exception
     */
    @Override
    public void add(Visitor visitor) throws Exception {
        visitorDao.add(visitor);
    }

    /**
     * 按时间晚的优先显示查询所有访客记录
     * @return
     * @throws Exception
     */
    @Override
    public List<Visitor> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return visitorDao.findAll();
    }

    /**
     * 根据关键字模糊查询访客记录，并按时间倒序排列
     * @param keyword
     * @return
     * @throws Exception
     */
    @Override
    public List<Visitor> search(int page, int size, String keyword) throws Exception {
        PageHelper.startPage(page,size);
        return visitorDao.search(keyword);
    }

    /**
     * 访客离开后修改离开时间（访客注销）
     * @param id
     * @param end_date
     * @throws Exception
     */
    @Override
    public void logout(String id, String end_date) throws Exception {
        visitorDao.logout(id,end_date);
    }

    /**
     * 导出访客记录
     * @return
     * @throws Exception
     */
    @Override
    public InputStream getInputStream() throws Exception {
        //Excel中的每列列名，依次对应数据库的字段
        String[] title = new String[]{"ID","姓名","学号","联系方式","访问地址","来访时间","离开时间","来访原因"};
        List<Visitor> visitors = visitorDao.findAll();
        List<Object[]> datalist = new ArrayList<>();
        for (int i = 0; i < visitors.size(); i++) {
            Object[] obj = new Object[8];
            obj[0] = visitors.get(i).getId();
            obj[1] = visitors.get(i).getName();
            obj[2] = visitors.get(i).getSno();
            obj[3] = visitors.get(i).getPhone();
            obj[4] = visitors.get(i).getPlace();
            obj[5] = visitors.get(i).getBegin_date();
            obj[6] = visitors.get(i).getEnd_date();
            obj[7] = visitors.get(i).getVisit_result();
            datalist.add(obj);
        }
        WriteExcel excel = new WriteExcel(title,datalist);
        return excel.export();
    }

    /**
     * 访客日志
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @Override
    public List<Visitor> log(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return visitorDao.findAll();
    }
}
