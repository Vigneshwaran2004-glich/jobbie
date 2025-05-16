//
//  Listing.swift
//  Jobbie
//
//  Created by SRMIST TRICHY on 29/08/24.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id: String
    let employerUid: String
    let employerName: String
    let employerImageUrl: String
    var jobSalary: String
    let latitude: Double
    let longitude: Double
    var imageURLs: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var features: [JobFeatures]
    var description: [listingDescription]
}


enum JobFeatures: Int, Codable, Identifiable, Hashable {
    case contactlessPayment
    case verifiedHost
    
    var imageName: String {
       switch self {
       case .verifiedHost: return "lock.shield.fill"
       case .contactlessPayment: return "indianrupeesign.circle"
               
       }
    }
    
    var title: String {
        switch self {
        case .verifiedHost: return "Verified Host"
        case .contactlessPayment: return "Contactless payment"
        }
    }
    
    var subtitle: String {
        switch self {
        case .verifiedHost:
            return "Verified Hosts provide security and guaranteed payment upon job completion."
        case .contactlessPayment:
            return "Digital payment options available."
        }
    }
    
    var id: Int { return self.rawValue }
}

struct listingDescription: Identifiable, Codable {
    let id: String
    let responsibilities: String
    let qualifications: String
    let hours: String
    let payment: String
    let contact: Int
}


