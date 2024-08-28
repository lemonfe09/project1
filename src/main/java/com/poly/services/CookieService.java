package com.poly.services;

import org.springframework.stereotype.Service;
import jakarta.servlet.http.Cookie;  // Import đúng thư viện jakarta.servlet.http.Cookie
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class CookieService {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    public Cookie get(String name) {
        Cookie[] cookies = request.getCookies();  // Sử dụng jakarta.servlet.http.Cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }

    // Phương thức lấy giá trị của cookie theo tên
    public String getValue(String name) {
        Cookie cookie = get(name);
        return cookie != null ? cookie.getValue() : "";
    }

    // Phương thức thêm cookie mới
    public Cookie add(String name, String value, int hours) {
        Cookie cookie = new Cookie(name, value);  // Sử dụng jakarta.servlet.http.Cookie
        cookie.setMaxAge(hours * 3600);
        cookie.setPath("/");
        response.addCookie(cookie);
        return cookie;
    }

    // Phương thức xóa cookie theo tên
    public void remove(String name) {
        Cookie cookie = new Cookie(name, "");  // Sử dụng jakarta.servlet.http.Cookie
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
