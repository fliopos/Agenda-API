//
//  Safari.swift
//  Agenda
//
//  Created by Leonardo Almeida on 27/10/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import SafariServices

class Safari: NSObject {
    func abrePaginaWeb (_ alunoSeleconado: Aluno, controller: UIViewController){
        
        if let urlDoAluno = alunoSeleconado.site {

            var urlFormatada = urlDoAluno

            if !urlFormatada.hasPrefix("http://") {
                urlFormatada = String(format: "http://%@", urlFormatada)
            }

            guard let url = URL(string: urlFormatada) else { return }
            let safariViewController = SFSafariViewController(url: url)
            controller.present(safariViewController, animated: true, completion: nil)
        }
    }
}
