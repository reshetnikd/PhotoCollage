//
//  PhotoCollageWidget.swift
//  PhotoCollageWidget
//
//  Created by Dmitry Reshetnik on 28.12.2020.
//

import WidgetKit
import SwiftUI

enum CollageLayout {
    case oneOnTopOneOnBottom, oneOnTopTwoOnBottom, twoOnTopOneOnBottom, oneOnLeftOneOnRight, oneOnLeftTwoOnRight, twoOnLeftOneOnRight, twoOnLeftTwoOnRight
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> PhotoCollageEntry {
        PhotoCollageEntry(date: Date(), layout: .oneOnTopTwoOnBottom, photos: PhotosProvider.all())
    }

    func getSnapshot(in context: Context, completion: @escaping (PhotoCollageEntry) -> ()) {
        let entry = PhotoCollageEntry(date: Date(), layout: .oneOnTopTwoOnBottom, photos: PhotosProvider.all())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let entry = PhotoCollageEntry(date: currentDate, layout: .oneOnTopTwoOnBottom, photos: PhotosProvider.all())
        
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct PhotoCollageEntry: TimelineEntry {
    let date: Date
    
    var layout: CollageLayout
    var photos: [String]
}

struct PhotoCollageWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        if !entry.photos.isEmpty {
            switch family {
            case .systemSmall:
                if entry.layout == .oneOnTopTwoOnBottom {
                    OneOnTopTwoOnBottomCollageView(photos: entry.photos)
                } else if entry.layout == .oneOnLeftOneOnRight {
                    OneOnLeftOneOnRightCollageView(photos: entry.photos)
                } else if entry.layout == .oneOnTopOneOnBottom {
                    OneOnTopOneOnBottomCollageView(photos: entry.photos)
                } else if entry.layout == .twoOnLeftTwoOnRight {
                    TwoOnLeftTwoOnRightCollageView(photos: entry.photos)
                }
            case .systemMedium:
                if entry.layout == .twoOnLeftTwoOnRight {
                    TwoOnLeftTwoOnRightCollageView(photos: entry.photos)
                } else if entry.layout == .oneOnLeftTwoOnRight {
                    OneOnLeftTwoOnRightCollageView(photos: entry.photos)
                } else if entry.layout == .twoOnLeftOneOnRight {
                    TwoOnLeftOneOnRightCollageView(photos: entry.photos)
                } else if entry.layout == .oneOnLeftOneOnRight {
                    OneOnLeftOneOnRightCollageView(photos: entry.photos)
                }
            case .systemLarge:
                if entry.layout == .oneOnTopTwoOnBottom {
                    OneOnTopTwoOnBottomCollageView(photos: entry.photos)
                } else if entry.layout == .oneOnLeftTwoOnRight {
                    OneOnLeftTwoOnRightCollageView(photos: entry.photos)
                } else if entry.layout == .twoOnTopOneOnBottom {
                    TwoOnTopOneOnBottomCollageView(photos: entry.photos)
                } else if entry.layout == .twoOnLeftTwoOnRight {
                    TwoOnLeftTwoOnRightCollageView(photos: entry.photos)
                }
            default: PlaceholderCollageView()
            }
        } else {
            PlaceholderCollageView()
        }
    }
}

@main
struct PhotoCollageWidget: Widget {
    let kind: String = "PhotoCollageWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            PhotoCollageWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Photo Collage")
        .description("Display photos with different layouts.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct PhotoCollageWidget_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCollageWidgetEntryView(entry: PhotoCollageEntry(date: Date(), layout: .oneOnLeftOneOnRight, photos: PhotosProvider.all()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension Color {
    static let primaryGray = Color("primaryGray")
    static let secondaryGray = Color("secondaryGray")
}
