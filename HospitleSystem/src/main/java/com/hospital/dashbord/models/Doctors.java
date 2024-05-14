package com.hospital.dashbord.models;

import com.hospital.dashbord.dao.Database;
import jakarta.persistence.*;

@Entity
public class Doctors {
    @Id
    @GeneratedValue
    private int id;
    private  String fullName;
    private String dob;
    private String qualification;
    private String specilalist;
    private String email;
    private String  mobno;
    private String password;


    public Doctors() {

    }

    public Doctors(String fullName, String dob, String qualification, String specilalist, String email, String mobno, String password) {
        this.fullName = fullName;
        this.dob = dob;
        this.qualification = qualification;
        this.specilalist = specilalist;
        this.email = email;
        this.mobno = mobno;
        this.password = password;
    }

//    public Doctors(String fullName, String dob, String qualification, String specilalist, String email, String mobno, String password , DateAndTimeSlots dateAndTimeSlots) {
//        this.fullName = fullName;
//        this.dob = dob;
//        this.qualification = qualification;
//        this.specilalist = specilalist;
//        this.email = email;
//        this.mobno = mobno;
//        this.password = password;
//        this.dateAndTimeSlots =  dateAndTimeSlots;
//    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecilalist() {
        return specilalist;
    }

    public void setSpecilalist(String specilalist) {
        this.specilalist = specilalist;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobno() {
        return mobno;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Override
    public String toString() {
        return "Doctors{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", dob='" + dob + '\'' +
                ", qualification='" + qualification + '\'' +
                ", specilalist='" + specilalist + '\'' +
                ", email='" + email + '\'' +
                ", mobno='" + mobno + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
