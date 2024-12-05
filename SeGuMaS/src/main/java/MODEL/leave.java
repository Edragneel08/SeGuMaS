/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class leave {

    private int leaveID;
    private String guardID;
    private String guardName;
    private String leaveType;
    private String startDate;
    private String endDate;
    private String reason;
    private String status;
    private int count;

    public leave(int leaveID, String guardID, String guardName, String leaveType, String startDate, String endDate, String reason, String status) {
        this.leaveID = leaveID;
        this.guardID = guardID;
        this.guardName = guardName;
        this.leaveType = leaveType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.status = status;
    }

    public leave(int leaveID, String status) {
        this.leaveID = leaveID;
        this.status = status;
    }
    
    

    public leave(int leaveID, String leaveType, String startDate, String endDate, String reason) {
        this.leaveID = leaveID;
        this.leaveType = leaveType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
    }

    public leave(int leaveID, String guardID, String guardName, String leaveType, String startDate, String endDate, String reason) {
        this.leaveID = leaveID;
        this.guardID = guardID;
        this.guardName = guardName;
        this.leaveType = leaveType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
    }

    public leave(String status, int count) {
        this.status = status;
        this.count = count;
    }

    public int getLeaveID() {
        return leaveID;
    }

    public void setLeaveID(int leaveID) {
        this.leaveID = leaveID;
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

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
}
