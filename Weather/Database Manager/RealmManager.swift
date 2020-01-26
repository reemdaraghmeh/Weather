//
//  RealmManager.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/24/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    //MARK: - Shared Singleton
    static let shared = RealmManager()
    
    private var realm : Realm!
    
    //MARK: - Init
    
    private init() {
        realm = try! Realm()
    }
    
    //MARK: - CRUD
    func writeOperation(objectOfType:Object){
        try! realm.write {
            realm.add(objectOfType, update: .all)
        }
    }
    
    func getAllOperation(ofType: Object.Type) -> Results<Object>? {
        return realm!.objects(ofType.self)
    }
}
