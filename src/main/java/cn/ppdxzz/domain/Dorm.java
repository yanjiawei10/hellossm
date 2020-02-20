package cn.ppdxzz.domain;

import java.io.Serializable;

/**
 * Description:宿舍实体类
 *
 * @Date: 2020/2/19 17:51
 * @Author: PeiChen
 */
public class Dorm implements Serializable {
    private Integer id;//ID
    private String dorm_id;//宿舍号
    private String dorm_intro;//宿舍简介
    private String dorm_rps;//宿舍荣誉
    private String dorm_leader;//宿舍长
    private String teacher;//管辖育人导师

    public Dorm() {
    }

    public Dorm(Integer id, String dorm_id, String dorm_intro, String dorm_rps, String dorm_leader, String teacher) {
        this.id = id;
        this.dorm_id = dorm_id;
        this.dorm_intro = dorm_intro;
        this.dorm_rps = dorm_rps;
        this.dorm_leader = dorm_leader;
        this.teacher = teacher;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDorm_id() {
        return dorm_id;
    }

    public void setDorm_id(String dorm_id) {
        this.dorm_id = dorm_id;
    }

    public String getDorm_intro() {
        return dorm_intro;
    }

    public void setDorm_intro(String dorm_intro) {
        this.dorm_intro = dorm_intro;
    }

    public String getDorm_rps() {
        return dorm_rps;
    }

    public void setDorm_rps(String dorm_rps) {
        this.dorm_rps = dorm_rps;
    }

    public String getDorm_leader() {
        return dorm_leader;
    }

    public void setDorm_leader(String dorm_leader) {
        this.dorm_leader = dorm_leader;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    @Override
    public String toString() {
        return "Dorm{" +
                "id=" + id +
                ", dorm_id='" + dorm_id + '\'' +
                ", dorm_intro='" + dorm_intro + '\'' +
                ", dorm_rps='" + dorm_rps + '\'' +
                ", dorm_leader='" + dorm_leader + '\'' +
                ", teacher='" + teacher + '\'' +
                '}';
    }
}
