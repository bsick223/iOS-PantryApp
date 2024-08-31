//
//  ListView.swift
//  PantryApp
//
//  Created by Brendan Sick on 8/30/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    
    var body: some View {
        NavigationView {
            
            List(dataManager.pantrys, id: \.id) { pantry in
                Text(pantry.item)
                
            }
            .navigationTitle("Items")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewPantryView()
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager()) // Provide the EnvironmentObject here
}
