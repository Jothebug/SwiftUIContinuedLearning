//
//  MultipleSheetsBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 12/10/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// ways to create multiple shests
// 1 - use a binding
// 2 - use multiple .sheets => the prerequisite condition is the same hierarchy
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel? = nil
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
    //            use multiple sheets
    //            Button("Button 1") {
    //                showSheet1.toggle()
    //            }
    //            .sheet(isPresented: showSheet1, content: {
    //                NextScreen(selectedModel: RandomModel(title: "ONE"))
    //            })
    //
    //            Button("Button 2") {
    //                showSheet2.toggle()
    //            }
    //            .sheet(isPresented: $showSheet2, content: {
    //                NextScreen(selectedModel: RandomModel(title: "TWO"))
    //            })
                
                // use $item
                ForEach(0..<30) {index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }
}

struct NextScreen: View {
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
