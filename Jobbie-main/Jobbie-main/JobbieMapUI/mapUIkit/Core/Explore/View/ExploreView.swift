import SwiftUI

struct ExploreView: View {
    @State private var showJobSearchView = false
    @State private var showMapView = false // State variable to control the display of the MapView
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if showJobSearchView {
                        JobSearchView(show: $showJobSearchView)
                    } else {
                        ScrollView {
                            SearchAndFilterBar()
                                .onTapGesture {
                                    withAnimation {
                                        showJobSearchView.toggle()
                                    }
                                }
                            
                            LazyVStack(spacing: 32) {
                                ForEach(0 ... 10, id: \.self) { listing in
                                    NavigationLink(value: listing) {
                                        ListingItemView()
                                            .frame(height: 400)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Int.self) { listing in
                            ListingDetailView()
                                .navigationBarBackButtonHidden()
                        }
                    }
                }
                
                // Floating Map Button
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: MapView()) {
                            HStack(spacing: 8) { // Adjust spacing here
                                Image(systemName: "mappin.and.ellipse.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Text("Map")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 12) // Adjust horizontal padding
                            .padding(.vertical, 8)   // Adjust vertical padding
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 4)
                        }
                        .padding(.horizontal, 140)
                        .padding(.vertical, 15)// Adjust padding to control position
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

// Example MapView to be navigated to
//struct MapView: View {
//    var body: some View {
//        Text("Map View")
//            .font(.largeTitle)
//    }
//}


