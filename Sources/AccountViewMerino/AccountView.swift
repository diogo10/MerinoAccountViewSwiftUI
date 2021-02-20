import SwiftUI


public struct MerinoAccountViewModelSection: Identifiable {
    public var id = UUID()
    var title: String
    var items: [MerinoAccountViewModel]
    
    public init(title:String, items:[MerinoAccountViewModel]){
        self.title = title
        self.items = items
    }
}

public struct MerinoAccountViewModel: Identifiable {
    public var id = UUID()
    var title:String
    var subTitle:String
    var imageName:String
    var systemImage:String
    var view: AnyView?
    
    public init(title:String, subTitle:String, imageName: String, arrowImage: String, view: AnyView?){
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
        self.systemImage = arrowImage
        self.view = view
    }
}

public struct MerinoAccountView: View {
    @State private var hasTimeElapsed = false
    var items: [MerinoAccountViewModelSection]
    
    public init(items: [MerinoAccountViewModelSection]) {
        self.items = items
    }
    
    public var body: some View {
        
        List {
            
            ForEach(items) { category in
                Section(header: HStack {
                    HeaderView(title: category.title)
                    Spacer()
                }.background(Color.white).listRowInsets(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))) {
                    ForEach(category.items) { item in
                        ItemView(item: item)
                    }
                }
            }
            
            
        }.listStyle(GroupedListStyle()).navigationBarHidden(false)
    }
}

struct HeaderView: View {
    var title: String
    var body: some View {
        if #available(iOS 14.0, *) {
            Text(title).textCase(nil).font(.headline).foregroundColor(.black).padding()
        } else {
            // Fallback on earlier versions
            Text(title).font(.headline).foregroundColor(.black).padding()
        }
    }
}

struct ItemView: View {
    
    var item: MerinoAccountViewModel
    var isLink:Bool = false
    
    var body: some View {
        
        ZStack {
            HStack {
                Image(item.imageName)
                VStack(alignment: .leading) {
                    
                    if isLink {
                        Text(item.title).underline().font(.headline)
                    } else {
                        Text(item.title).font(.headline)
                    }
                    
                    
                    if !item.subTitle.isEmpty {
                        Text(item.subTitle).font(.subheadline).foregroundColor(.gray)
                    }
                    
                }
                Spacer()
                
                Image(systemName: item.systemImage).frame(width: 24, height: 24)
                
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
            .opacity(0)
            .buttonStyle(PlainButtonStyle())
            
            //hack to hide >
            if let theView = item.view {
                NavigationLink(destination: theView) {
                    EmptyView()
                }
            }
            
            
        }
    }
    
}
