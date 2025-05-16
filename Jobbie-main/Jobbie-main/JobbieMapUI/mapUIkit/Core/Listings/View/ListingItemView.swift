//
//  ListingView.swift
//  OneDayHire
//
//  Created by SRMIST TRICHY on 07/08/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3"

    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            
            // listing details
            
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Lawn Mowing").fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Text("4 KM Away").foregroundStyle(.gray)
                    
                    Text("August 15").foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("Railway Station, Trichy").fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    
                }
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2) {
                    Text("₹200").fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    
                }
                
                
            }
            .font(.footnote)
        }
        .padding()
        
    }
    
    struct ListingItemView_Previews: PreviewProvider {
        static var previews: some View {
            ListingItemView()
        }
    }
}


