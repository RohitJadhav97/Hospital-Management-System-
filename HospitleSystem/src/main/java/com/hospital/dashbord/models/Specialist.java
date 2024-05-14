package com.hospital.dashbord.models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Specialist {
    @Id
    @GeneratedValue
    private int id;
    @Column(unique = true)
    private String specialization;

    public Specialist() {
    }

    public Specialist(String specialization) {
        this.specialization = specialization;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    @Override
    public String toString() {
        return "Specialist{" +
                "id=" + id +
                ", specialization='" + specialization + '\'' +
                '}';
    }

}
