//
//  WishlistsView.swift
//  Jobbie
//
//  Created by SRMIST TRICHY on 28/08/24.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your starred jobs.")
                        .font(.headline)
                    
                    Text("You can star jobs to view them later once you've logged in.")
                        .font(.footnote)
                }
                
                Button {
                    print("Log in")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Starred Jobs")
        }
    }
}

struct WishlistsView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistsView()
    }
}

