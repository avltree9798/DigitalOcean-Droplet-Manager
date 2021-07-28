//
//  DropletListViewModel.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation
import Combine

final class DropletListViewModel: ObservableObject{
    @Published var droplets: [Droplet] = []
    @Published var isLoading: Bool = false
    @Published var customAlert: CustomAlert?
    var session: Session = Session.instance
    private let cancellable: AnyCancellable?
    let intervalPublisher = Timer.TimerPublisher(
        interval: 60.0,
        runLoop: .main,
        mode: .default
    )
    init() {
        self.cancellable = intervalPublisher.connect() as? AnyCancellable
    }
    
    deinit {
        self.cancellable?.cancel()
    }
    func logout() {
        KeychainManager.instance.removeItem(key: KeychainManager.instance.tokenKey)
        session.isLoggedIn = false
    }
    
    func getDropletList() {
        isLoading = true
        NetworkManager.instance.getDroplets(completed: {[self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let droplets):
                    self.droplets = droplets
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
