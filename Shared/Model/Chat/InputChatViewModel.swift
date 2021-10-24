//
//  InputChatViewModel.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/24.
//

import SwiftUI
import Combine

class InputChatViewModel: ObservableObject {
    
    @Published var text: String = ""
    
    @Published var isEnableAddButton = true
    
    private var cancelable: Set<AnyCancellable> = []
    
    init() {
        didChengeText()
    }
    
    private func didChengeText() {
        $text
            .sink(receiveValue: { value in
                if value.isEmpty {
                    self.isEnableAddButton = true
                } else {
                    self.isEnableAddButton = false
                }
            })
            .store(in: &cancelable)
    }
}
