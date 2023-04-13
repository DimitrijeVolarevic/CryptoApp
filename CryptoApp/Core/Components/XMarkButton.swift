//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 13.4.23..
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            action?()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
