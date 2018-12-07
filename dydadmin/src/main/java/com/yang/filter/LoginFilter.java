package com.yang.filter;

import com.yang.model.Admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class LoginFilter implements Filter {

    String passUrl = "";

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        passUrl = arg0.getInitParameter("passUrl");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String[] strArray = passUrl.split(";");

        for (String str : strArray) {
            if (str.equals(""))
                continue;
            if (httpRequest.getRequestURL().indexOf(str) >= 0) {
                chain.doFilter(request, response);
                return;
            }
        }

        HttpSession session = httpRequest.getSession();
        if (session.getAttribute("admin") != null) {
            ServletContext application = session.getServletContext();
            Admin admin = (Admin) session.getAttribute("admin");
            Map<String,String> map =(Map<String, String>) application.getAttribute("listAdminSession");
            if(map.get(Integer.toString(admin.getAid()))==session.getId()) {
                chain.doFilter(request, response);
            }else {
                session.invalidate();
                httpResponse.sendRedirect("/dydadmin/login");
            }
        } else {
            httpResponse.sendRedirect("/dydadmin/login");
        }
    }

    @Override
    public void destroy() {

    }
}
