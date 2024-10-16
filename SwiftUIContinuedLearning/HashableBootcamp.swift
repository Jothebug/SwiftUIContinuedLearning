//
//  HashableBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 16/10/24.
//

import SwiftUI

//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

struct MyCustomModel: Hashable {
    let title: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
                ForEach(data, id: \.self) { item in
                    Text(item.title.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
