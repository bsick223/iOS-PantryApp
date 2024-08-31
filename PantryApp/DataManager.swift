//
//  DataManager.swift
//  PantryApp
//
//  Created by Brendan Sick on 8/30/24.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var pantrys: [Pantry] = []
    
    init() {
        fetchPantry()
    }
    
    func fetchPantry() {
        pantrys.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let item = data["item"] as? String ?? ""
                    
                    let pantry = Pantry(id: id, item: item)
                    self.pantrys.append(pantry)
                }
            }
        }
    }
    func addPantry(pantryItem: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(pantryItem)
        let newID = UUID().uuidString // Generate a unique ID
        
        // To-do make ID an input for the amount of an item
        ref.setData(["item": pantryItem, "id" : newID]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Optionally, append the new item to the pantrys array
                let pantry = Pantry(id: newID, item: pantryItem)
                self.pantrys.append(pantry)
            }
            
        }
    }
    
}
