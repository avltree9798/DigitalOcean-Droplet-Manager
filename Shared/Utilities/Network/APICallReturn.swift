//
//  APICallReturn.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

enum APICallReturn: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
