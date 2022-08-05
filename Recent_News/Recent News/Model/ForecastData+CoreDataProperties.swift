//
//  ForecastData+CoreDataProperties.swift
//  
//
//  Created by Filip  on 6.6.22..
//
//

import Foundation
import CoreData


extension ForecastData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ForecastData> {
        return NSFetchRequest<ForecastData>(entityName: "ForecastData")
    }

    @NSManaged public var name: String?
    @NSManaged public var temp: Float
    @NSManaged public var feelsLike: Float
    @NSManaged public var main: String?

}
