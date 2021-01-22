//
//  SwiftUIView.swift
//  
//
//  Created by Diogo Ribeiro on 12/12/2020.
//

import SwiftUI


class AccountViewModel {
    
}

public struct AccountView: View {
    
    public init() {}
    
    public var body: some View {
        AccountViewList()
            .navigationBarTitle(Text("Account"))
    }
    
    
}


public struct AccountViewList: View {
    public init() {}
    
    public var body: some View {
        List{
            
            Section(header: Header(), footer: Footer()) {
                HStack {
                    Image("phone",bundle: .module).frame(width: 24, height: 24)
                    Text("Change link").font(.subheadline).foregroundColor(.gray)
                }
            }
        }.padding()
        
    }
}


public struct Header: View {
    public init() {}
    
    public var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                Image("avatar_1",bundle: .module)
                    .frame(width: 50, height: 50)
                
                VStack (alignment: .leading){
                    Text("Diogo Ribeiro").font(.headline).bold()
                    Text("diogjp10@gmail.com").font(.subheadline).foregroundColor(.black)
                }.padding(.leading, 10)
                
                Spacer()
                
            }.padding(20)
            
            HStack {
                Image("phone",bundle: .module).frame(width: 24, height: 24)
                Text("+ 351 926 426 508").font(.subheadline).foregroundColor(.black)
                
            }.padding(.leading,20)
            
            HStack {
                Image("link",bundle: .module) .frame(width: 24, height: 24)
                Text("link").font(.subheadline).foregroundColor(.black)
                
            }.padding(EdgeInsets(top: 2, leading: 20, bottom: 10, trailing: 0))
            
        }
        
        .background(Color.blue).foregroundColor(Color.black).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).cornerRadius(5)
    }
}

public struct Footer: View {
    public init() {}
    
    public var body: some View {
        
        Button(action: {
            // What to perform
            print("sair")
        }) {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Text("Logout").foregroundColor(Color.red)
                }.frame(width: geometry.size.width)
            }
        }
    
    }
}
