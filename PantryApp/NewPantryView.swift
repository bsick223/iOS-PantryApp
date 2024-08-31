//
//  NewPantryView.swift
//  PantryApp
//
//  Created by Brendan Sick on 8/31/24.
//

import SwiftUI

struct NewPantryView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newPantry = ""
    
    var body: some View {
        VStack {
            TextField("Pantry", text:$newPantry)
            
            Button {
                dataManager.addPantry(pantryItem: newPantry)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

#Preview {
    NewPantryView()
}
