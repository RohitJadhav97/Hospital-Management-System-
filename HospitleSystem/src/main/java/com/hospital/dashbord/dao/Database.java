package com.hospital.dashbord.dao;

import com.hospital.dashbord.models.Appointment;
import com.hospital.dashbord.models.Doctors;
import com.hospital.dashbord.models.Specialist;
import com.hospital.dashbord.models.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import oracle.sql.DATE;

import java.util.ArrayList;
import java.util.List;

public class Database {
    private  EntityManagerFactory entityManagerFactory;
    private  EntityManager entityManager;

    public Database() {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
        entityManager = entityManagerFactory.createEntityManager();
    }

    public boolean userRegister (Users users){
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(users);
            entityManager.getTransaction().commit();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public Users getUser(String username){
        System.out.println("getUser Called"+username);
        Query query = entityManager.createQuery("select id from Users where userName =:username");
//        System.out.println("query Run");
        query.setParameter("username",username);
//        System.out.println("Parameter Set");
        List<Integer> list =  query.getResultList();
        Users user = null;
//        System.out.println(list);
        if(!(list.isEmpty())){
            user = entityManager.find(Users.class,list.get(0));
        }
        System.out.println(user);
        return user;
    }

    public boolean addSpecialist(Specialist specialist){
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(specialist);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public List getSpecialist(){
        Query query = entityManager.createQuery("select specialization from Specialist");
        List<String> list= query.getResultList();
        System.out.println(list);
        return list;
    }

    public boolean doctorRegister (Doctors doctor){
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(doctor);
            entityManager.getTransaction().commit();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public List<Doctors>getAllDoctors(){
        Query query = entityManager.createQuery("select id from Doctors");
        List list = query.getResultList();
        List<Doctors> doctorsList = new ArrayList<>();
        if(!(list.isEmpty())){
            for (Object id : list){
                 Doctors doctor = entityManager.find(Doctors.class,id);
                 doctorsList.add(doctor);
            }
        }
            return doctorsList;
    }

    public Doctors getDoctor(int id){
       try{
           Doctors doctor = entityManager.find(Doctors.class,id);
           return doctor;
       }catch (Exception e ){
           e.printStackTrace();
           return null;
       }
    }
    public boolean updateDoctor (Doctors doctor){

        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("update Doctors set fullName=:fn,dob=:db,qualification=:quli,specilalist=:spec,email=:emailId,mobno=:mob,password=:pass" +
                                                       " where id=:docId");
           query.setParameter("fn",doctor.getFullName());
           query.setParameter("db",doctor.getDob());
           query.setParameter("quli",doctor.getQualification());
           query.setParameter("spec",doctor.getSpecilalist());
           query.setParameter("emailId",doctor.getEmail());
           query.setParameter("mob",doctor.getMobno());
           query.setParameter("pass",doctor.getPassword());
            query.setParameter("docId",doctor.getId());
           int rowAffected = query.executeUpdate();
            System.out.println("rowAffected"+rowAffected);
            entityManager.getTransaction().commit();
            if(rowAffected>0){
                return true;
            }else {
                return false;
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteDoctor(Doctors doctor){
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("delete from Doctors where id=:docId");
            query.setParameter("docId",doctor.getId());
            int rowAffcted = query.executeUpdate();
            entityManager.getTransaction().commit();
            if(rowAffcted>0) {
                return true;
            }return false;
        }catch (Exception e ){
            e.printStackTrace();
            return false;
        }
    }
    public Doctors getDoctor(String username){
        try{
            Query query = entityManager.createQuery("select id from Doctors where email=:username");
            query.setParameter("username",username);
            List list = query.getResultList();
            int id =(int) list.get(0);
           return getDoctor(id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
//    public void setDateTimeSlots(){
//        DATE date = new DATE();
//        for(int i = 0 ; i<90;i++){
//         Query query =  entityManager.createQuery("insert into Appointment values(dt=:date+i,t1=:freeSlot,t2=:freeSlot,t3=:freeSlot,t4=:freeSlot,t5=:freeSlot,t6=:freeSlot,t7=:freeSlot,t8=:freeSlot");
//         query.setParameter("date",date);
//         query.setParameter("freeSlot",0);
//        }
//    }
    public boolean bookAppointment(Appointment appointment,Users user,Doctors doctor){
//        user = entityManager.find(Users.class,user.getId());
//        doctor = entityManager.find(Doctors.class,doctor.getId());
        try{

            entityManager.getTransaction().begin();
            appointment.setUser(user);
            appointment.setDoctor(doctor);
//            entityManager.persist(appointment);
            entityManager.merge(appointment);
            entityManager.getTransaction().commit();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public List<Appointment> getAllPatients(int doctorId){
//        System.out.println("getAllPatients called : "+doctorId);
        Doctors doctor = entityManager.find(Doctors.class,doctorId);
        List<Appointment> patientsList = new ArrayList<>();
//        System.out.println("doctor details"+doctor);
        try {
            Query query = entityManager.createQuery("select id from Appointment where doctor=:doc");
            query.setParameter("doc",doctor);
            List list =  query.getResultList();
//            System.out.println("QueryList : "+list);
            if(!(list.isEmpty())){
                for(Object id : list){
                    Appointment appointment = entityManager.find(Appointment.class,id);
                    patientsList.add(appointment);
                }
            }else {
                throw new RuntimeException();
            }
//            System.out.println("list before return"+patientsList);
            return patientsList;
        }catch(RuntimeException e ){
            e.printStackTrace();
//            System.out.println("list before return"+patientsList);
            return patientsList;
        }
    }
    public List<Appointment> getAllPatients(){
        List<Appointment> appointmentList = new ArrayList<>();
        try {
            Query query = entityManager.createQuery("select id from Appointment ");
            List list =  query.getResultList();
            if(!(list.isEmpty())){
                for(Object id : list){
                    Appointment appointment = entityManager.find(Appointment.class,id);
                    appointmentList.add(appointment);
                }
            }else {
                throw new RuntimeException();
            }
            return appointmentList;
        }catch(RuntimeException e ){
            e.printStackTrace();
            return appointmentList;
        }
    }

    public Appointment getAppointmentById(int id){
        try{
          Appointment appointment =   entityManager.find(Appointment.class,id);
          return appointment;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateStatus(int id,String comment){
        System.out.println(id+comment+"from databse ");
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("update Appointment set status=:comment where id=:apId");
            query.setParameter("comment",comment);
            query.setParameter("apId",id);
            int affectedRows =  query.executeUpdate();
            entityManager.getTransaction().commit();
            System.out.println("affected row"+affectedRows);
            if (affectedRows == 1){
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public int doctorCount(){
        int count = 0;
        try{
            Query query = entityManager.createQuery("from Doctors");
            List list = query.getResultList();
            for(Object doc : list ){
                count++;
            }
            return count;
        }catch(Exception e){
            e.printStackTrace();
            return count;
        }
    }
    public int appointmentCount(){
        int count = 0;
        try{
            Query query = entityManager.createQuery("from Appointment");
            List list = query.getResultList();
            for(Object ap : list ){
                count++;
            }
            return count;
        }catch(Exception e){
            e.printStackTrace();
            return count;
        }
    }
    public int userCount(){
        int count = 0;
        try{
            Query query = entityManager.createQuery("from Users");
            List list = query.getResultList();
            for(Object user : list ){
                count++;
            }
            return count;
        }catch(Exception e){
            e.printStackTrace();
            return count;
        }
    }
    public int specialistCount(){
        int count = 0;
        try{
            Query query = entityManager.createQuery("from Specialist");
            List list = query.getResultList();
            for(Object spec : list ){
                count++;
            }
            return count;
        }catch(Exception e){
            e.printStackTrace();
            return count;
        }
    }

    public boolean changeUserPassword(int id,String oldPass,String newPass){
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("update Users set password=:newPass where id=:userId and password=:oldPass");
            query.setParameter("newPass",newPass);
            query.setParameter("oldPass",oldPass);
            query.setParameter("userId",id);
            int affectedRows =  query.executeUpdate();
            entityManager.getTransaction().commit();
            System.out.println("affected row"+affectedRows);
            if (affectedRows == 1){
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean changeDoctorPassword(int id,String oldPass,String newPass){
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery("update Doctors set password=:newPass where id=:userId and password=:oldPass");
            query.setParameter("newPass",newPass);
            query.setParameter("oldPass",oldPass);
            query.setParameter("userId",id);
            int affectedRows =  query.executeUpdate();
            entityManager.getTransaction().commit();
            System.out.println("affected row"+affectedRows);
            if (affectedRows == 1){
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
