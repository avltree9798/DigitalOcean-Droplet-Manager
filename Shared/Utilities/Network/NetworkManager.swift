//
//  NetworkManager.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

class NetworkManager: NSObject{
    static let instance: NetworkManager = NetworkManager()
    private static let baseURL: String = "https://api.digitalocean.com"
    private static let ipGeolocationURL: String = "http://ip-api.com/json/"
    private let dropletListURL: String = baseURL + "/v2/droplets"
    
    private func makeRequest(url: URL) -> URLRequest{
        var request = URLRequest(url: url)
        let token = KeychainManager.instance.retreiveItem(key: KeychainManager.instance.tokenKey) as! String
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func getGeolocationFromIP(ip: String, completed: @escaping (Result<IPGeolocatorResponse, APICallReturn>) -> Void) {
        guard let url = URL(string: "\(NetworkManager.ipGeolocationURL)/\(ip)") else {
            completed(.failure(.invalidURL))
            return
        }
        let request = makeRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(IPGeolocatorResponse.self, from: data)
                completed(.success(decodedData))
            } catch {
                completed(.failure(.invalidData))
            }
        }).resume()
    }
    
    func getDroplet(dropletId: Int, completed: @escaping (Result<Droplet, APICallReturn>) -> Void) {
        guard let url = URL(string: "\(dropletListURL)/\(dropletId)") else {
            completed(.failure(.invalidURL))
            return
        }
        let request = makeRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(DropletRefreshResponse.self, from: data)
                completed(.success(decodedData.droplet))
            } catch {
                completed(.failure(.invalidData))
            }
        }).resume()
    }
    
    
    func getDroplets(completed: @escaping (Result<[Droplet], APICallReturn>) -> Void){
        guard let url = URL(string: dropletListURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let request = makeRequest(url: url)
        
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(DropletListResponse.self, from: data)
                completed(.success(decodedData.droplets))
            } catch {
                completed(.failure(.invalidData))
            }
        }).resume()
    }
    
    private func performAction(dropletId: Int, action: String, completed: @escaping (Result<CustomAlert, APICallReturn>) -> Void) {
        guard let url = URL(string: "\(NetworkManager.baseURL)/v2/droplets/\(dropletId)/actions") else {
            completed(.failure(.invalidURL))
            return
        }
        var request = makeRequest(url: url)
        request.httpMethod = "POST"
        let parameters : [String: Any] = [
            "type": action
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard data != nil else {
                completed(.failure(.invalidData))
                return
            }
            
            completed(.success(CustomAlertContext.success))
        }).resume()
    }
    
    func shutdownDroplet(dropletId: Int, completed: @escaping (Result<CustomAlert, APICallReturn>) -> Void){
        self.performAction(dropletId: dropletId, action: "power_off", completed: completed)
    }
    
    func rebootDroplet(dropletId: Int, completed: @escaping (Result<CustomAlert, APICallReturn>) -> Void){
        self.performAction(dropletId: dropletId, action: "reboot", completed: completed)
    }
    
    func powerOnDroplet(dropletId: Int, completed: @escaping (Result<CustomAlert, APICallReturn>) -> Void){
        self.performAction(dropletId: dropletId, action: "power_on", completed: completed)
    }
}
