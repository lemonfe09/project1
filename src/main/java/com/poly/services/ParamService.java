package com.poly.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ParamService {

    @Autowired
    private HttpServletRequest request;

    public String getString(String name, String defaultValue) {
        String value = request.getParameter(name);
        return value != null ? value : defaultValue;
    }

    public int getInt(String name, int defaultValue) {
        String value = request.getParameter(name);
        try {
            return value != null ? Integer.parseInt(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public double getDouble(String name, double defaultValue) {
        String value = request.getParameter(name);
        try {
            return value != null ? Double.parseDouble(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public boolean getBoolean(String name, boolean defaultValue) {
        String value = request.getParameter(name);
        return value != null ? Boolean.parseBoolean(value) : defaultValue;
    }

    public Date getDate(String name, String pattern) {
        String value = request.getParameter(name);
        if (value != null) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                return sdf.parse(value);
            } catch (ParseException e) {
                throw new RuntimeException("Invalid date format", e);
            }
        }
        return null;
    }

    public File save(MultipartFile file, String path) throws IllegalStateException, IOException {
    	 if (file != null && !file.isEmpty()) {
             String realPath = request.getServletContext().getRealPath(path);
             File dir = new File(realPath);
             if (!dir.exists()) {
                 dir.mkdirs();
             }
             File savedFile = new File(dir, file.getOriginalFilename());
             file.transferTo(savedFile);
             return savedFile;
         }
         return null;
    }
}
