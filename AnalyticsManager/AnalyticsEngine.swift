//
//  AnalyticsEngine.swift
//  AnalyticsManager
//
//  Created by Sjoerd Janssen on 30/06/2018.
//  Copyright © 2018 Sjoerd Janssen. All rights reserved.
//

import UIKit

protocol AnalyticsEngine: class {
    func sendAnalyticsEvent(named name: String, metadata: [String : Any])
}
