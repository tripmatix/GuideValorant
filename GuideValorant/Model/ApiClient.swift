//
//  ApiClient.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 15/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiClient {
    func request<T: Decodable>(
        type: T.Type,
        method: HTTPMethod,
        encoding: ParameterEncoding,
        onSuccess: @escaping(T) -> Void,
        onError: @escaping (Error) -> Void)
}

class ApiManager: ApiClient {
    func request<T>(type: T.Type,
                    method: HTTPMethod,
                    encoding: ParameterEncoding,
                    onSuccess: @escaping (T) -> Void,
                    onError: @escaping (Error) -> Void) where T : Decodable {
        let baseUrl = "https://br.api.riotgames.com/val/content/v1/contents?locale="
        let language = "pt-BR"
        let suplement = "&api_key="
        let apiKey = "RGAPI-4d033824-5600-456b-a8a2-810351bf67b2"
        
        let request = AF.request(baseUrl+language+suplement+apiKey, method: method, encoding: encoding)
        request.validate(statusCode: 200..<300)
        request.responseJSON {response in
//            #if DEBUG
//            print("request")
//            print(request)
//            print("response")
//            print(response)
//            #endif
            
            switch(response.result) {
            case .success:
                do {
//                    print("success1")
                    let parsedJson = try
                        JSONDecoder().decode(T.self, from: response.data!)
                    onSuccess(parsedJson)
                } catch let error {
//                    print("error1 \(error)")
                    onError(error)
                }
            case .failure(let error):
                onError(error)
            }
        }
    }
}
