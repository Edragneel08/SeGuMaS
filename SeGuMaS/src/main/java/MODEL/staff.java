/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

/**
 *
 * @author edrag
 */
public class staff {

    private String staffID;
    private String SID;
    private String ICNO;
    private String noPhone;
    private InputStream img;
    private String base64Img;
    private String email;
    private String fullname;
    private String username;
    private String password;

    public staff(String staffID, String SID, String ICNO, String noPhone, String base64Img, String email, String fullname, String username, String password) {
        this.staffID = staffID;
        this.SID = SID;
        this.ICNO = ICNO;
        this.noPhone = noPhone;
        this.base64Img = base64Img;
        this.email = email;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
    }

    public staff(String staffID, String SID, String ICNO, String noPhone, InputStream img, String email, String fullname, String username, String password) {
        this.staffID = staffID;
        this.SID = SID;
        this.ICNO = ICNO;
        this.noPhone = noPhone;
        this.img = img;
        this.email = email;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
    }

    public staff(String staffID, String fullname, String username, String password) {
        this.staffID = staffID;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
    }

    public staff(String staffID, String SID, String fullname, String username, String password) {
        this.staffID = staffID;
        this.SID = SID;
        this.fullname = fullname;
        this.username = username;
        this.password = password;
    }

    public String getSID() {
        return SID;
    }

    public void setSID(String SID) {
        this.SID = SID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getICNO() {
        return ICNO;
    }

    public void setICNO(String ICNO) {
        this.ICNO = ICNO;
    }

    public String getNoPhone() {
        return noPhone;
    }

    public void setNoPhone(String noPhone) {
        this.noPhone = noPhone;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public String getBase64Img() {
        return base64Img;
    }

    public void setBase64Img(String base64Img) {
        this.base64Img = base64Img;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
