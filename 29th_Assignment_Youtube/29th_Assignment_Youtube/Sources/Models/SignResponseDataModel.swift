//
//  SignResponseDataModel.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/11/09.
//

import Foundation

// MARK: - ResponseData

struct SignResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignResultData?
}

// MARK: - ResultData

struct SignResultData: Codable {
    let id: Int
    let name: String
    let email: String
}


