//
//  MessageListView.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftUI

struct MessageListView: View {
    
    @StateObject var viewModel = MessageListViewModel()
    
    var body: some View {
        VStack {
            Text("Messages: ")
            List(viewModel.messages) { message in
                Text(message.text)
            }
        }
        .task {
            viewModel.getMessages()
        }
    }
}

// MARK: View

/// Produce a greeting string for the given `subject`.
///
/// ```
/// print(hello("world")) // "Hello, world!"
/// ```
///
/// > Warning: The returned greeting is not localized. To
/// > produce a localized string, use ``localizedHello(_:)``
/// > instead.
///
/// - Parameters:
///     - subject: The subject to be welcomed.
///
/// - Returns: A greeting for the given `subject`.
///

class MessageListViewModel: ObservableObject {
    
    // 2
    var getMessagesUseCase = GetMessagesUseCase(repository: MessageRepositoryImpl(dataSource: MessageDataSourceImpl()))
    
    // 3
    @Published var messages: [Message] = []
    
    // 4
    func getMessages() {
        let result = getMessagesUseCase.execute()
        switch result {
        case .success(let messages):
            self.messages = messages
        case .failure(let error):
            print(error)
        }
    }
}
