package com.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EncodingFilter implements Filter {

    private String charset;

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        String uri;

        if(request instanceof HttpServletRequest) {

            HttpServletRequest req = (HttpServletRequest)request;

            uri = req.getRequestURI();

            if(req.getMethod().equalsIgnoreCase("POST")) {

                if(uri.indexOf("abcd.do")!=-1) {
                    req.setCharacterEncoding("euc-kr");
                }else {
                    req.setCharacterEncoding(charset);
                }
            }

        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        charset = filterConfig.getInitParameter("charset");

        if(charset == null) {
            charset = "UTF-8";
        }

    }



}
