//
//  ProfileOptionRowView.swift
//  Jobbie
//
//  Created by SRMIST TRICHY on 28/08/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Divider()
        }
    }
}

struct ProfileOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionRowView(imageName: "gear", title: "Settings")
    }
}

