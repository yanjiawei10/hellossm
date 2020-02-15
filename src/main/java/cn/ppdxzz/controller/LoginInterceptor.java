package cn.ppdxzz.controller;

import cn.ppdxzz.domain.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Description:
 *
 * @Date: 2020/2/14 16:50
 * @Author: PeiChen
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        // URL:除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.toLowerCase().indexOf("login")>=0){
            return true;
        }
        HttpSession session = request.getSession();
        // 获取Session中的用户登录信息
        Admin admin = (Admin) session.getAttribute("adminInfo");
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if(admin != null){
            return true;
        }
        // 地址栏不符合条件的直接重定向到登录页面
        response.sendRedirect("/hellossm/to_login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
