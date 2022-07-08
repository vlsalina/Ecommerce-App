//
//  CDHistoryHelper.swift
//  ecommerce
//  Provides core data functionality for storing and retrieving data for Search History page.
//
//  Created by Vincent Salinas on 7/7/22.
//

import Foundation
import UIKit
import CoreData

class CDHistoryHelper {
    
    static var cdHistoryHelper = CDHistoryHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addProduct(productObj: NewProduct) {
        
        let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context!) as! Product
        
        productEntity.id = Int64(productObj.id)
        productEntity.name = productObj.name
        productEntity.category = productObj.category
        productEntity.new = productObj.new
        productEntity.price = Int64(productObj.price)
        productEntity.featured = productObj.featured
        productEntity.cartIMG = productObj.cartIMG
        productEntity.productIMG = productObj.productIMG
        productEntity.pDescription = productObj.description
        productEntity.features = productObj.features
        
        do {
            try context?.save()
            print("data saved successfully")
        } catch {
            print("data save unsuccessful")
            print(error.localizedDescription)
        }
    }
    
    func addItem(pid: Int, itemObj: NewItem) {
        
        let itemEntity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context!) as! Item
        
        itemEntity.pid = Int64(pid)
        itemEntity.item = itemObj.item
        itemEntity.quantity = Int64(itemObj.quantity)
        
        do {
            try context?.save()
            print("data saved successfully")
        } catch {
            print("data save unsuccessful")
            print(error.localizedDescription)
        }
    }
    
    func addPreview(pid: Int, previewObj: NewPreview) {
        let previewEntity = NSEntityDescription.insertNewObject(forEntityName: "Preview", into: context!) as! Preview
        
        previewEntity.pid = Int64(pid)
        previewEntity.img = previewObj.img
        
        do {
            try context?.save()
            print("data saved successfully")
        } catch {
            print("data save unsuccessful")
            print(error.localizedDescription)
        }
    }
    
    func addRecommended(pid: Int, recommendedObj: NewRecommended) {
        
        let recommendedEntity = NSEntityDescription.insertNewObject(forEntityName: "Recommended", into: context!) as! Recommended
        
        recommendedEntity.pid = Int64(pid)
        recommendedEntity.name = recommendedObj.name
        recommendedEntity.img = recommendedObj.img
        
        do {
            try context?.save()
            print("data saved successfully")
        } catch {
            print("data save unsuccessful")
            print(error.localizedDescription)
        }
    }
}

