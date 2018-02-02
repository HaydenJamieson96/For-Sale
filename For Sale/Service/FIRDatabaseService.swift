//
//  FIRDatabaseService.swift
//  For Sale
//
//  Created by Hayden Jamieson on 02/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation
import Firebase

enum FIRDatabaseReference: String {
    case products = "products"
}

class FIRDatabaseService {
    
    private init() {}
    static let shared = FIRDatabaseService()
    
    func reference(_ databaseReference: FIRDatabaseReference) -> DatabaseReference {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseReference: FIRDatabaseReference, completion: @escaping (DataSnapshot) -> Void) {
        reference(databaseReference).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
    
    func post(parameters: [String: Any], toDatabaseRef databaseReference: FIRDatabaseReference) {
        reference(databaseReference).childByAutoId().setValue(parameters)
    }
    
}


