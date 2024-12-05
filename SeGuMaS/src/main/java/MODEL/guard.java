/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class guard {

    private String guardID;
    private String guardName;	
    private int guardAge;
    private String guardGender;	
    private String guardPhoneNo; 
    private String guardEmail;	
    private String nationality; 
    private String guardRace;	
    private double guardSalary;
    private String guardDOB;	
    private String branchID; 
    private String siteID;

    public guard(String guardID, String guardName, int guardAge, String guardGender, String guardPhoneNo, String guardEmail, String nationality, String guardRace, double guardSalary, String guardDOB, String branchID, String siteID) {
        this.guardID = guardID;
        this.guardName = guardName;
        this.guardAge = guardAge;
        this.guardGender = guardGender;
        this.guardPhoneNo = guardPhoneNo;
        this.guardEmail = guardEmail;
        this.nationality = nationality;
        this.guardRace = guardRace;
        this.guardSalary = guardSalary;
        this.guardDOB = guardDOB;
        this.branchID = branchID;
        this.siteID = siteID;
    }

    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public String getGuardName() {
        return guardName;
    }

    public void setGuardName(String guardName) {
        this.guardName = guardName;
    }

    public int getGuardAge() {
        return guardAge;
    }

    public void setGuardAge(int guardAge) {
        this.guardAge = guardAge;
    }

    public String getGuardGender() {
        return guardGender;
    }

    public void setGuardGender(String guardGender) {
        this.guardGender = guardGender;
    }

    public String getGuardPhoneNo() {
        return guardPhoneNo;
    }

    public void setGuardPhoneNo(String guardPhoneNo) {
        this.guardPhoneNo = guardPhoneNo;
    }

    public String getGuardEmail() {
        return guardEmail;
    }

    public void setGuardEmail(String guardEmail) {
        this.guardEmail = guardEmail;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getGuardRace() {
        return guardRace;
    }

    public void setGuardRace(String guardRace) {
        this.guardRace = guardRace;
    }

    public double getGuardSalary() {
        return guardSalary;
    }

    public void setGuardSalary(double guardSalary) {
        this.guardSalary = guardSalary;
    }

    public String getGuardDOB() {
        return guardDOB;
    }

    public void setGuardDOB(String guardDOB) {
        this.guardDOB = guardDOB;
    }

    public String getBranchID() {
        return branchID;
    }

    public void setBranchID(String branchID) {
        this.branchID = branchID;
    }

    public String getSiteID() {
        return siteID;
    }

    public void setSiteID(String siteID) {
        this.siteID = siteID;
    }
}
