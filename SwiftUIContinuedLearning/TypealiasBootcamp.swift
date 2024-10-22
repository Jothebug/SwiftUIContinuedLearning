//
//  TypealiasBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 22/10/24.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
    @State var item: MovieModel = MovieModel(title: "Title", director: "Jo", count: 4)
    @State var itemTVModel: TVModel = TVModel(title: "Title", director: "Josephine", count: 4)
    
    var body: some View {
        VStack {
            Text(itemTVModel.title)
            Text(itemTVModel.director)
            Text("\(itemTVModel.count)")
        }
    }
}

#Preview {
    TypealiasBootcamp()
}
