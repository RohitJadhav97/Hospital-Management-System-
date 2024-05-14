package com.hospital.dashbord.models;

import jakarta.persistence.*;

@Entity
public class Appointment {
    @Id
    @GeneratedValue
    private int id;
    @ManyToOne(targetEntity = Users.class,cascade = CascadeType.ALL)
    private  Users user;
    private String fullName;
    private String gender;
    private int age;
    private String appointmentDate;
//    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private String phoneNo;
    private String disease;
    @ManyToOne(targetEntity = Doctors.class, cascade = CascadeType.ALL)
    private Doctors doctor;
    private String address;
    private String status;


    public Appointment() {
    }

    public Appointment(String fullName, String gender, int age, String appointmentDate, String email, String phoneNo, String disease, String address,String status) {
//        this.user = user;
        this.fullName = fullName;
        this.gender = gender;
        this.age = age;
        this.appointmentDate = appointmentDate;
        this.email = email;
        this.phoneNo = phoneNo;
        this.disease = disease;
//        this.doctor = doctor;
        this.address = address;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id=" + id +
                ", user=" + user +
                ", fullName='" + fullName + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", appointmentDate='" + appointmentDate + '\'' +
                ", email='" + email + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                ", disease='" + disease + '\'' +
                ", doctor=" + doctor +
                ", status='" + status + '\'' +
                '}';
    }
}
