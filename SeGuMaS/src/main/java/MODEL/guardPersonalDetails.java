/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

import java.io.InputStream;
import MODEL.site;

/**
 *
 * @author edrag
 */
public class guardPersonalDetails {

    private int id;
    private String guardID;
    private Integer siteID;
    private InputStream img;
    private String base64Img;
    private String guardSalary;
    private String guardName;
    private String guardICNO;
    private String guardAddress;
    private String guardPhoneNo;
    private String nationality;
    private String guardDOB;
    private String guardPOB;
    private String guardEPFNo;
    private String religion;
    private String guardGender;
    private String guardSocsoNo;
    private String guardRace;
    private String guardAccNo;
    private String guardNOB;
    private String guardStatus;
    private String dateWorkStart;
    private String dateContractEnd;
    private String siteName;
    private String siteAddress;
    

    public guardPersonalDetails(String guardID, InputStream img, String guardSalary, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String nationality, String guardDOB, String guardPOB, String guardEPFNo, String religion, String guardGender, String guardSocsoNo, String guardRace, String guardAccNo, String guardNOB, String guardStatus, String dateWorkStart, String dateContractEnd) {
        this.guardID = guardID;
        this.img = img;
        this.guardSalary = guardSalary;
        this.guardName = guardName;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.nationality = nationality;
        this.guardDOB = guardDOB;
        this.guardPOB = guardPOB;
        this.guardEPFNo = guardEPFNo;
        this.religion = religion;
        this.guardGender = guardGender;
        this.guardSocsoNo = guardSocsoNo;
        this.guardRace = guardRace;
        this.guardAccNo = guardAccNo;
        this.guardNOB = guardNOB;
        this.guardStatus = guardStatus;
        this.dateWorkStart = dateWorkStart;
        this.dateContractEnd = dateContractEnd;
    }

    public guardPersonalDetails(String guardID, String guardSalary, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String nationality, String guardDOB, String guardPOB, String guardEPFNo, String religion, String guardGender, String guardSocsoNo, String guardRace, String guardAccNo, String guardNOB, String guardStatus, String dateWorkStart, String dateContractEnd) {
        this.guardID = guardID;
        this.guardSalary = guardSalary;
        this.guardName = guardName;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.nationality = nationality;
        this.guardDOB = guardDOB;
        this.guardPOB = guardPOB;
        this.guardEPFNo = guardEPFNo;
        this.religion = religion;
        this.guardGender = guardGender;
        this.guardSocsoNo = guardSocsoNo;
        this.guardRace = guardRace;
        this.guardAccNo = guardAccNo;
        this.guardNOB = guardNOB;
        this.guardStatus = guardStatus;
        this.dateWorkStart = dateWorkStart;
        this.dateContractEnd = dateContractEnd;
    }

    public guardPersonalDetails(String guardID, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String nationality, String guardDOB, String guardPOB, String guardEPFNo, String religion, String guardGender, String guardSocsoNo, String guardRace, String guardAccNo, String guardNOB) {
        this.guardID = guardID;
        this.guardName = guardName;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.nationality = nationality;
        this.guardDOB = guardDOB;
        this.guardPOB = guardPOB;
        this.guardEPFNo = guardEPFNo;
        this.religion = religion;
        this.guardGender = guardGender;
        this.guardSocsoNo = guardSocsoNo;
        this.guardRace = guardRace;
        this.guardAccNo = guardAccNo;
        this.guardNOB = guardNOB;
    }

    public guardPersonalDetails(String guardID, Integer siteID, String base64Img, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String guardStatus) {
        this.guardID = guardID;
        this.siteID = siteID;
        this.guardName = guardName;
        this.base64Img = base64Img;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.guardStatus = guardStatus;
    }

    public guardPersonalDetails(String guardID, String base64Img, String guardSalary, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String nationality, String guardDOB, String guardPOB, String guardEPFNo, String religion, String guardGender, String guardSocsoNo, String guardRace, String guardAccNo, String guardNOB, String guardStatus, String dateWorkStart, String dateContractEnd) {
        this.guardID = guardID;
        this.base64Img = base64Img;
        this.guardSalary = guardSalary;
        this.guardName = guardName;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.nationality = nationality;
        this.guardDOB = guardDOB;
        this.guardPOB = guardPOB;
        this.guardEPFNo = guardEPFNo;
        this.religion = religion;
        this.guardGender = guardGender;
        this.guardSocsoNo = guardSocsoNo;
        this.guardRace = guardRace;
        this.guardAccNo = guardAccNo;
        this.guardNOB = guardNOB;
        this.guardStatus = guardStatus;
        this.dateWorkStart = dateWorkStart;
        this.dateContractEnd = dateContractEnd;
    }

    public guardPersonalDetails(String guardID, Integer siteID) {
        this.guardID = guardID;
        this.siteID = siteID;
    }

    public guardPersonalDetails(String guardID, Integer siteID, String base64Img, String guardName, String guardICNO, String guardAddress, String guardPhoneNo, String guardStatus, String siteName, String siteAddress) {
        this.guardID = guardID;
        this.siteID = siteID;
        this.base64Img = base64Img;
        this.guardName = guardName;
        this.guardICNO = guardICNO;
        this.guardAddress = guardAddress;
        this.guardPhoneNo = guardPhoneNo;
        this.guardStatus = guardStatus;
        this.siteName = siteName;
        this.siteAddress = siteAddress;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public Integer getSiteID() {
        return siteID;
    }

    public void setSiteID(Integer siteID) {
        this.siteID = siteID;
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

    public String getGuardName() {
        return guardName;
    }

    public void setGuardName(String guardName) {
        this.guardName = guardName;
    }

    public String getGuardICNO() {
        return guardICNO;
    }

    public void setGuardICNO(String guardICNO) {
        this.guardICNO = guardICNO;
    }

    public String getGuardAddress() {
        return guardAddress;
    }

    public void setGuardAddress(String guardAddress) {
        this.guardAddress = guardAddress;
    }

    public String getGuardPhoneNo() {
        return guardPhoneNo;
    }

    public void setGuardPhoneNo(String guardPhoneNo) {
        this.guardPhoneNo = guardPhoneNo;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getGuardDOB() {
        return guardDOB;
    }

    public void setGuardDOB(String guardDOB) {
        this.guardDOB = guardDOB;
    }

    public String getGuardPOB() {
        return guardPOB;
    }

    public void setGuardPOB(String guardPOB) {
        this.guardPOB = guardPOB;
    }

    public String getGuardEPFNo() {
        return guardEPFNo;
    }

    public void setGuardEPFNo(String guardEPFNo) {
        this.guardEPFNo = guardEPFNo;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getGuardGender() {
        return guardGender;
    }

    public void setGuardGender(String guardGender) {
        this.guardGender = guardGender;
    }

    public String getGuardSocsoNo() {
        return guardSocsoNo;
    }

    public void setGuardSocsoNo(String guardSocsoNo) {
        this.guardSocsoNo = guardSocsoNo;
    }

    public String getGuardRace() {
        return guardRace;
    }

    public void setGuardRace(String guardRace) {
        this.guardRace = guardRace;
    }

    public String getGuardAccNo() {
        return guardAccNo;
    }

    public void setGuardAccNo(String guardAccNo) {
        this.guardAccNo = guardAccNo;
    }

    public String getGuardNOB() {
        return guardNOB;
    }

    public void setGuardNOB(String guardNOB) {
        this.guardNOB = guardNOB;
    }

    public String getGuardSalary() {
        return guardSalary;
    }

    public void setGuardSalary(String guardSalary) {
        this.guardSalary = guardSalary;
    }

    public String getGuardStatus() {
        return guardStatus;
    }

    public void setGuardStatus(String guardStatus) {
        this.guardStatus = guardStatus;
    }

    public String getDateWorkStart() {
        return dateWorkStart;
    }

    public void setDateWorkStart(String dateWorkStart) {
        this.dateWorkStart = dateWorkStart;
    }

    public String getDateContractEnd() {
        return dateContractEnd;
    }

    public void setDateContractEnd(String dateContractEnd) {
        this.dateContractEnd = dateContractEnd;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteAddress() {
        return siteAddress;
    }

    public void setSiteAddress(String siteAddress) {
        this.siteAddress = siteAddress;
    }
    
    
}
