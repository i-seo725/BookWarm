//
//  Repository.swift
//  BookWarm
//
//  Created by 이은서 on 2023/09/06.
//

import Foundation
import RealmSwift

protocol RepositoryProtocol: AnyObject {
    func fetch() -> Results<BookTable>
    func fetchFilter() -> Results<BookTable>
    func create(data: BookTable)
    func update(id: ObjectId, memo: String?)
    func delete(data: BookTable)
}

final class Repository: RepositoryProtocol {
    private let realm = try! Realm()
    
    func checkSchemaVersion() {
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Verson: ", version)
        } catch {
            print("Load Version Failed: ", error)
        }
    }
    
    func fetch()  -> Results<BookTable> {
        return realm.objects(BookTable.self)
    }
    
    func fetchFilter() -> Results<BookTable> {
        let result = realm.objects(BookTable.self).where {
            $0.image != nil
        }
        return result
    }
    
    func create(data: BookTable) {
        do {
            try realm.write {
                realm.add(data)
            }
        } catch {
            print("Table Create Failed: ", error)
        }
    }
    
    func update(id: ObjectId, memo: String?) {
        do {
            try realm.write {
                realm.create(BookTable.self, value: ["_id": id, "memo": memo], update: .modified)
            }
        } catch {
            print("Update Failed: ", error)
        }
    }
    
    func delete(data: BookTable) {
        do {
            try realm.write {
                realm.delete(data)
            }
        } catch {
            print("Delete Failed: ", error)
        }
    }
    
    func deleteAll() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Delete All Failed: ", error)
        }
    }
    
    func getFileURL() {
        print(realm.configuration.fileURL)
    }
}
