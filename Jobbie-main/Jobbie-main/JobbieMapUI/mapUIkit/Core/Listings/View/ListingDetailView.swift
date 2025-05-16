import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isResponsibilitiesExpanded = false
    @State private var isQualificationsExpanded = false
    @State private var isHoursExpanded = false
    @State private var isPaymentExpanded = false
    @State private var isContactExpanded = false
    
    @State private var showChatView = false // State variable for showing chat view
    
    // Define the region to show on the map with coordinates for Trichy Railway Station
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10.7905, longitude: 78.7104), // Trichy Railway Station coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) // Adjust the span for zoom level
    )
    
    // Define a custom struct for the map annotation
    struct Location: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    // Create an array with one Location object for the annotation
    private var locations: [Location] {
        [Location(coordinate: CLLocationCoordinate2D(latitude: 10.7905, longitude: 78.7104))]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ZStack(alignment: .topLeading) {
                        ListingImageCarouselView()
                            .frame(height: 320)
                        
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
                                .padding(32)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Lawn Mowing")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 2) {
                                Text("₹200")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            
                            Text("Railway Station, Trichy")
                        }
                        .font(.caption)
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    // Host info view
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("This job is hosted by the Trichy Railway Station Management")
                                .font(.headline)
                                .frame(width: 250, alignment: .leading)
                        }
                        .frame(width: 300, alignment: .leading)
                        
                        Spacer()
                        
                        Image("profilepic")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                    .padding()
                    
                    Divider()
                    
                    // Listing features
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(0 ..< 2) { _ in
                            HStack(spacing: 12) {
                                Image(systemName: "lock.shield.fill")
                                
                                VStack(alignment: .leading) {
                                    Text("Verified Host")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    Text("Verified Hosts provide security and guaranteed payment upon job completion.")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Job Description")
                            .font(.headline)
                        
                        DisclosureGroup("Responsibilities", isExpanded: $isResponsibilitiesExpanded) {
                            VStack(alignment: .leading, spacing: 8) {
                                BulletText(text: "Mow a 100 sq. meter lawn.")
                                BulletText(text: "Operate and maintain lawn mowing equipment.")
                                BulletText(text: "Remove debris and report any lawn issues.")
                            }
                            .font(.body)
                            .padding(.leading)
                        }
                        
                        DisclosureGroup("Qualifications", isExpanded: $isQualificationsExpanded) {
                            VStack(alignment: .leading, spacing: 8) {
                                BulletText(text: "Experience preferred but not required.")
                                BulletText(text: "Ability to operate equipment and work outdoors.")
                            }
                            .font(.body)
                            .padding(.leading)
                        }
                        
                        DisclosureGroup("Hours", isExpanded: $isHoursExpanded) {
                            VStack(alignment: .leading, spacing: 8) {
                                BulletText(text: "1 - 2 hours")
                            }
                            .font(.body)
                            .padding(.leading)
                        }
                        
                        DisclosureGroup("Payment", isExpanded: $isPaymentExpanded) {
                            VStack(alignment: .leading, spacing: 8) {
                                BulletText(text: "₹200 upon completion.")
                                BulletText(text: "Digital payment option available.")
                            }
                            .font(.body)
                            .padding(.leading)
                        }
                        
                        DisclosureGroup("Contact", isExpanded: $isContactExpanded) {
                            VStack(alignment: .leading, spacing: 8) {
                                BulletText(text: "For more details, call 9876543210.")
                            }
                            .font(.body)
                            .padding(.leading)
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Location")
                            .font(.headline)
                        
                        Map(coordinateRegion: $region, annotationItems: locations) { location in
                            MapAnnotation(coordinate: location.coordinate) {
                                Image(systemName: "pin.fill")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                }
                .toolbar(.hidden, for: .tabBar)
                .ignoresSafeArea()
                .padding(.bottom, 64)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        // Floating message button
                        NavigationLink(destination: ChatView()) {
                            Image(systemName: "ellipsis.message.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                    
                    // Bottom overlay section with Apply button
                    HStack {
                        VStack(alignment: .leading) {
                            Text("₹200")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Aug 15")
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        Button {
                            // Add action for Apply button
                        } label: {
                            Text("Apply")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.orange)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal, 32)
                    .background(.white)
                }
            }
            .navigationTitle("Back") // Set navigation title
            .navigationBarHidden(true) // Hide default navigation bar
        }
    }
}

struct BulletText: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("•")
                .font(.body)
                .frame(width: 20, alignment: .leading)
            Text(text)
                .font(.body)
        }
    }
}

struct ChatView: View {
    @State private var message: String = "" // State variable to hold the text input
    @State private var messages: [Message] = [] // State variable to hold the list of messages
    @FocusState private var isInputActive: Bool // Focus state for the TextField

    var body: some View {
        VStack {
            Text("Chat with Host")
                .font(.title)
                .padding()
            
            // Display chat messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(messages) { msg in
                        HStack {
                            if msg.isReceived {
                                Text(msg.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            } else {
                                Spacer()
                                Text(msg.text)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
                }
                .padding()
            }
            
            // Text input field and Send button
            HStack {
                TextField("Type your message...", text: $message)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .focused($isInputActive) // Bind the focus state here
                    .onTapGesture {
                        isInputActive = true // Make sure the TextField gains focus when tapped
                    }
                
                Button(action: sendMessage) {
                    Text("Send")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
            }
            .padding()
        }
        .navigationTitle("Chat")
        .navigationBarBackButtonHidden(false) // Ensures back button is visible
    }
    
    private func sendMessage() {
        guard !message.isEmpty else { return }
        
        // Append the message to the list of messages
        messages.append(Message(text: message, isReceived: false))
        
        // Clear the text field after sending
        message = ""
        
        // Simulate receiving a response from the host
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(Message(text: "Message received!", isReceived: true))
        }
        
        // Optionally, you can add logic to send the message to a server here
        print("Message sent: \(messages.last?.text ?? "")")
    }
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isReceived: Bool // Indicates whether the message is received or sent
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}



struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView()
    }
}


