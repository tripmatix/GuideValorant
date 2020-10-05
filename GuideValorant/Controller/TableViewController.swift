//
//  TableViewController.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 18/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {  
    
    var list: [ContentList.Characters] = []
    
    let repository = ContentRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.getContent(onSuccess: { content in
            self.list = content.characters
            print("deu certo")
            for personagem in self.list {
                print(personagem.name)
            }
            
        })
        { error in print("outro erro: \(error)")}
        
    }
}
