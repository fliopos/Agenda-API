//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Leonardo Almeida on 26/10/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
    
    // MARK: - GET
    
    func recuperaAlunos(completion: @escaping() -> Void) {
        AF.request("http://localhost:8080/api/aluno", method: .get) .responseJSON { (response) in
         switch response.result {
            case .success(let data):
                 if let resposta = data as? Dictionary<String, Any> {
                    guard let listaDeAlunos = resposta["alunos"] as? Array<Dictionary<String, Any>> else { return }
                    for dicionarioDeAluno in listaDeAlunos {
                        AlunoDAO().salvaAluno(dicionarioDeAluno: dicionarioDeAluno)
                    }
                 }
                 completion()
                break
     
            case .failure:
                print("Request failed with error: \(response.error!)")
                completion()
                break
        }
        }
    }

    // MARK: - PUT
    func salvaAlunosNoServidor(parametros: Array<Dictionary<String, String>>) {
        
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista")
            else { return }
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: parametros, options: [])
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        AF.request(requisicao)
    }
    
    //MARK: - DELETE
    
    func deletaAluno(id: String) {
        AF.request("http://localhost:8080/api/aluno/\(id)", method: .delete).responseJSON { (response) in
            switch response.result {
                
            case .failure:
                print(response.error!)
                break
                
            default:
                break
            }
        }
        }
}
