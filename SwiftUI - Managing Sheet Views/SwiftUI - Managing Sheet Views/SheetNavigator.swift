//
//  SheetNavigator.swift
//  SwiftUI - Managing Sheet Views
//
//  Created by Can Balkaya on 6/29/21.
//

import SwiftUI

class SheetNavigator: ObservableObject {
    
    // MARK: Enumerations
    enum SheetDestination: CaseIterable {
        case firstView
        case secondView

        // MARK: - Methods
        @ViewBuilder
        func view(firstView: AnyView, secondView: AnyView) -> some View {
             switch self {
             case .firstView:
                 firstView
             case .secondView:
                 secondView
            }
        }
    }
    
    // MARK: - Properties
    @Published var sheetDestination: SheetDestination = .firstView
}

