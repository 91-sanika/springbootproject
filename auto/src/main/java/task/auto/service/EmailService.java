package task.auto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import task.auto.entity.Student;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendStatusEmail(Student student) {
        String subject = "Update on Your Course Registration";
        String messageBody = "Dear " + student.getName() + ",\n\n";

        switch (student.getStatus()) {
            case "APPROVED":
                messageBody += "Congratulations! Your registration for the course '" + student.getCourse() + "' has been APPROVED.";
                break;
            case "REJECTED":
                messageBody += "We're sorry to inform you that your registration for the course '" + student.getCourse() + "' has been REJECTED.";
                break;
            case "PENDING":
                messageBody += "Your registration for the course '" + student.getCourse() + "' is currently in PENDING status.";
                break;
            default:
                messageBody += "Your registration status is: " + student.getStatus();
                break;
        }

        messageBody += "\n\nThank you!\nAdmin Team";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(student.getEmail());
        message.setSubject(subject);
        message.setText(messageBody);

        mailSender.send(message);
    }

   

}


