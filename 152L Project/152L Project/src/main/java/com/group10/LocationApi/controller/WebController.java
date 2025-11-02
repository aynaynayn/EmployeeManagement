package com.group10.LocationApi.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

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
    public String listEmployees(HttpSession session) {
        session.setAttribute("fromList", true);
        return "listEmployees";
    }

    @GetMapping("/employees/add")
    public String addEmployee(HttpSession session) {
        return canAccess(session) ? "addEmployee" : "redirect:/employees/list";
    }

    @GetMapping("/employees/edit")
    public String editEmployee(HttpSession session) {
        return canAccess(session) ? "editEmployee" : "redirect:/employees/list";
    }

    @GetMapping("/employees/view")
    public String viewEmployee(HttpSession session) {
        return canAccess(session) ? "viewEmployee" : "redirect:/employees/list";
    }

    // DEPARTMENTS
    @GetMapping("/departments/list")
    public String listDepartments(HttpSession session) {
        session.setAttribute("fromList", true);
        return "listDepartments";
    }

    @GetMapping("/departments/add")
    public String addDepartment(HttpSession session) {
        return canAccess(session) ? "addDepartment" : "redirect:/departments/list";
    }

    @GetMapping("/departments/edit")
    public String editDepartment(HttpSession session) {
        return canAccess(session) ? "editDepartment" : "redirect:/departments/list";
    }

    @GetMapping("/departments/view")
    public String viewDepartment(HttpSession session) {
        return canAccess(session) ? "viewDepartment" : "redirect:/departments/list";
    }

    // ATTENDANCE
    @GetMapping("/attendance/list")
    public String listAttendance(HttpSession session) {
        session.setAttribute("fromList", true);
        return "attendanceLog";
    }

    @GetMapping("/attendance/add")
    public String addAttendance(HttpSession session) {
        return canAccess(session) ? "recordAttendance" : "redirect:/attendance/list";
    }

    @GetMapping("/attendance/edit")
    public String editAttendance(HttpSession session) {
        return canAccess(session) ? "editAttendance" : "redirect:/attendance/list";
    }

    @GetMapping("/attendance/view")
    public String viewAttendance(HttpSession session) {
        return canAccess(session) ? "viewAttendance" : "redirect:/attendance/list";
    }
}
