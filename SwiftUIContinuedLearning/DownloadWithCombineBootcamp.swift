//
//  DownloadWithCombineBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 27/10/24.
//

import SwiftUI
import Combine

struct BlogModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [BlogModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getBlogs()
    }
    
    func getBlogs() {
       guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // 1. sign up for monthly subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. recieve the package at your front door
        // 4. make sure the box isn't damaged
        // 5. open and make sure the item is correct
        // 6. use the item
        // 7. cancellable at any time
        
        // 1. create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. subcribe publisher on backgroud thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        // 3. receive on main thread
            .receive(on: DispatchQueue.main)
        // 4. tryMap (check that the data is good)
            .tryMap(handleOutput)
//            .tryMap { (data, response) -> Data in
//                guard
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
        // 5. decode data into BlogModel
            .decode(type: [BlogModel].self, decoder: JSONDecoder())
        // 6. sink (put the item into our app)
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            })
//            .sink { (completion) in
//            } receiveValue: {[weak self] (returnedPosts) in
//                self?.posts = returnedPosts
//            }
        // 7. store (cancel subscription if needed)
            .store(in: &cancellables)
        
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output ) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombineBootcamp: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombineBootcamp()
}
