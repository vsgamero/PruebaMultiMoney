//
//  InfoRowView.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 21/8/23.
//

import SwiftUI

struct InfoRowView: View {
    let label: String
    let icon: String
    let value: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: icon)
            Spacer()
            Text(value)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
        }
    }
}
