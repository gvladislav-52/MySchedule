//
//  APIManager.swift
//  MySchedule
//
//  Created by macbookbro on 16.07.2024.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class APIManager {
    static let shared = APIManager()
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    
    private init() {
        Firestore.firestore().settings = FirestoreSettings()
    }
    
    // MARK: - Firestore Methods
    
    func getPost(collection: String, docName: String, completion: @escaping (Document?) -> Void) {
        db.collection(collection).document(docName).getDocument { (document, error) in
            guard error == nil, let document = document, document.exists else {
                completion(nil)
                return
            }
            let doc = Document(date_field: document.get("date_field") as! String, time_field: document.get("time_field") as! String, name_field: document.get("name_field") as! String, type_field: document.get("type_field") as! String, building_field: document.get("building_field") as! String, audience_field: document.get("audience_field") as! String, teacher_field: document.get("teacher_field") as! String, color_field: document.get("color_field") as! Int, repeat_field: document.get("repeat_field") as! Bool)
            completion(doc)
        }
    }
    
    func setPost(collection: String, docName: String, data: [String: Any], completion: ((Error?) -> Void)? = nil) {
        db.collection(collection).document(docName).setData(data) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
            completion?(error)
        }
    }
    
    func getPost(collection: String, docName: String, completion: @escaping ([[String]]?) -> Void) {
            db.collection(collection).document(docName).getDocument { (document, error) in
                guard error == nil, let document = document, document.exists else {
                    completion(nil)
                    return
                }
                
                let dateField = document.get("date_field") as? String ?? ""
                let timeField = document.get("time_field") as? String ?? ""
                let nameField = document.get("name_field") as? String ?? ""
                let typeField = document.get("type_field") as? String ?? ""
                let buildingField = document.get("building_field") as? String ?? ""
                let audienceField = document.get("audience_field") as? String ?? ""
                let teacherField = document.get("teacher_field") as? String ?? ""
                let colorField = String(document.get("color_field") as? Int ?? 0)
                let repeatField = String(document.get("repeat_field") as? Bool ?? false)
                
                let data: [[String]] = [
                    [dateField, timeField],
                    [nameField, typeField, buildingField, audienceField],
                    [teacherField],
                    [colorField],
                    [repeatField]
                ]
                
                completion(data)
            }
        }
}
