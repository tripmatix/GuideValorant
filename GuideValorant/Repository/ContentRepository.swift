//
//  ContentRepository.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 16/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol ContentDataSource {
    func getContent( onSuccess: @escaping (ContentList) -> Void, onError: @escaping (String) -> Void )
}

class ContentRepository: ContentDataSource {
    private let apiClient = ApiManager()
    
    func getContent(onSuccess: @escaping (ContentList) -> Void, onError: @escaping (String) -> Void) {
        apiClient.request(type: ContentList.self,
                          method: HTTPMethod.get,
                          encoding: URLEncoding.default,
                          onSuccess: {response in
                            if let error = response.status?.message{
                                print("error dados invalidos \(error)")
                                onError(error)
                                return
                            }
                            onSuccess(response.self)
        },
                          onError: { error in
                            //tratar error, por exemplo qnd estiver sem internet...
                            onError("Ocorreu um erro :(")
        })
    }
}
