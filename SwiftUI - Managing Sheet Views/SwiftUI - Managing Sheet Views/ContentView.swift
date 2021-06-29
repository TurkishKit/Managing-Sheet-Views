//
//  ContentView.swift
//  SwiftUI - Managing Sheet Views
//
//  Created by Can Balkaya on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - View
    var body: some View {
        TabView {
            OldExampleView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Old Example")
                }
            
            NewExampleView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("New Example")
                }
            
            MultipleExampleView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Multiple Example")
                }
        }
    }
}

struct OldExampleView: View {
    
    // MARK: - Properties
    @State private var showingSheet = false
    
    // MARK: - View
    var body: some View {
        VStack {
            Button("Show Sheet", action: { showingSheet = true })
        }
        .sheet(isPresented: $showingSheet) {
            OldExampleSheetView()
        }
    }
}

struct NewExampleView: View {
    
    // MARK: - Properties
    @State private var showingSheet = false
    
    // MARK: - View
    var body: some View {
        VStack {
            Button("Show Sheet", action: { showingSheet = true })
        }
        .sheet(isPresented: $showingSheet) {
            NewExampleSheetView()
        }
    }
}


struct MultipleExampleView: View {
    
    // MARK: - Properties
    @State private var showingSheet = false
    @ObservedObject var sheetNavigator = SheetNavigator()
    
    // MARK: - View
    var body: some View {
        VStack {
            Button("First") {
                sheetNavigator.sheetDestination = .firstView
                showingSheet = true
            }
            
            Button("Second") {
                sheetNavigator.sheetDestination = .secondView
                showingSheet = true
            }
        }
        .sheet(isPresented: $showingSheet) {
            sheetNavigator.sheetDestination.view(
                firstView: FirstSheetView().toAnyView(),
                secondView: SecondSheetView().toAnyView()
            )
        }
    }
}

struct OldExampleSheetView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct NewExampleSheetView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View
    var body: some View {
        Button("Cancel", action: dismiss.callAsFunction)
    }
}

struct FirstSheetView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View
    var body: some View {
        VStack {
            Text("First")
            Button("Cancel", action: dismiss.callAsFunction)
        }
    }
}

struct SecondSheetView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View
    var body: some View {
        VStack {
            Text("Second")
            Button("Cancel", action: dismiss.callAsFunction)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
