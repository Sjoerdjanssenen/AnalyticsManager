//
//  AnalyticsManager.swift
//  AnalyticsManager
//
//  Created by Sjoerd Janssen on 30/06/2018.
//  Copyright © 2018 Sjoerd Janssen. All rights reserved.
//

import UIKit

class AnalyticsManager {
    private var engines: [AnalyticsEngine]
    
    init(engine: AnalyticsEngine) {
        self.engines = []
        self.engines.append(engine)
    }
    
    init(engines: [AnalyticsEngine]) {
        self.engines = engines
    }
    
//    func log(_ event: AnalyticsEvent) {
//        sendAnalyticsEvents(named: event.name, metadata: event.metadata)
//    }
//    
//    func log(_ event: AnalyticsEvent, attributes: [String : Any]) {
//        sendAnalyticsEvents(named: event.name, metadata: attributes)
//    }

    func logPurchase(price: Float, currency: String, success: Bool, itemName: String, itemType: String, itemId: String, attributes: [String : Any]) {
        var items = attributes
        items["price"] = price
        items["currency"] = currency
        items["success"] = success
        items["itemName"] = itemName
        items["itemType"] = itemType
        items["itemId"] = itemId
        
        sendAnalyticsEvents(named: "purchase", metadata: items)
    }
    
    func logAddToCart(price: Float, currency: String, itemName: String, itemType: String, itemId: String, attributes: [String : Any]) {
        var items = attributes
        items["price"] = price
        items["currency"] = currency
        items["itemName"] = itemName
        items["itemType"] = itemType
        items["itemId"] = itemId
        
        sendAnalyticsEvents(named: "addToCart", metadata: items)
    }
    
    func logStartCheckout(price: Float, currency: String, itemCount: Int, attributes: [String : Any]) {
        var items = attributes
        items["price"] = price
        items["currency"] = currency
        items["itemCount"] = itemCount
        
        sendAnalyticsEvents(named: "checkout", metadata: items)
    }
    
    func logContentView(name: String, type: String, id: String, attributes: [String : Any]) {
        var items = attributes
        items["name"] = name
        items["type"] = type
        items["id"] = id
        
        sendAnalyticsEvents(named: "contentView", metadata: items)
    }
    
    func logSearch(query: String, attributes: [String : Any]) {
        var items = attributes
        items["query"] = query
        
        sendAnalyticsEvents(named: "search", metadata: items)
    }
    
    func logShare(method: String, contentName: String, contentType: String, contentId: Int, attributes: [String : Any]) {
        var items = attributes
        items["method"] = method
        items["contentName"] = contentName
        items["contentType"] = contentType
        items["contentId"] = contentId
        
        sendAnalyticsEvents(named: "share", metadata: items)
    }
    
    func logRating(contentName: String, contentType: String, contentId: Int, attributes: [String : Any]) {
        var items = attributes
        items["contentName"] = contentName
        items["contentType"] = contentType
        items["contentId"] = contentId
        
        sendAnalyticsEvents(named: "rating", metadata: items)
    }
    
    func logSignup(method: String, success: Bool, attributes: [String : Any]) {
        var items = attributes
        items["method"] = method
        items["success"] = success
        
        sendAnalyticsEvents(named: "signup", metadata: items)
    }
    
    func logLogin(method: String, success: Bool, attributes: [String : Any]) {
        var items = attributes
        items["method"] = method
        items["success"] = success
        
        sendAnalyticsEvents(named: "login", metadata: items)
    }
    
    func logInvite(method: String, attributes: [String : Any]) {
        var items = attributes
        items["method"] = method
        
        sendAnalyticsEvents(named: "invite", metadata: items)
    }
    
    func logLevelStart(_ level: String, attributes: [String : Any]) {
        var items = attributes
        items["level"] = level
        
        sendAnalyticsEvents(named: "invite", metadata: items)
    }
    
    func logLevelEnd(_ level: String, score: Int, success: Bool, attributes: [String : Any]) {
        var items = attributes
        items["level"] = level
        items["score"] = score
        items["success"] = success
        
        sendAnalyticsEvents(named: "invite", metadata: items)
    }
    
    private func sendAnalyticsEvents(named: String, metadata: [String : Any]) {
        for engine in engines {
            engine.sendAnalyticsEvent(named: named, metadata: metadata)
        }
    }
}
