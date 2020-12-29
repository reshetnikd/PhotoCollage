//
//  PhotoCollageWidgetView.swift
//  PhotoCollageWidgetExtension
//
//  Created by Dmitry Reshetnik on 28.12.2020.
//

import SwiftUI

struct PlaceholderCollageView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            HStack {
                Rectangle()
                    .fill(Color.secondaryGray)
                    .clipShape(ContainerRelativeShape())
            }
            
            HStack {
                Rectangle()
                    .fill(Color.secondaryGray)
                    .clipShape(ContainerRelativeShape())
                Rectangle()
                    .fill(Color.secondaryGray)
                    .clipShape(ContainerRelativeShape())
            }
        }
        .redacted(reason: .placeholder)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct OneOnTopTwoOnBottomCollageView: View {
    var photos: [String]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(photos[0])
                .resizable()
                .clipShape(ContainerRelativeShape())
            
            HStack {
                Image(photos[1])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                Image(photos[2])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct OneOnLeftOneOnRightCollageView: View {
    var photos: [String]
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(photos[0])
                .resizable()
                .clipShape(ContainerRelativeShape())
            
            Image(photos[1])
                .resizable()
                .clipShape(ContainerRelativeShape())
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct OneOnTopOneOnBottomCollageView: View {
    var photos: [String]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(photos[0])
                .resizable()
                .clipShape(ContainerRelativeShape())
            Image(photos[1])
                .resizable()
                .clipShape(ContainerRelativeShape())
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct TwoOnLeftTwoOnRightCollageView: View {
    var photos: [String]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            HStack {
                Image(photos[0])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                Image(photos[1])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
            
            HStack {
                Image(photos[2])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                Image(photos[3])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct OneOnLeftTwoOnRightCollageView: View {
    var photos: [String]
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Image(photos[0])
                .resizable()
                .clipShape(ContainerRelativeShape())
            
            VStack {
                Image(photos[1])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                Image(photos[2])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct TwoOnLeftOneOnRightCollageView: View {
    var photos: [String]
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            VStack {
                Image(photos[0])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                
                Image(photos[1])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
            
            Image(photos[2])
                .resizable()
                .clipShape(ContainerRelativeShape())
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}

struct TwoOnTopOneOnBottomCollageView: View {
    var photos: [String]
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            HStack {
                Image(photos[0])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
                
                Image(photos[1])
                    .resizable()
                    .clipShape(ContainerRelativeShape())
            }
            
            Image(photos[2])
                .resizable()
                .clipShape(ContainerRelativeShape())
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.primaryGray)
    }
}
