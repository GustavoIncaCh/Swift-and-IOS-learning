//
//  storeButtonView.swift
//  CloneBank
//
//  Created by desarrollador11 on 6/06/22.
//

import SwiftUI

struct storeButtonView: View {
    var storeApp: StoreButton
    
    var body: some View {
            ZStack{
            Color(hexStringToUIColor(hex: "#19173D")).frame(width: 350,height: 80).cornerRadius(50)
                HStack(alignment: .center){
                    storeApp.logo.resizable().frame(width: 45, height: 45).clipShape(Circle())
                    VStack(alignment: .leading){
                        Text(storeApp.name).font(.system(size: 15)).fontWeight(.medium)
                        Text(storeApp.date.formatted()).font(.system(size: 13)).fontWeight(.regular).foregroundColor(Color(hexStringToUIColor(hex: "#7B78AA")))
                    }
                    Spacer()
                        ZStack{Text(" ").font(.system(size: 13)).lineLimit(1).foregroundColor(.white).padding().frame(width: 100, height: 50,alignment: .center).background(Color(hexStringToUIColor(hex: "#7B78AA"))).cornerRadius(20)
                    Text(storeApp.price).font(.system(size: 13)).lineLimit(1).foregroundColor(.white).padding().frame(width: 98,height: 48, alignment: .center).background(Color(hexStringToUIColor(hex: "#19173D"))).cornerRadius(20)}
                    
                    
                }.padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
            }

    }
}

struct storeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        storeButtonView(storeApp: StoreButton(name: "name", price: "100.0", date: Date.now, logo: Image("Amazon WC")))
    }
}
