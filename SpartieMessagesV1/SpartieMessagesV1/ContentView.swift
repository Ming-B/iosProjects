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
    dateFormatter.timeStyle = .short
    
    dateFormatter.locale = Locale(identifier: "en_US")
    
    let formattedDate = dateFormatter.string(from: date)
    
    return formattedDate
    
}



struct MessageView: View{
    let message:Message
    
    var body: some View {
        HStack{
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text(message.message)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15.0)
                    .foregroundStyle(.white)
                
                Text(getDateFormat(date: message.date))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding()
            
        }
    }
}


struct ContentView: View {
    @State private var messageList: [Message] = []
    @State private var newMessage:String = ""
    
    var body: some View {
        VStack{
            List(messageList){ message in
                MessageView(message: message)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            
            HStack{
                TextField("Mesage", text:$newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.clear)
                    .onSubmit {
                        sendMessage()
                    }

                
                Button(action: sendMessage){
                    Image(systemName: "paperplane")
                }
            }
            
            .padding()

            
            
        }
        
    }
    private func sendMessage(){
        guard !newMessage.isEmpty else {
            return
        }
        
        
        let messagetobeSent = Message(message: newMessage)
        
        messageList.append(messagetobeSent)
        newMessage = ""
        
    }

}







#Preview {
    ContentView()
}



