//
//  ContentView.swift
//  CrimeStopper
//
//  Created by Randy Fong on 11/4/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var crimeData: CrimeData = staticCrimeData[1]
    var body: some View {
            HStack {
                VStack {
                    CrimeDetail(crimeData: crimeData)
                }
                .frame(width: 350, height: 750)
                .background(.red)
                VStack {
                    Map {
                        Annotation("",
                                   coordinate: CLLocationCoordinate2D(latitude: 37.78858, longitude: -122.40766), anchor: .bottom) {
                            VStack {
                                Button {
                                    withAnimation {
                                        crimeData = staticCrimeData[3]
                                    }
                                } label: {
                                    Image(systemName:  "dollarsign")
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(.red).opacity(0.5))
                        }
                    
                        Annotation("",
                                   coordinate: CLLocationCoordinate2D(latitude: 37.78947, longitude: -122.40591), anchor: .bottom) {
                            VStack {
                                Button {
                                    withAnimation {
                                        crimeData = staticCrimeData[2]
                                    }
                                } label: {
                                    Image(systemName:  "car.front.waves.up")
                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(.green).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
                        }
  
                        Annotation("", coordinate: CLLocationCoordinate2D(latitude: 37.78748, longitude: -122.40652), anchor: .bottom) {
                            VStack {
                                Button {
                                    withAnimation {
                                        crimeData = staticCrimeData[1]
                                    }
                                } label: {
                                    Image(systemName:  "dollarsign")
                                }
                            }
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(.red).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
                    }
                    }
                }
                .frame(width: 800, height: 700)
                .background(.blue)
            }
    }
}

struct CrimeDetail: View {
    let crimeData: CrimeData
    var body: some View {
        VStack {
            List {
                Section {
                    Text(crimeData.title)
                        .font(.title)
                }
                Section {
                    Text(crimeData.summary)
                    .font(.body)
                        .lineLimit(nil)
                        .padding(.bottom, 5)
                }
                
                Section {
                    CrimePhotos(photos: crimeData.photos)
                }
                
                Section {
                    CrimeMessages(messages: crimeData.messages)
                }
            }
        }
    }
}

struct CrimePhotos: View {
    let photos: [String]
    
    let columns = [
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(photos, id: \.self) { item in
                    VStack {
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 110, height: 110)
                    }
                }
            }
            .padding(.horizontal)
    }
    
}

struct CrimeMessages: View {
    let messages: [Message]
    
    var body: some View {
        VStack {
            ForEach(messages) { m in
                CrimeMessageDetail(message: m)
                Divider()
            }
        }

    }
}

struct CrimeMessageDetail: View {
    let message: Message
    
    var body: some View {
        VStack {
                HStack(alignment: .firstTextBaseline) {
                    Text(message.time)
                    Text(message.name)
                    Spacer()
                    Text(message.language)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(message.phone)
                }
                .font(.footnote)
                .fontWeight(.semibold)
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(message.description)
                        .font(.footnote)
                        .fontWeight(.light)
                        .frame(width: 280, height: 40)
                        .lineLimit(nil)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
            }
//            .frame(width: 280, height: 500)
        }
}

let staticCrimeData = [ CrimeData(id: 0,
                            title: "Select from map",
                            summary: "",
                            coordinate: CLLocationCoordinate2D(latitude: 37.78748, longitude: -122.40652),
                            photos: [],
                            messages: []),
                  CrimeData(id: 1,
                                              title: "Theft",
                                              summary: "Multiple theft and robbery reports were made in the area of Neiman Marcus between 3:20pm and 3:35pm. A masked man robbed a store and fled in a white car; a black mercedes getaway car was seen with license plate CA9999; people looted Neiman Marcus in a white Toyota Corolla; a man with a pistol was seen with expensive watches.",
                                              coordinate: CLLocationCoordinate2D(latitude: 37.78748, longitude: -122.40652),
                                              photos: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                                              messages: [Message(time: "320p", name: "Jenny S", phone: "415.222.2222", description: "Masked man 6 feet tall with white sweatshirt and black shoes carrying purses."),
                                                         Message(time: "326p", name: "Jorge G", language: "Spanish", phone: "415.123.4567", description: "White Car loaded with purses stolen from store heading down Geary."),
                                                         Message(time: "328p", name: "Gina S", phone: "415.333.3333", description: "License plate of the black mercedes getaway car is CA9999 around 5 passengers."),
                                                         Message(time: "332p", name: "John M", phone: "415.323.1212", description: "I saw a number people looting Neiman Marcus and leaving in a white Toyota Corolla."),
                                                         Message(time: "335p", name: "Cary C", phone: "408.321.1212", description: "In front of Neiman Marcus there is a man with a pistol with handful of expensive watches."),
                                                        ]),
                  CrimeData(id: 2,
                                              title: "Car Break In",
                                              summary: "A white car was broken into at 145p. The luggage from the broken into car was left at the Ikon Hotel front desk at 150p.",
                                              coordinate: CLLocationCoordinate2D(latitude: 37.78947, longitude: -122.40591),
                                              photos: ["21", "22"],
                            messages: [Message(time: "145p", name: "Chan L", language: "Cantonese", phone: "408.332.1112", description: "Saw a couple of guys break into a white car. They parked next to it and immediately smashed the window."),
                                                         Message(time: "150p", name: "Terry B", phone: "415.123.6688", description: "A car parked in front of the Ikon Hotel got broken into and the some of the luggage was dropped on the sidewalk. I packed it up and left it work the hotel front desk."),
                                                        ]),
                  CrimeData(id: 3,
                                              title: "Theft",
                                              summary: "The manager of Tiffany's reported a robbery at 12:10pm and a witness saw the suspects flee in a silver car at 12:23pm.",
                                              coordinate: CLLocationCoordinate2D(latitude: 37.78858, longitude: -122.40766),
                                              photos: ["31", "32"],
                                              messages: [Message(time: "1210p", name: "Wei Z", phone: "415.331.2211", description: "I am the manager at Tiffanys and 3 people came in and stole from our jewelry case"),
                                                         Message(time: "1223p", name: "Han H", phone: "415.999.6666", description: "I was walking in Union Square and saw a robbery at Tiffanys where they got away in the silver car in the bottom right of the photo."),
                                                        ]),
]

struct Message: Identifiable {
    let id = UUID()
    let time: String
    let name: String
    let language: String
    let phone: String
    let description: String
    
    init(time: String, name: String, language: String = "", phone: String, description: String) {
        self.time = time
        self.name = name
        self.language = language
        self.phone = phone
        self.description = description
    }
}

class CrimeData: Identifiable, ObservableObject {
    @Published var id: Int
    @Published var title: String
    @Published var summary: String
    @Published var coordinate: CLLocationCoordinate2D
    @Published var photos: [String]
    @Published var messages: [Message]
    
    init(id: Int, title: String, summary: String, coordinate: CLLocationCoordinate2D, photos: [String], messages: [Message]) {
        self.id = id
        self.title = title
        self.summary = summary
        self.coordinate = coordinate
        self.photos = photos
        self.messages = messages
    }
}

 

