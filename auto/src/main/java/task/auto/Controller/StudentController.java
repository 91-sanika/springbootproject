package task.auto.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import task.auto.entity.Student;
import task.auto.service.StudentService;

@Controller
public class StudentController {

    @Autowired
    private StudentService service;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("students", service.getAllStudents());
        return "home";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("student", new Student());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Student student) {
        student.setStatus("PENDING");
        service.registerStudent(student);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("student", service.getStudentById(id));
        return "edit";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Student student) {
        service.updateStudent(student);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        service.deleteStudent(id);
        return "redirect:/";
    }

    @PostMapping("/submitStudent")
    public String submitStudent(@RequestParam("status") String inputStatus, Model model) {
        String status = inputStatus.toUpperCase();

        if (status.equals("PENDING") || status.equals("APPROVED") || status.equals("REJECTED")) {
            Student student = new Student();
            student.setStatus(status);
            service.registerStudent(student);

            model.addAttribute("message", "Student registered successfully with status: " + status);
            return "success";
        } else {
            model.addAttribute("error", "Invalid status value: " + inputStatus);
            return "error";
        }
    }
}

