package task.auto.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import task.auto.entity.Student;
import task.auto.repo.StudentRepository;

@Service
@Transactional
public class StudentService {

    @Autowired
    private StudentRepository repo;
    
    @Autowired
    private EmailService emailService;


    public Student registerStudent(Student student) {
        if (student != null) {
            student.setStatus("PENDING");
        }
        Student savedStudent = repo.save(student);
        emailService.sendStatusEmail(savedStudent);
        return savedStudent;
    }

    public List<Student> getAllStudents() {
        return repo.findAll();
    }

    public List<Student> getPendingStudents() {
        return repo.findByStatus("PENDING");
    }

    public Student getStudentById(Long id) {
        return repo.findById(id).orElse(null);
    }

    @Transactional
    public void updateStudent(Student student) {
        repo.save(student);
        repo.flush();
    }

    public void deleteStudent(Long id) {
        repo.deleteById(id);
    }

    public void approveStudent(Long id) {
        Student student = getStudentById(id);
        if (student != null) {
            student.setStatus("APPROVED");
            repo.save(student);
            emailService.sendStatusEmail(student);
        }
    }


    public void rejectStudent(Long id) {
        Student student = getStudentById(id);
        if (student != null) {
            student.setStatus("REJECTED");
            repo.save(student);
            emailService.sendStatusEmail(student);
        }
    }
}


