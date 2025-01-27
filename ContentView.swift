//
//  ContentView.swift
//  SpartieMessagesV1
//
//  Created by Ming on 1/27/25.
//

import SwiftUI
import Foundation

struct Message : Identifiable {
    var message : String
    var date : Date
    var id = UUID()
    
    init(message: String) {
        self.message = message
        self.date = Date()
    }
    
}

func getDateFormat(date:Date) -> String {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .medium
    
    dateFormatter.locale = Locale(identifier: "en_US")
    
    
    let newFormattedDate = dateFormatter.string(from: date)
    
    return newFormattedDate
    
    
}


struct ContentView: View {
    @State private var messages: [Message] = [
        Message(message: "hello?"),
        Message(message: "is this thing on?"),
        Message(message: "I would like to create an app that is useful for people"),
        Message(message: "Maybe an app where people on campus can chat with each other?")
    ]
    
    @State private var newMessage:String = ""
    
    var body: some View {
        VStack {
            List{
                
            }

        }
        .padding()
    }
}

struct MessageView: View {
    var message : Message
    
    var body: some View {
        VStack{
            Text(message.message)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(30.0)
                .foregroundStyle(.white)
            
            Text(getDateFormat(date: message.date))
                .font(.footnote)
                .foregroundStyle(.gray)
            
        }
        .padding()
    }
}







#Preview {
    ContentView()
}

