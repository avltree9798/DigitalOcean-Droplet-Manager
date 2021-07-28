//
//  DropletDetailViewModel.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation
#if os(macOS)
    import AppKit
#else
    import UIKit
#endif
import Combine

final class DropletDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var customAlert: CustomAlert?
    @Published var view: DropletDetailView?
    private let cancellable: AnyCancellable?
    let intervalPublisher = Timer.TimerPublisher(
        interval: 10.0,
        runLoop: .main,
        mode: .default
    )
    init() {
        self.cancellable = intervalPublisher.connect() as? AnyCancellable
    }
    
    deinit {
        self.cancellable?.cancel()
    }
    
    func copy(str: String){
        #if os(macOS)
            NSPasteboard.general.setString(str, forType: .string)
        #else
            UIPasteboard.general.string = str
        #endif
    }
    
    func refreshDroplet() {
        if self.view != nil {
            NetworkManager.instance.getDroplet(dropletId: self.view!.droplet.id, completed: {[self] result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let droplet):
                        self.view!.droplet = droplet
                        break
                    case .failure(let error):
                        switch error{
                        case .invalidData:
                            customAlert = CustomAlertContext.invalidData
                            break
                        case .invalidURL:
                            customAlert = CustomAlertContext.invalidURL
                            break
                        case .invalidResponse:
                            customAlert = CustomAlertContext.invalidResponse
                            break
                        case .unableToComplete:
                            customAlert = CustomAlertContext.unableToComplete
                            break
                        }
                        break
                    }
                }
            })
        }
    }
    
    func getMapLocation(droplet: Droplet) {
//        NetworkManager.instance.getGeolocationFromIP(ip: droplet.networks.v4, completed: <#T##(Result<IPGeolocatorResponse, APICallReturn>) -> Void#>)
    }
    
    func reboot(droplet: Droplet) {
        self.isLoading = true
        NetworkManager.instance.rebootDroplet(dropletId: droplet.id, completed: { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let alert):
                    self.customAlert = alert
                    self.refreshDroplet()
                    break
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        customAlert = CustomAlertContext.invalidData
                        break
                    case .invalidURL:
                        customAlert = CustomAlertContext.invalidURL
                        break
                    case .invalidResponse:
                        customAlert = CustomAlertContext.invalidResponse
                        break
                    case .unableToComplete:
                        customAlert = CustomAlertContext.unableToComplete
                        break
                    }
                    break
                }
            }
        })
    }
    
    func powerOn(droplet: Droplet) {
        self.isLoading = true
        NetworkManager.instance.powerOnDroplet(dropletId: droplet.id, completed: { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let alert):
                    self.customAlert = alert
                    self.refreshDroplet()
                    break
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        customAlert = CustomAlertContext.invalidData
                        break
                    case .invalidURL:
                        customAlert = CustomAlertContext.invalidURL
                        break
                    case .invalidResponse:
                        customAlert = CustomAlertContext.invalidResponse
                        break
                    case .unableToComplete:
                        customAlert = CustomAlertContext.unableToComplete
                        break
                    }
                    break
                }
            }
        })
    }
    
    func shutdown(droplet: Droplet) {
        self.isLoading = true
        NetworkManager.instance.shutdownDroplet(dropletId: droplet.id, completed: { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let alert):
                    self.customAlert = alert
                    self.refreshDroplet()
                    break
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        customAlert = CustomAlertContext.invalidData
                        break
                    case .invalidURL:
                        customAlert = CustomAlertContext.invalidURL
                        break
                    case .invalidResponse:
                        customAlert = CustomAlertContext.invalidResponse
                        break
                    case .unableToComplete:
                        customAlert = CustomAlertContext.unableToComplete
                        break
                    }
                    break
                }
            }
        })
    }
}
