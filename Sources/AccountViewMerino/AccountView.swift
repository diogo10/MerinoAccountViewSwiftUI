import SwiftUI

public struct AccountView: View {
    @State private var hasTimeElapsed = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            
            List {
                
                Section(header: HStack {
                    HeaderView(title: "Account")
                    Spacer()
                }.background(Color.white).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ) {
                    ItemView(item: ItemViewModel(title: "Diogo Ribeiro", subTitle: "diogjp10@gmail.com", imageName: "avatar", arrowImage: "pencil"))
                    ItemView(item: ItemViewModel(title: "https//bit.ly/ADFGDGF", subTitle: "", imageName: "ic_browser", arrowImage: "link"), isLink: true)
                }
                
                Section(header: HStack {
                    HeaderView(title: "Actions")
                    Spacer()
                }.background(Color.white).listRowInsets(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                ) {
                    ItemView(item: ItemViewModel(title: "Booking", subTitle: "", imageName: "avatar", arrowImage: "calendar.badge.plus"))
                    ItemView(item: ItemViewModel(title: "Client", subTitle: "", imageName: "avatar", arrowImage: "person.crop.circle.badge.plus"))
                }
                
                
                Section(header: HStack {
                    HeaderView(title: "Others")
                    Spacer()
                }.background(Color.white).listRowInsets(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                ) {
                    ItemView(item: ItemViewModel(title: "Categories", subTitle: "0 categories", imageName: "avatar"))
                    ItemView(item: ItemViewModel(title: "Services", subTitle: "0 actives, 0 inactive", imageName: "avatar"))
                }
                
                
            }.listStyle(GroupedListStyle())
            .navigationBarHidden(true)
        }
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

struct ItemViewModel:Identifiable {
    var id = UUID()
    var title:String
    var subTitle:String
    var imageName:String
    var arrowImage:String?
}

struct ItemView: View {
    
    var item: ItemViewModel
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
                
                if item.arrowImage != nil {
                    Image(systemName: item.arrowImage!).frame(width: 24, height: 24)
                }
                
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
            
            //hack to hide >
            NavigationLink(destination: Text("item.name")) {
                EmptyView()
            }
            .opacity(0)
            .buttonStyle(PlainButtonStyle())
        }
    }
    
}
