//
//  LoginResponseDataModel.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/11/09.
//

import Foundation

// MARK: - ResponseData

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData?
}

// MARK: - ResultData

struct LoginResultData: Codable {
    let id: Int
    let name: String
    let email: String
}

struct SignUpResultData: Codable {
    let id: Int
    let name: String
    let password: Int
    let email: String
}

