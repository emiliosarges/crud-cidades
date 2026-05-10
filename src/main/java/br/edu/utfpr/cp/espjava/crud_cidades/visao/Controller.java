package br.edu.utfpr.cp.espjava.crud_cidades.visao;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/")
    public String listar(){
        return "crud.html";
    }
}
