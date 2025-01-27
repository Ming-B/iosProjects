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
    
    func getDateFormat(date:Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        
        let newFormattedDate = dateFormatter.string(from: date)
        
        return newFormattedDate
        
        
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}







#Preview {
    ContentView()
}

