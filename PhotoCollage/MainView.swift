//
//  ContentView.swift
//  PhotoCollage
//
//  Created by Dmitry Reshetnik on 28.12.2020.
//

import SwiftUI

enum WidgetSize {
    case small, medium, large
}

enum CollageLayout {
    case oneOnTopOneOnBottom, oneOnTopTwoOnBottom, twoOnTopOneOnBottom, oneOnLeftOneOnRight, oneOnLeftTwoOnRight, twoOnLeftOneOnRight, twoOnLeftTwoOnRight
}

class WidgetSettings: ObservableObject {
    @Published var size: WidgetSize = .small
    @Published var layout: CollageLayout = .twoOnLeftTwoOnRight
    @Published var photos: [String] = []
}

struct MainView: View {
    @EnvironmentObject var settings: WidgetSettings
    @State private var isSmallSelected = false
    @State private var isMediumSelected = false
    @State private var isLargeSelected = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                
                LayoutView(innerSize: CGSize(width: 100, height: 100), outerSize: CGSize(width: 110, height: 110))
                    .fullScreenCover(isPresented: $isSmallSelected, content: FullScreenModalView.init)
                    .onTapGesture {
                        self.isSmallSelected.toggle()
                        self.settings.size = .small
                }
                
                Spacer()
                
                LayoutView(innerSize: CGSize(width: 200, height: 100), outerSize: CGSize(width: 210, height: 110))
                    .fullScreenCover(isPresented: $isMediumSelected, content: FullScreenModalView.init)
                    .onTapGesture {
                        self.isMediumSelected.toggle()
                        self.settings.size = .medium
                    }
                
                Spacer()
                
                LayoutView(innerSize: CGSize(width: 200, height: 200), outerSize: CGSize(width: 210, height: 210))
                    .fullScreenCover(isPresented: $isLargeSelected, content: FullScreenModalView.init)
                    .onTapGesture {
                        self.isLargeSelected.toggle()
                        self.settings.size = .large
                    }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct FullScreenModalView: View {
    @EnvironmentObject var settings: WidgetSettings
    
    var body: some View {
        NavigationView {
            if settings.size == .small {
                SmallWidgetSettingsView()
            } else if settings.size == .medium {
                MediumWidgetSettingsView()
            } else if settings.size == .large {
                LargeWidgetSettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WidgetSettings())
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

struct LayoutView: View {
    let innerSize: CGSize
    let outerSize: CGSize
    
    var body: some View {
        ZStack {
            Color.primaryGray
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                HStack {
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                }
                .padding(.horizontal, 2)
                .padding(.top, 2)
                
                HStack {
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 2)
            }
            .frame(width: innerSize.width, height: innerSize.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(ContainerRelativeShape())
        }
        .frame(width: outerSize.width, height: outerSize.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

struct SmallWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black
            Text("Small Widget Settings")
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

struct MediumWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black
            Text("Medium Widget Settings")
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

struct LargeWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black
            Text("Large Widget Settings")
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

extension Color {
    static let primaryGray = Color("primaryGray")
    static let secondaryGray = Color("secondaryGray")
}
