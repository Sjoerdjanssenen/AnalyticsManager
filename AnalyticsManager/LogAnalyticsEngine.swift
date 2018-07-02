//
//  LogAnalyticsEngine.swift
//  AnalyticsManager
//
//  Created by Sjoerd Janssen on 30/06/2018.
//  Copyright © 2018 Sjoerd Janssen. All rights reserved.
//

import UIKit

class LogAnalyticsEngine: AnalyticsEngine {
    func sendAnalyticsEvent(named name: String, metadata: [String : Any]) {
        print("=========")
        print("event: ", name)
        print("metadata:")
        dump(metadata)
        print("=========")
    }
}
