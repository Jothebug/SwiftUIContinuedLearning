//
//  ArraysBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 16/10/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
// sort
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
//        filteredArray = dataArray.sorted(by: {$0.points < $1.points})
        
// filter
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
//        filteredArray = dataArray.filter({ $0.isVerified })
        
// map
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name
//        })
//        mappedArray = dataArray.map({$0.name})
//        mappedArray = dataArray.compactMap({ (user) -> String? in
//            return user.name
//        })
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({$0.isVerified})
            .compactMap({$0.name})
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Josephine", points: 5, isVerified: true)
        let user2 = UserModel(name: nil, points: 6, isVerified: true)
        let user3 = UserModel(name: "Tom", points: 1, isVerified: false)
        let user4 = UserModel(name: "Ben", points: 0, isVerified: false)
        let user5 = UserModel(name: "Hassley", points: 8, isVerified: true)
        let user6 = UserModel(name: "Assely", points: 2, isVerified: false)
        let user7 = UserModel(name: "Bob", points: 9, isVerified: true)
        let user8 = UserModel(name: "Chris", points: 3, isVerified: false)
        let user9 = UserModel(name: "Anna", points: 9, isVerified: true)
        let user10 = UserModel(name: "Penny", points: 3, isVerified: false)
        
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
    }
    
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.mappedArray, id: \.self) { user in
                    Text(user)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
        .environmentObject(ArrayModificationViewModel())
}
