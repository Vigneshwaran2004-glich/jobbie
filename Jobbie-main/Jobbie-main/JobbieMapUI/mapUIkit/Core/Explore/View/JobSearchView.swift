import SwiftUI

enum JobSearchOptions {
    case job
    case dates
    case hours
}

struct JobSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: JobSearchOptions = .job
    @State private var jobDate = Date()
    @State private var numHours = 0
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(){
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                if selectedOption == .job {
                    
                    Text("Job title?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("E.g., Lawn mowing, Painting, etc.", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2.0)
                            .foregroundStyle(Color(.systemGray))
                    }
                    
            } else {
                CollapsedPickerView(title: "What job?", description: "Search near you")
            }
                        }
                        .modifier(CollapsibleDestinationViewModifier())
                        .frame(height: selectedOption == .job ? 120 : 64)
                        .onTapGesture {
                            withAnimation(){ selectedOption = .job }
                        }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When do you want to work?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("Date", selection: $jobDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
           

                    
                } else {
                    CollapsedPickerView(title: "When?", description: "Add date")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 120 : 64)
            .onTapGesture {
                withAnimation() { selectedOption = .dates }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .hours {
                    Text("Hours you would like to work?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numHours) Hours")
                    } onIncrement: {
                        guard numHours < 8 else { return }
                        numHours += 1
                    } onDecrement: {
                        guard numHours > 0 else { return }
                        numHours -= 1
                    }

                    
                } else {
                    CollapsedPickerView(title: "Duration?", description: "Add hours")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .hours ? 120 : 64)
            .onTapGesture {
                withAnimation() { selectedOption = .hours }
            }
            
            Spacer()
        }
    }
}

struct JobSearchView_Previews: PreviewProvider {
    static var previews: some View {
        JobSearchView(show: .constant(false))
            
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
         content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}


struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

