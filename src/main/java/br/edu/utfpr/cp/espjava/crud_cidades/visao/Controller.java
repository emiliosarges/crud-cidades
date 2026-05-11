package br.edu.utfpr.cp.espjava.crud_cidades.visao;

import java.util.Set;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/")
    public String listar(Model memoria){
        var cidades = Set.of(
            new Cidade("Cornélio Procópio", "PR"),
            new Cidade("Assis", "SP"),
            new Cidade("Itajaí", "SC")

        );

        memoria.addAttribute("listaCidades", cidades);
        return "/crud";
    }
}
