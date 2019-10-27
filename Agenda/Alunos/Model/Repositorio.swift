//
//  Repositorio.swift
//  Agenda
//
//  Created by Leonardo Almeida on 26/10/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func recuperaAlunos(completion: @escaping(_ listaDeAlunos: Array<Aluno>) -> Void) {
        var alunos = AlunoDAO().recuperaAlunos()
        if alunos.count == 0 {
            AlunoAPI().recuperaAlunos {
                alunos = AlunoDAO().recuperaAlunos()
            }
        }
        else {
            completion(alunos)
        }
    }

    func salvaAluno(aluno:Dictionary<String, String>) {
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
