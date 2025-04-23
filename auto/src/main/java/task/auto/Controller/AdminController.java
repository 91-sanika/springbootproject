package task.auto.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import task.auto.service.StudentService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StudentService service;
    
    @GetMapping("")
    public String adminRoot() {
        return "redirect:/admin/pending";
    }


    @GetMapping("/pending")
    public String viewPending(Model model) {
        model.addAttribute("students", service.getPendingStudents());
        return "pending";
    }

    @GetMapping("/approve/{id}")
    public String approve(@PathVariable Long id) {
        service.approveStudent(id);
        return "redirect:/admin/pending";
    }



    @GetMapping("/reject/{id}")
    public String reject(@PathVariable Long id) {
        service.rejectStudent(id);
        return "redirect:/admin/pending";
    }
}

