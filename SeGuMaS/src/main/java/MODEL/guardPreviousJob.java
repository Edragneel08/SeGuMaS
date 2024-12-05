/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class guardPreviousJob {

    private int prevJobId;
    private String guardID;
    private String employerName;
    private String positionHeld;
    private String dateStart;
    private String dateTo;
    private String EA;
    private String RoL;

    public guardPreviousJob(String guardID, String employerName, String positionHeld, String dateStart, String dateTo, String EA, String RoL) {
        this.guardID = guardID;
        this.employerName = employerName;
        this.positionHeld = positionHeld;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
        this.EA = EA;
        this.RoL = RoL;
    }

    public guardPreviousJob(int prevJobId, String guardID, String employerName, String positionHeld, String dateStart, String dateTo, String EA, String RoL) {
        this.prevJobId = prevJobId;
        this.guardID = guardID;
        this.employerName = employerName;
        this.positionHeld = positionHeld;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
        this.EA = EA;
        this.RoL = RoL;
    }  

    public guardPreviousJob(int prevJobId, String employerName, String positionHeld, String dateStart, String dateTo, String EA) {
        this.prevJobId = prevJobId;
        this.employerName = employerName;
        this.positionHeld = positionHeld;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
        this.EA = EA;
    }
    
    

    public int getPrevJobId() {
        return prevJobId;
    }

    public void setPrevJobId(int prevJobId) {
        this.prevJobId = prevJobId;
    }

    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public String getEmployerName() {
        return employerName;
    }

    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    public String getPositionHeld() {
        return positionHeld;
    }

    public void setPositionHeld(String positionHeld) {
        this.positionHeld = positionHeld;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    public String getEA() {
        return EA;
    }

    public void setEA(String EA) {
        this.EA = EA;
    }

    public String getRoL() {
        return RoL;
    }

    public void setRoL(String RoL) {
        this.RoL = RoL;
    }

}
