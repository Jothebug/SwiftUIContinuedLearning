//
//  CodableBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 26/10/24.
//

import SwiftUI

// Codable = Decodable + Encodable
// if conform code for Codable protocol, don't need any code for implementing decoding and encoding.
// the only thing needed is declare CustomModel struct

struct CustomModel: Identifiable, Decodable, Encodable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isPremium, forKey: .isPremium)
    }
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomModel?  = nil
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else {return}
        
//        do {
//            self.customer = try JSONDecoder().decode(CustomModel.self, from: data)
//        } catch let error {
//            print("Error coding. \(error)")
//        }
        // short way
        self.customer = try? JSONDecoder().decode(CustomModel.self, from: data)
    }
    
    func getJSONData() -> Data? {
        let customer = CustomModel(id: "1111", name: "Josephine", points: 2, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
        return jsonData
        
    }
    
}

struct CodableBootcamp: View {
    
@StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
