//
//  NC1_Calculation_ADAApp.swift
//  NC1_Calculation_ADA
//
//  Created by Michael Chandra on 11/05/23.
//

import SwiftUI


@main
struct NC1_Calculation_ADAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(transactionVM: TransaksiViewModel(), categoryVM: CategoryViewModel())
        }
    }
}
