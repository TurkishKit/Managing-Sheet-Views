//
//  View+Ext.swift
//  SwiftUI - Managing Sheet Views
//
//  Created by Can Balkaya on 6/29/21.
//

import SwiftUI

extension View {
    
    // MARK: - Methods
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
