package com.example.demo.Frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping(value = "/")
    public String firstpage() {

        return "Cal";
    }
    
    @GetMapping(value = "/Ser")
    public String SerachScreen() {

        return "SerachScreen";
    }
    
    @GetMapping(value = "/In")
    public String DBpage() {

        return "InputScreen";
    }
}
