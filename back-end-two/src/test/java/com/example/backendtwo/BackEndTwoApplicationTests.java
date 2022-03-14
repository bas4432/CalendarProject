package com.example.backendtwo;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(MockitoExtension.class)
@WebMvcTest
class BackEndTwoApplicationTests {

    @Autowired
    private MockMvc mvc;

    @Test
    void successHelloWorld() throws Exception {
        String helloWorld = "Hello World!";

        mvc.perform(get("/home"))
                .andExpect(status().isOk())
                .andExpect(content().string(helloWorld));
                ;
    }

    @Test
    void failHelloWorld() throws Exception {
        String helloWorld = "Bye World!";

        mvc.perform(get("/home2"))
                .andExpect(status().is4xxClientError())
//                .andExpect(content().string(helloWorld))
        ;

    }

}
