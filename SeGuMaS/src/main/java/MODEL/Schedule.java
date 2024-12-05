/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class Schedule {

    private String guardID;
    private int siteID;
    private String staffName;
    private String siteName;
    private String startDate;
    private String endDate;
    private String shift;

    public Schedule(String guardID, int siteID, String startDate, String endDate, String shift) {
        this.guardID = guardID;
        this.siteID = siteID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.shift = shift;
    }

    public Schedule(String staffName, String siteName, String startDate, String endDate, String shift) {
        this.staffName = staffName;
        this.siteName = siteName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.shift = shift;
    }
    
    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public int getSiteID() {
        return siteID;
    }

    // Getters and Setters
    public void setSiteID(int siteID) {    
        this.siteID = siteID;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }
}
