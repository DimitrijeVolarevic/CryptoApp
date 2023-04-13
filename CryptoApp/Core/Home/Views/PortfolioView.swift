//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Dimitrije Volarevic on 13.4.23..
//

import SwiftUI

struct PortfolioView: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("HI")
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
