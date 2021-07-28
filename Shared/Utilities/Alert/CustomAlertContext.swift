//
//  CustomAlertContext.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

enum CustomAlertContext {
    static let invalidURL = CustomAlert(
        title: Text("Server Error"),
        message: Text("There is an error trying to reach the server. If this persists, please contact anthonyviriya98@icloud.com."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let unableToComplete = CustomAlert(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at this time. Please check your internet connection."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let invalidResponse  = CustomAlert(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again or contact anthonyviriya98@icloud.com."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let invalidData = CustomAlert(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please try again or contact anthonyviriya98@icloud.com."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let failedToStoreDataToKeychain = CustomAlert(
        title: Text("Keychain Error"),
        message: Text("Your token can't be stored to the Keychain. Please try again or contact anthonyviriya98@icloud.com."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let failedToRetreiveDataToKeychain = CustomAlert(
        title: Text("Keychain Error"),
        message: Text("Your token can't be retreive from the Keychain. Please try again or contact anthonyviriya98@icloud.com."),
        dismissButton: .default(Text("Ok"))
    )
    
    static let success = CustomAlert(
        title: Text("Action success"),
        message: Text("The action you requested has been performed successfully"),
        dismissButton: .default(Text("Ok"))
    )
}
