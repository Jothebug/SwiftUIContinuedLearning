//
//  FileManagerBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 30/10/24.
// 36.33

import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            print("error getting data.")
            return
        }
        
        do {
            try data.write(to: path)
            print("success saving")
        } catch let error {
            print("error saving \(error)")
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path) else {
            print("Failed in deleteImage")
            return
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Success delete")
        } catch let error {
            print("Error deleting image. \(error)")
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathExtension("\(name).jpg") else {
            print("error getting path")
            return nil
        }
        return path
    }
    
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "dog-img"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetFolder1()
    }
    
    func getImageFromAssetFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromAssetFolder1() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        manager.deleteImage(name: imageName)
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
                
                HStack {
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
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete to FM")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
