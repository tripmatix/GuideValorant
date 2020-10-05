//
//  ResponseRepository.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 15/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol ResponseDataSource {
    func getResponse( onSuccess: @escaping (ContentDto) -> Void, onError: @escaping (String) -> Void )
}

class ResponseRepository: ResponseDataSource {
    private let apiClient = ApiManager()
    
    func getResponse(onSuccess: @escaping (ContentDto) -> Void, onError: @escaping (String) -> Void) {
        apiClient.request(type: ResponseList.self,
                          method: HTTPMethod.get,
                          encoding: URLEncoding.default,
                          onSuccess: {response in
                            if let error = response.error.reason{
                                print("error dados invalidos \(error)")
                                onError(error)
                                return
                            }
                            onSuccess(response.contentDto)
                            print("sucesso")
        },
                          onError: { error in
                            //tratar error, por exemplo qnd estiver sem internet...
                            onError("Ocorreu um erro :(")
        })
    }
}
