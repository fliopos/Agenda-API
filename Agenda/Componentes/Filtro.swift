//
//  Filtro.swift
//  Agenda
//
//  Created by Leonardo Almeida on 27/10/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {
    
    func FiltrarAlunos(listaDeAlunos: Array<Aluno>, texto: String) -> Array<Aluno>{
        let alunosEncontrados = listaDeAlunos.filter { (aluno) -> Bool in
            if let nome = aluno.nome {
                return nome.contains(texto)
            }
            return false
        }
            return alunosEncontrados    
    }

}
