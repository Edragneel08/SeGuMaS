/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class guardExArmyOrPolice {
    
    private String guardID;
    private String exArmyOrPolice;
    private String guardServiceNo;
    private String guardPosition;
    private String dateStart;
    private String dateTo;
    private String guardBranch;
    private String guardRFLPA;

    public guardExArmyOrPolice(String guardID, String exArmyOrPolice, String guardServiceNo, String guardPosition, String dateStart, String dateTo, String guardBranch, String guardRFLPA) {
        this.guardID = guardID;
        this.exArmyOrPolice = exArmyOrPolice;
        this.guardServiceNo = guardServiceNo;
        this.guardPosition = guardPosition;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
        this.guardBranch = guardBranch;
        this.guardRFLPA = guardRFLPA;
    }

    public String getGuardID() {
        return guardID;
    }

    public void setGuardID(String guardID) {
        this.guardID = guardID;
    }

    public String getExArmyOrPolice() {
        return exArmyOrPolice;
    }

    public void setExArmyOrPolice(String exArmyOrPolice) {
        this.exArmyOrPolice = exArmyOrPolice;
    }

    public String getGuardServiceNo() {
        return guardServiceNo;
    }

    public void setGuardServiceNo(String guardServiceNo) {
        this.guardServiceNo = guardServiceNo;
    }

    public String getGuardPosition() {
        return guardPosition;
    }

    public void setGuardPosition(String guardPosition) {
        this.guardPosition = guardPosition;
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

    public String getGuardBranch() {
        return guardBranch;
    }

    public void setGuardBranch(String guardBranch) {
        this.guardBranch = guardBranch;
    }

    public String getGuardRFLPA() {
        return guardRFLPA;
    }

    public void setGuardRFLPA(String guardRFLPA) {
        this.guardRFLPA = guardRFLPA;
    }
    
    
    
}
