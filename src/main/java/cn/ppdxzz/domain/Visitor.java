package cn.ppdxzz.domain;

import java.io.Serializable;

/**
 * Description:访客实体类
 *
 * @Date: 2020/2/18 16:29
 * @Author: PeiChen
 */
public class Visitor implements Serializable {
    private String id;//uuid 全球唯一id
    private String name;//访客姓名
    private String sno;//访客学号
    private String phone;//联系方式
    private String place;//访问地址
    private String begin_date;//来访时间
    private String end_date;//离开时间
    private String visit_result;//到访原因

    public Visitor() {
    }

    public Visitor(String id, String name, String sno, String phone, String place, String begin_date, String end_date, String visit_result) {
        this.id = id;
        this.name = name;
        this.sno = sno;
        this.phone = phone;
        this.place = place;
        this.begin_date = begin_date;
        this.end_date = end_date;
        this.visit_result = visit_result;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getBegin_date() {
        return begin_date;
    }

    public void setBegin_date(String begin_date) {
        this.begin_date = begin_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getVisit_result() {
        return visit_result;
    }

    public void setVisit_result(String visit_result) {
        this.visit_result = visit_result;
    }

    @Override
    public String toString() {
        return "Visitor{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sno='" + sno + '\'' +
                ", phone='" + phone + '\'' +
                ", place='" + place + '\'' +
                ", begin_date='" + begin_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", visit_result='" + visit_result + '\'' +
                '}';
    }
}
