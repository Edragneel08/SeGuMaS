/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class guardReference {
    
    private String guardID;
    private String guardReferName;
    private String guardReferJob;
    private String guardReferAddress;
    private String guardReferRelation;
    private String guardReferPhoneNo;

    public guardReference(String guardID, String guardReferName, String guardReferJob, String guardReferAddress, String guardReferRelation, String guardReferPhoneNo) {
        this.guardID = guardID;
        this.guardReferName = guardReferName;
        this.guardReferJob = guardReferJob;
        this.guardReferAddress = guardReferAddress;
        this.guardReferRelation = guardReferRelation;
        this.guardReferPhoneNo = guardReferPhoneNo;
    }
    
    
    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public String getGuardReferName() {
        return guardReferName;
    }

    public void setGuardReferName(String guardReferName) {
        this.guardReferName = guardReferName;
    }

    public String getGuardReferJob() {
        return guardReferJob;
    }

    public void setGuardReferJob(String guardReferJob) {
        this.guardReferJob = guardReferJob;
    }

    public String getGuardReferAddress() {
        return guardReferAddress;
    }

    public void setGuardReferAddress(String guardReferAddress) {
        this.guardReferAddress = guardReferAddress;
    }

    public String getGuardReferRelation() {
        return guardReferRelation;
    }

    public void setGuardReferRelation(String guardReferRelation) {
        this.guardReferRelation = guardReferRelation;
    }

    public String getGuardReferPhoneNo() {
        return guardReferPhoneNo;
    }

    public void setGuardReferPhoneNo(String guardReferPhoneNo) {
        this.guardReferPhoneNo = guardReferPhoneNo;
    }
}
