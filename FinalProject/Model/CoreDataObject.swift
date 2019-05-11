//
//  CoreDataObject.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 5/14/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class CoreDataObject {
    static var shared = CoreDataObject()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var _allObjectInCoreData: [Dalil]!
    public var allObjectInCoreData: [Dalil] {
        return _allObjectInCoreData
    }
    
    //Fetch Result Controller
    private var _dalil: NSFetchedResultsController<Dalil>!
    var dalil: NSFetchedResultsController<Dalil> {
        return _dalil
    }
    
    //Get and Set Context
    private var _context: NSManagedObjectContext!
    var context: NSManagedObjectContext {
        return _context
    }
    
    //Request
    private var _dalilRequest: NSFetchRequest<Dalil> = Dalil.fetchRequest()
    var dalilRequest: NSFetchRequest<Dalil> {
        return _dalilRequest
    }
    
    private init() {
        _context = appDelegate.persistentContainer.viewContext
        deleteRecord()
        checkRecord()
        getDalilFromCoreDate()
        
        _allObjectInCoreData = dalil.fetchedObjects!
        cetakDalil()
        
        print("Private init berhasil dijalankan nih")
    }
    
    private func deleteRecord(){
        var deleteRequest: NSBatchDeleteRequest
        do {
            deleteRequest = NSBatchDeleteRequest(fetchRequest: dalilRequest
                as! NSFetchRequest<NSFetchRequestResult>)
            try context.execute(deleteRequest)
            
            print("Proses penghapusan record berhasil")
        }
        catch {
            fatalError("Ada kegagalan menghapus record")
        }
    }
    
    private func checkRecord(){
        do {
            let dalilCount = try context.count(for: dalilRequest)
            
            if dalilCount == 0 {
                setRecord()
                
                print("Proses check record, dilanjutkan ke proses set record")
            }
        }
        catch {
            fatalError("Error di check record nich")
        }
    }
    
    private func setRecord(){
        let url = Bundle.main.url(forResource: "dalil", withExtension: "json")
        let data = try? Data(contentsOf: url!)

        do {
            let jsonData = try JSON(data: data!)
            if let jsonArray = jsonData["dalil"].arrayObject as? [Dictionary<String, AnyObject>] {
                for json in jsonArray {
                    guard let tag = json["tag"] else {
                        return
                    }
                    guard let ahliWaris = json["ahliWaris"] else {
                        return
                    }
                    guard let isiDalil = json["isiDalil"] else {
                        return
                    }
                    guard let sumberDalil = json["sumberDalil"] else {
                        return
                    }
                    
                    guard let bagian = json["bagian"] else {
                        return
                    }
                    
                    guard let syarat = json["syarat"] else {
                        return
                    }
                    
                    guard let dalilLengkap = json["dalilLengkap"] else {
                        return
                    }
                    
                    let dalil = Dalil(context: context)
                    dalil.tag = tag as? String
                    dalil.ahliWaris = ahliWaris as? String
                    dalil.isiDalil = isiDalil as? String
                    dalil.sumberDalil = sumberDalil as? String
                    dalil.bagian = bagian as? String
                    dalil.syarat = syarat as? String
                    dalil.dalilLengkap = dalilLengkap as? String
                    
                    appDelegate.saveContext()
                }
            }
            
        } catch {
            fatalError("Error di set record nich")
        }
    }
    private func getDalilFromCoreDate(){
        let sortDescriptor = NSSortDescriptor(key: "tag", ascending: true)
        dalilRequest.sortDescriptors = [sortDescriptor]
        
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: dalilRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        _dalil = aFetchedResultsController
        do {
            try _dalil.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Ada error ketika fetch result nih \(nserror), \(nserror.userInfo)")
        }
    }
    
    func cetakDalil(){
        for i in allObjectInCoreData {
            print("")
            print("Dalil nomor = \(i.tag!)")
            print("Ahli Waris = \(i.ahliWaris!)")
            print("Sumber Dalilnya adalah = \(i.sumberDalil!)")
            print("Isi dalilnya adalah = \(i.isiDalil!)")
            print("Dalil lengkapnya adalah = \(i.dalilLengkap!)")
            let dalilLengkapAsInt = Int(i.dalilLengkap!)
            print("Syaratnya adalah = \(i.syarat!)")
            print("Bagiannya adalah = \(i.bagian!)")
            print("Dalil lengkap Integer adalah \(dalilLengkapAsInt!)")
            print("")
        }
    }
}
