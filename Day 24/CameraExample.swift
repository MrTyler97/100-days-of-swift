//
//  ContentView.swift
//  Camera Examples
//
//  Created by Vic  on 5/22/25.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    // holds selected photo Item
    @State private var selectedItem: PhotosPickerItem?
    // Hold loaded image
    @State private var selectedImage: UIImage?
    // Camera Sheet visability
    @State private var showingCamera = false

    var body: some View {
        ZStack {
            //Color.indigo.ignoresSafeArea()
            LinearGradient(
                colors: [.white, .black], startPoint: .topLeading, endPoint: .bottomTrailing
            ).ignoresSafeArea()
            VStack {
                Spacer()
                // display selected image |  unwrap the image of not nil
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(30)
                        .padding()
                } else {
                    Text("No image selected")
                        .foregroundStyle(.secondary)
                        .padding()
                        .frame(width: 300, height: 300)
                        .background(.ultraThinMaterial)
                        .cornerRadius(30)
                }
                Spacer()
                Button(action: {
                    showingCamera = true
                }) {
                    Text("Open Camera")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.pink.gradient)
                        .cornerRadius(30)
                }
                // A modal sheet in SwiftUI is a view that pops up over your current interface to present additional content or functionality. In this case the camera screen.
                .sheet(isPresented: $showingCamera) {
                    CameraView(image: $selectedImage)
                }
                // Photo picker button | matching: -> only choose images | photoLibrary ->
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Choose Image")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.cyan.gradient)
                        .cornerRadius(30)
                }
                // onChange(of: selectedItem) -> Watches the @State variable selectedItem. Whenever selectedItem changes (i.e. the user picks a photo), this closure is invoked with the new value
                .onChange(of: selectedItem) { newitem in
                    // Handle new item | if let unwraps this value
                    if let newitem = newitem {
                        // Use task to call await so nested code can work asynchronously
                        Task {
                            // Load raw data of image then convert it
                            if let data = try? await newitem.loadTransferable(type: Data.self),
                                let image = UIImage(data: data)
                            {
                                selectedImage = image  // Update elected image
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
