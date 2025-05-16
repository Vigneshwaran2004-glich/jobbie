import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) private var dismiss // Access the dismiss action
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?

    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $cameraPosition, selection: $mapSelection) {
                    Annotation("My location", coordinate: .userLocation) {
                        ZStack {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.blue.opacity(0.25))

                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)

                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.blue)
                        }
                    }
                    ForEach(results, id: \.self) { item in
                        let placemark = item.placemark
                        Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                    }
                    if let route = route {
                        MapPolyline(route.polyline)
                            .stroke(.blue, lineWidth: 6)
                    }
                }
                .navigationBarBackButtonHidden(true) // Hide the default back button
                
                // Custom back button
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                                .background {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 32, height: 32)
                                }
                                .padding(16)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top) // Add padding to position the button
                .padding(.horizontal, 20) // Adjust horizontal padding if needed
                
                // Search TextField overlay
                .overlay(alignment: .top) {
                    TextField("search for a location...", text: $searchText)
                        .font(.subheadline)
                        .padding(12)
                        .background(.white)
                        .padding()
                        .shadow(radius: 10)
                }
                .onSubmit(of: .text) {
                    Task { await searchPlace() }
                }
                .onChange(of: getDirections) { newValue in
                    if newValue {
                        fetchRoute()
                    }
                }
                .onChange(of: mapSelection) { newValue in
                    showDetails = newValue != nil
                }
                .sheet(isPresented: $showDetails) {
                    LocationDetailsview(mapSelection: $mapSelection, show: $showDetails)
                        .presentationDetents([.height(340)])
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                        .presentationCornerRadius(12)
                }
                .mapControls {
                    MapCompass()
                    MapUserLocationButton()
                }
            }
        }
    }

    func searchPlace() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion

        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }

    func fetchRoute() {
        if let mapSelection = mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                
                withAnimation(.snappy) {
                    routeDisplaying = true
                    showDetails = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 25.7602, longitude: -80.1959)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

#Preview {
    ContentView()
}

