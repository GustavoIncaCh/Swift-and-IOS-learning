//
//  transactionPageView.swift
//  CloneBank
//
//  Created by desarrollador11 on 6/06/22.
//

import SwiftUI

struct transactionPageView: View {
    
//    let gradient = LinearGradient(colors: [Color(hexStringToUIColor(hex: "#19173D")).opacity(0.3),  Color(hexStringToUIColor(hex: "#19173D")).opacity(0.5)],
//                                  startPoint: .topLeading,
//                                  endPoint: .bottomTrailing)
    
    let gradient = LinearGradient(colors: [.white.opacity(0.05), .white.opacity(0.025)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    @State var appear2 : Bool = false
    @State var progress: Double = 0
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    //@State var currentTab: Enum = .homeCase
    var body: some View {
        ZStack{
            
//
//                        Color.green
//                            .opacity(0.1)
//                            .ignoresSafeArea()
            //Color(hexStringToUIColor(hex: "#262450")).frame(width: .infinity,height: 1600).ignoresSafeArea()
            Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: .infinity).ignoresSafeArea()
            VStack(alignment: .leading){
                //Spacer(minLength: 25)
                HStack(alignment: .center, spacing: 10){
                    Image("profile1").resizable().frame(width: 45, height: 45).clipShape(Circle())
                        .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#320DAF"))]), startPoint: .top, endPoint: .bottom),lineWidth: 2.5))

//                    LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
//                        .mask(Image("profile1")
//                          .resizable()
//                          .padding()
//                          .aspectRatio(contentMode: .fit))
                VStack(alignment: .leading, spacing: 5){
                    Text("Welcome back!").font(.system(size: 15)).fontWeight(.medium)
                    Text("Audrey Leeblank").font(.system(size: 13)).fontWeight(.regular).foregroundColor(Color(hexStringToUIColor(hex: "#7B78AA")))}
                    Spacer()
                    Button{
                    }label: {
                        Image(systemName: "bell.badge.fill").foregroundColor(.white)
                    }
                    Button{
                    }label: {
                        Image(systemName: "ellipsis").foregroundColor(.white).rotationEffect(.degrees(-90))
                    }

                }.padding(25)
                ZStack{
                Image("Base").resizable().frame(width: 400, height: 600).position(x:200, y:400)
                // circle animation
                    
                
                    ZStack{
                        
                        Circle().stroke(.white.opacity(0.2), lineWidth: 32).frame(width: 180, height: 180)
                    
                        Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#2D2E53")), Color(hexStringToUIColor(hex: "#201F3F"))]), startPoint: .topTrailing, endPoint: .bottomTrailing), lineWidth: 30).frame(width: 180, height: 180)
                        
                        // green color
                        Circle().trim(from: 0.2, to: 0.5).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#61DE70")), Color(hexStringToUIColor(hex: "#0DA6C2"))]), startPoint: .bottomTrailing, endPoint: .bottomLeading),
                                        style: StrokeStyle(
                                            lineWidth: 36,
                                            lineCap: .round
                                        )
                        ).blur(radius: 1.5).opacity(0.4)
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                        
                        Circle().trim(from: 0.2, to: 0.5).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#61DE70")), Color(hexStringToUIColor(hex: "#0DA6C2"))]), startPoint: .bottomTrailing, endPoint: .bottomLeading),
                                        style: StrokeStyle(
                                            lineWidth: 30,
                                            lineCap: .round
                                        )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                        
                        // lightblue color
                        Circle().trim(from: 0.35, to: 0.55).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#0E39C6"))]), startPoint: .leading, endPoint: .trailing),
                                        style: StrokeStyle(
                                            lineWidth: 36,
                                            lineCap: .round
                                        )
                                    ).blur(radius: 1.5).opacity(0.4)
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                        Circle().trim(from: 0.35, to: 0.55).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#0E39C6"))]), startPoint: .leading, endPoint: .trailing),
                                        style: StrokeStyle(
                                            lineWidth: 30,
                                            lineCap: .round
                                        )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                        
                        // putple color
                        Circle().trim(from: 0.5, to: 0.7).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#9327F0")), Color(hexStringToUIColor(hex: "#320DAF"))]), startPoint: .top, endPoint: .bottomLeading),
                                        style: StrokeStyle(
                                            lineWidth: 36,
                                            lineCap: .round
                                        )
                                    ).blur(radius: 1.5).opacity(0.4)
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                        Circle().trim(from: 0.5, to: 0.7).stroke(
                            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#9327F0")), Color(hexStringToUIColor(hex: "#320DAF"))]), startPoint: .top, endPoint: .bottomLeading),
                                        style: StrokeStyle(
                                            lineWidth: 30,
                                            lineCap: .round
                                        )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    // 1
                                    .animation(.easeOut, value: progress).frame(width: 180, height: 180)
                    }.position(x: 200, y: 100)
                    
                    VStack(alignment: .center, spacing: 5){
                        Text("$5,643.50").font(.system(size: 25)).fontWeight(.medium)
                        Text("Available Balance").font(.system(size: 13)).fontWeight(.regular).foregroundColor(Color(hexStringToUIColor(hex: "#7B78AA")))}.position(x: 200, y: 100)
                            
                
                    Text("My transaction").font(.system(size: 17)).fontWeight(.semibold).padding(EdgeInsets(top: 0, leading: 35, bottom: 15, trailing: 35)).position(x: 100, y:250)
                    Spacer(minLength: 25)
                    
                    ScrollView{
                    VStack{
                        
                        storeButtonView(storeApp: StoreButton(name: "Amazon", price: "- $103.56", date: Date.now, logo: Image("Amazon WC")))
                    storeButtonView(storeApp: StoreButton(name: "Mcdonalds", price: "- $34.78", date: Date.now, logo: Image("Mcdonalds WC")))
                    storeButtonView(storeApp: StoreButton(name: "Apple", price: "- $1,000.97", date: Date.now, logo: Image("Apple WC")))
                    storeButtonView(storeApp: StoreButton(name: "Starbucks", price: "- $13.67", date: Date.now, logo: Image("Starbucks WC")))
                        storeButtonView(storeApp: StoreButton(name: "Amazon", price: "- $103.56", date: Date.now, logo: Image("Amazon WC")))
                    storeButtonView(storeApp: StoreButton(name: "Mcdonalds", price: "- $34.78", date: Date.now, logo: Image("Mcdonalds WC")))
                    storeButtonView(storeApp: StoreButton(name: "Apple", price: "- $1,000.97", date: Date.now, logo: Image("Apple WC")))
                    storeButtonView(storeApp: StoreButton(name: "Starbucks", price: "- $13.67", date: Date.now, logo: Image("Starbucks WC")))
                    }


                }.frame(height: 325).position(x: 200, y:450)
       }
                
//                            Rectangle()
//                                .frame(height: 50,alignment: .bottom).ignoresSafeArea()
//                                .background(gradient).opacity(0.2)
        }
            
                       // Circle().foregroundColor(Color.red).frame(width: 30, height: 30).position(x: 200, y: 720)
        }.preferredColorScheme(.dark)
    }
}

struct transactionPageView_Previews: PreviewProvider {
    static var previews: some View {
        transactionPageView()
    }
}

extension View{
    func applyBG()->some View{
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color.green
            }
    }
}
