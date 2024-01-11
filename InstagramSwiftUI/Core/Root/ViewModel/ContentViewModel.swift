//
//  ContentViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/6/24.
//

import Foundation
import FirebaseAuth
import Combine

@Observable class ContentViewModel {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    var userSession: FirebaseAuth.User?
    var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
