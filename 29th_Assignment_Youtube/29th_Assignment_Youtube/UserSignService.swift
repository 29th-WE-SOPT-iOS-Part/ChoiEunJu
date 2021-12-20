//
//  UserSignService.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/11/09.
//

import Foundation

import Alamofire

struct UserSignService {
    static let shared = UserSignService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.loginURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    func signUp(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.signUpURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isVaildSignData(data: data)
        case 400: return isPathErr(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isVaildSignData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponseData.self, from: data)
            else { return .pathErr(data) }
        return .success(decodedData)
    }
    
    private func isPathErr(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponseData.self, from: data)
        else { return .pathErr(data) }
        return .pathErr(decodedData)
                
    }
}

