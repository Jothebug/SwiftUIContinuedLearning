//
//  FileManagerBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 30/10/24.
//

import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard 
            let data = image.jpegData(compressionQuality: 1.0) else {
            print("error getting data.")
            return
        }
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let directory3 = FileManager.default.temporaryDirectory
        
        print(directory)
        print(directory2)
        print(directory3)
        
    }
    
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "dog-img"
    let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        manager.saveImage(image: image, name: imageName)
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                Button(action: {
                    vm.saveImage()
                }, label: {
                    Text("Save to FM")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
