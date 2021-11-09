//
//  NetworkResult.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/11/09.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
