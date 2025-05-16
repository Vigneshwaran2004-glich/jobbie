//
//  DeveloperPreview.swift
//  Jobbie
//
//  Created by SRMIST TRICHY on 04/09/24.
//

import Foundation

class DeveloperPreview {
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            employerUid: NSUUID().uuidString,
            employerName: "The Trichy Railway Station Management",
            employerImageUrl: "profilepic",
            jobSalary: "₹200",
            latitude: 10.7942,
            longitude: 78.6853,
            imageURLs: ["listing-1", "listing-2", "listing-3"],
            address: "QMVP+M48, Bharathiyar Salai, Sangillyandapuram",
            city: "Tiruchirappalli",
            state: "Tamil Nadu",
            title: "Lawn Mowing",
            features: [.verifiedHost, .contactlessPayment],
            description: [
                            listingDescription(
                                id: "desc1",
                                responsibilities: "Mow a 100 sq. meter lawn.",
                                qualifications: "Experience preferred but not required.",
                                hours: "1 - 2 hours",
                                payment: "₹200 upon completion.",
                                contact: 9876543210
                            )
                        ]
        ),
    ]
}

