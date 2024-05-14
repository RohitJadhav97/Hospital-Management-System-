//package com.hospital.dashbord.models;
//
//import com.hospital.dashbord.dao.Database;
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.Id;
//
//@Entity
//public class DateAndTimeSlots {
//    @Id
//    @GeneratedValue
//    private int id;
//    @Column(unique = true)
//    private String appointmentDate;
//    private int t1;
//    private int t2;
//    private int t3;
//    private int t4;
//    private int t5;
//    private int t6;
//    private int t7;
//    private int t8;
//
//    public DateAndTimeSlots() {
////        Database database = new Database();
////        database.setDateTimeSlots();
//    }
//
//    public DateAndTimeSlots(String appointmentDate, int t1, int t2, int t3, int t4, int t5, int t6, int t7, int t8) {
//        this.appointmentDate = appointmentDate;
//        this.t1 = t1;
//        this.t2 = t2;
//        this.t3 = t3;
//        this.t4 = t4;
//        this.t5 = t5;
//        this.t6 = t6;
//        this.t7 = t7;
//        this.t8 = t8;
//    }
//
//    public String getAppointmentDate() {
//        return appointmentDate;
//    }
//
//    public void setAppointmentDate(String appointmentDate) {
//        this.appointmentDate = appointmentDate;
//    }
//
//    public int getT1() {
//        return t1;
//    }
//
//    public void setT1(int t1) {
//        this.t1 = t1;
//    }
//
//    public int getT2() {
//        return t2;
//    }
//
//    public void setT2(int t2) {
//        this.t2 = t2;
//    }
//
//    public int getT3() {
//        return t3;
//    }
//
//    public void setT3(int t3) {
//        this.t3 = t3;
//    }
//
//    public int getT4() {
//        return t4;
//    }
//
//    public void setT4(int t4) {
//        this.t4 = t4;
//    }
//
//    public int getT5() {
//        return t5;
//    }
//
//    public void setT5(int t5) {
//        this.t5 = t5;
//    }
//
//    public int getT6() {
//        return t6;
//    }
//
//    public void setT6(int t6) {
//        this.t6 = t6;
//    }
//
//    public int getT7() {
//        return t7;
//    }
//
//    public void setT7(int t7) {
//        this.t7 = t7;
//    }
//
//    public int getT8() {
//        return t8;
//    }
//
//    public void setT8(int t8) {
//        this.t8 = t8;
//    }
//}
