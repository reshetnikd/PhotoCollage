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
            VStack(alignment: .center) {
                HStack {
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                .padding(.horizontal, 2)
                .padding(.top, 2)
                
                HStack {
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    Rectangle()
                        .fill(Color.secondaryGray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 2)
            }
            .frame(width: innerSize.width, height: innerSize.height, alignment: .center)
            .clipShape(ContainerRelativeShape())
        }
        .frame(width: outerSize.width, height: outerSize.height, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct SmallWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var viewState = CGSize.zero
    @State var isShowingLayout = false
    
    var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: 80)
                    
                    LayoutView(innerSize: CGSize(width: 100, height: 100), outerSize: CGSize(width: 110, height: 110))
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            self.isShowingLayout = true
                                            self.viewState = .zero
                                        }
                                    
                                    Image(systemName: "aspectratio")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Layout")
                                    .foregroundColor(.white)
                            }
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            // Photo gallery
                                        }
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Photos")
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width, height: 200, alignment: .center)
                        .background(Color.primaryGray)
                        .cornerRadius(24, corners: [.topLeft, .topRight])
                        
                        if isShowingLayout {
                            Group {
                                Color.secondaryGray
                                
                                HStack {
                                    LayoutView(innerSize: CGSize(width: 70, height: 70), outerSize: CGSize(width: 80, height: 80))
                                        .overlay(RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.secondaryGray, lineWidth: 2))
                                    LayoutView(innerSize: CGSize(width: 70, height: 70), outerSize: CGSize(width: 80, height: 80))
                                        .overlay(RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.secondaryGray, lineWidth: 2))
                                    LayoutView(innerSize: CGSize(width: 70, height: 70), outerSize: CGSize(width: 80, height: 80))
                                        .overlay(RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.secondaryGray, lineWidth: 2))
                                    LayoutView(innerSize: CGSize(width: 70, height: 70), outerSize: CGSize(width: 80, height: 80))
                                        .overlay(RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.secondaryGray, lineWidth: 2))
                                }
                            }
                            .frame(width: geometry.size.width, height: 200, alignment: .center)
                            .background(Color.primaryGray)
                            .cornerRadius(24, corners: [.topLeft, .topRight])
                            .offset(y: viewState.height)
                            .animation(.spring())
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if value.startLocation.y < value.location.y {
                                            self.viewState = value.translation
                                        }
                                    }
                                    .onEnded { value in
                                        if self.viewState.height > 100 {
                                            self.viewState = CGSize(width: 0, height: 800)
                                        } else {
                                            self.viewState = .zero
                                        }
                                    }
                            )
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Widget", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

struct MediumWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: 80)
                    
                    LayoutView(innerSize: CGSize(width: 200, height: 100), outerSize: CGSize(width: 210, height: 110))
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Image(systemName: "aspectratio")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Layout")
                                    .foregroundColor(.white)
                            }
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Photos")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: 200, alignment: .center)
                    .background(Color.primaryGray)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                }
            }
        }
        .navigationBarTitle("Widget", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

struct LargeWidgetSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black
            
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: 80)
                    
                    LayoutView(innerSize: CGSize(width: 200, height: 200), outerSize: CGSize(width: 210, height: 210))
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Image(systemName: "aspectratio")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Layout")
                                    .foregroundColor(.white)
                            }
                            
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.secondaryGray)
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .padding(.horizontal, 8)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Photos")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: 200, alignment: .center)
                    .background(Color.primaryGray)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                }
            }
        }
        .navigationBarTitle("Widget", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension Color {
    static let primaryGray = Color("primaryGray")
    static let secondaryGray = Color("secondaryGray")
}
