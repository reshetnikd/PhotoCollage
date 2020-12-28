//
//  ContentView.swift
//  PhotoCollage
//
//  Created by Dmitry Reshetnik on 28.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.black
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text("Present!")
                    .foregroundColor(.white)
            })
            .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
        }
        .ignoresSafeArea(.all)
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                Text("Settings")
                    .foregroundColor(.white)
                    .navigationBarTitle("Widget", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Label("More", systemImage: "ellipsis")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Label("Download", systemImage: "square.and.arrow.down")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ToolbarItem(placement: .navigation) {
                            Label("Close", systemImage: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                        }
                    }
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
      
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .black
        standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.backgroundColor = .black
        compactAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        compactAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = .black
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationBar.standardAppearance = standardAppearance
        navigationBar.compactAppearance = compactAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }
}
