//
//  SearchAndFilterBar.swift
//  OneDayHire
//
//  Created by SRMIST TRICHY on 07/08/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Search for one time jobs...")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Near you")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .foregroundStyle(.black)
            })
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 4)
                .foregroundStyle(.gray)
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

struct SearchAndFilterBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilterBar()
    }
}


