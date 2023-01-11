//
//  Extensions.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
