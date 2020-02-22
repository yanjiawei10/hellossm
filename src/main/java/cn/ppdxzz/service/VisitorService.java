package cn.ppdxzz.service;

import cn.ppdxzz.domain.Visitor;

import java.io.InputStream;
import java.util.List;

/**
 * Description:
 *
 * @Date: 2020/2/18 18:27
 * @Author: PeiChen
 */
public interface VisitorService {

    void add(Visitor visitor) throws Exception;

    List<Visitor> findAll(int page,int size) throws Exception;

    List<Visitor> search(int page,int size,String keyword) throws Exception;

    void logout(String id,String end_date) throws Exception;

    InputStream getInputStream() throws Exception;

    List<Visitor> log(int page,int size) throws Exception;

}
