package cn.ppdxzz.service.impl;

import cn.ppdxzz.dao.DormDao;
import cn.ppdxzz.domain.Dorm;
import cn.ppdxzz.poi.WriteExcel;
import cn.ppdxzz.service.DormService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/19 20:22
 * @Author: PeiChen
 */
@Transactional
@Service("dormService")
public class DormServiceImpl implements DormService {

    private DormDao dormDao;

    @Autowired
    public void setDormDao(DormDao dormDao) {
        this.dormDao = dormDao;
    }

    /**
     * 查询所有宿舍信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @Override
    public List<Dorm> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return dormDao.findAll();
    }

    /**
     * 根据keyword关键字模糊查询宿舍信息
     * @param page
     * @param size
     * @param keyword
     * @return
     * @throws Exception
     */
    @Override
    public List<Dorm> search(int page, int size, String keyword) throws Exception {
        PageHelper.startPage(page,size);
        return dormDao.search(keyword);
    }

    /**
     * 添加宿舍信息
     * @param dorm
     * @throws Exception
     */
    @Override
    public void add(Dorm dorm) throws Exception {
        dormDao.add(dorm);
    }

    /**
     * 更新宿舍信息
     * @param dorm
     * @throws Exception
     */
    @Override
    public void update(Dorm dorm) throws Exception {
        dormDao.update(dorm);
    }

    /**
     * 导出宿舍信息
     * @return
     * @throws Exception
     */
    @Override
    public InputStream getInputStream() throws Exception {
        //Excel中的每列列名，依次对应数据库的字段
        String[] title = new String[]{"ID","宿舍号","宿舍简介","宿舍荣誉","宿舍长","育人导师"};
        List<Dorm> dorms = dormDao.findAll();
        List<Object[]> datalist = new ArrayList<>();
        for (int i = 0; i < dorms.size(); i++) {
            Object[] obj = new Object[6];
            obj[0] = dorms.get(i).getId();
            obj[1] = dorms.get(i).getDorm_id();
            obj[2] = dorms.get(i).getDorm_intro();
            obj[3] = dorms.get(i).getDorm_rps();
            obj[4] = dorms.get(i).getDorm_leader();
            obj[5] = dorms.get(i).getTeacher();
            datalist.add(obj);
        }
        WriteExcel excel = new WriteExcel(title,datalist);
        return excel.export();
    }

    @Override
    public Dorm findByDormId(String dorm_id) throws Exception {
        return dormDao.findByDormId(dorm_id);
    }

    @Override
    public Dorm findById(String id) throws Exception {
        return dormDao.findById(id);
    }

    @Override
    public List<Dorm> findByTeacher(String teacher) throws Exception {
        return dormDao.findByTeacher(teacher);
    }
}
