//
//  Session.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

final class Session : ObservableObject{
    static let instance : Session = Session()
    @Published var isLoggedIn: Bool = false
}
