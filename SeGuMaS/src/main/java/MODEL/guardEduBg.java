/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class guardEduBg {
    private int id;
    private String guardID;
    private String school;
    private String state;
    private String dateStart;
    private String dateTo;



    public guardEduBg(int id, String guardID, String school, String state, String dateStart, String dateTo) {
        this.id = id;
        this.guardID = guardID;
        this.school = school;
        this.state = state;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
    }
    
        public guardEduBg(String guardID, String school, String state, String dateStart, String dateTo) {
        this.guardID = guardID;
        this.school = school;
        this.state = state;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
    }

    public guardEduBg(int id, String school, String state, String dateStart, String dateTo) {
        this.id = id;
        this.school = school;
        this.state = state;
        this.dateStart = dateStart;
        this.dateTo = dateTo;
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

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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
    
    
}
