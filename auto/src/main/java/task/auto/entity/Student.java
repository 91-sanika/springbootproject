package task.auto.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="autoflow_student")
public class Student {
	
    public Student(Long id, String name, String email, String contactno, String course, String status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.contactno = contactno;
		this.course = course;
		this.status = status;
	}

	public Student() {
		super();
	}


	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
    private Long id;

     @Column(name="name")
     private String name;
	
     @Column(name="email")
    private String email;
	
	@Column(name="contactno")
    private String contactno;
	
	@Column(name="course")
    private String course;

    @Column(name = "status")
    private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contactno;
	}

	

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email + ", contactno=" + contactno + ", course="
				+ course + ", status=" + status + "]";
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}




    
}
