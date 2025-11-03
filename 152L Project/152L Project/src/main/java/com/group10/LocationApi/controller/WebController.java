package com.group10.LocationApi.controller;

import com.group10.LocationApi.model.Attendance;
import com.group10.LocationApi.model.Department;
import com.group10.LocationApi.model.Employee;
import com.group10.LocationApi.service.AttendanceService;
import com.group10.LocationApi.service.DepartmentService;
import com.group10.LocationApi.service.EmployeeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class WebController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private AttendanceService attendanceService;

    private boolean canAccess(HttpSession session) {
        Boolean fromList = (Boolean) session.getAttribute("fromList");
        if (fromList != null && fromList) {
            session.removeAttribute("fromList");
            return true;
        }
        return false;
    }

    // EMPLOYEES
    @GetMapping("/employees/list")
    public String listEmployees(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "listEmployees";
    }

    @GetMapping("/employees/add")
    public String addEmployee(HttpSession session) {
        return canAccess(session) ? "addEmployee" : "redirect:/employees/list";
    }

    @GetMapping("/employees/edit/{id}")
    public String editEmployee(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/employees/list";

        Employee employee = employeeService.getEmployeeById(id);
        System.out.println("Employee fetched for edit: " + employee);  // debug
        System.out.println("Date Hired: " + employee.getDateHired());  // debug

        List<Department> departments = departmentService.getAllDepartments();
        System.out.println("Departments: " + departments);  // debug

        model.addAttribute("employee", employee);
        model.addAttribute("departments", departments);
        return "editEmployee";
    }



    @GetMapping("/employees/view")
    public String viewEmployee(HttpSession session) {
        return canAccess(session) ? "viewEmployee" : "redirect:/employees/list";
    }

    @PostMapping("/employees/update/{id}")
    public String updateEmployee(@PathVariable Long id, @ModelAttribute Employee employee) {
        employeeService.updateEmployee(id, employee);
        return "redirect:/employees/list";
    }

    // DEPARTMENTS
    @GetMapping("/departments/list")
    public String listDepartments(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Department> departments = departmentService.getAllDepartments();
        model.addAttribute("departments", departments);
        return "listDepartments";
    }

    @GetMapping("/departments/add")
    public String addDepartment(HttpSession session) {
        return canAccess(session) ? "addDepartment" : "redirect:/departments/list";
    }

    @GetMapping("/departments/edit/{id}")
    public String editDepartment(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/departments/list";
        Department department = departmentService.getDepartmentById(id);
        model.addAttribute("department", department);
        return "editDepartment";
    }
    @GetMapping("/departments/view")
    public String viewDepartment(HttpSession session) {
        return canAccess(session) ? "viewDepartment" : "redirect:/departments/list";
    }

    @PostMapping("/departments/update/{id}")
    public String updateDepartment(@PathVariable Long id, @ModelAttribute Department department) {
        departmentService.updateDepartment(id, department);
        return "redirect:/departments/list";
    }

    // ATTENDANCE
    @GetMapping("/attendance/list")
    public String listAttendance(HttpSession session, Model model) {
        session.setAttribute("fromList", true);
        List<Attendance> attendance = attendanceService.getAllAttendance();
        model.addAttribute("attendance", attendance);
        return "attendanceLog";
    }

    @GetMapping("/attendance/add")
    public String addAttendance(HttpSession session) {
        return canAccess(session) ? "recordAttendance" : "redirect:/attendance/list";
    }

    @GetMapping("/attendance/edit/{id}")
    public String editAttendance(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) return "redirect:/attendance/list";
        Attendance attendance = attendanceService.getAttendanceById(id);
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("attendance", attendance);
        model.addAttribute("employees", employees);
        return "editAttendance";
    }

    @GetMapping("/attendance/view")
    public String viewAttendance(HttpSession session) {
        return canAccess(session) ? "viewAttendance" : "redirect:/attendance/list";
    }

    @PostMapping("/attendance/update/{id}")
    public String updateAttendance(@PathVariable Long id, @ModelAttribute Attendance attendance) {
        attendanceService.updateAttendance(id, attendance);
        return "redirect:/attendance/list";
    }

    // View methods with ID parameters
    @GetMapping("/employees/view/{id}")
    public String viewEmployee(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) {
            return "redirect:/employees/list";
        }
        try {
            Employee employee = employeeService.getEmployeeById(id);
            model.addAttribute("employee", employee);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Employee not found");
        }
        return "viewEmployee";
    }

    @GetMapping("/departments/view/{id}")
    public String viewDepartment(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) {
            return "redirect:/departments/list";
        }
        try {
            Department department = departmentService.getDepartmentById(id);
            model.addAttribute("department", department);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Department not found");
        }
        return "viewDepartment";
    }

    @GetMapping("/attendance/view/{id}")
    public String viewAttendance(@PathVariable Long id, HttpSession session, Model model) {
        if (!canAccess(session)) {
            return "redirect:/attendance/list";
        }
        try {
            Attendance attendance = attendanceService.getAttendanceById(id);
            model.addAttribute("attendance", attendance);
        } catch (RuntimeException e) {
            model.addAttribute("error", "Attendance record not found");
        }
        return "viewAttendance";
    }
}