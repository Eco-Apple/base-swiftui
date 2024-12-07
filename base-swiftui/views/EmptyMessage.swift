//
//  EmptyMessageView.swift
//  Piggy
//
//  Created by Jerico Villaraza on 9/13/24.
//

import SwiftUI

struct EmptyMessage: View {
    let title: String
    let message: String
    let systemImage: String
    
    var body: some View {
        ContentUnavailableView {
            Label(title, systemImage: systemImage)
        } description: {
            Text(message)
        }
    }
}

#Preview {
    EmptyMessage(title: "No Expense", message: "New expenses you added will appear here.", systemImage:  "tray.fill")
}
