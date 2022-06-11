//
//  cardPageView.swift
//  CloneBank
//
//  Created by desarrollador11 on 7/06/22.
//

import SwiftUI
import UIKit

struct cardPageView: View {
    @State var payment: Int = 0
    
    init(){
        
        // UIkit for the color of the slider dots, it cant be access with swiftUI
        UIPageControl.appearance().currentPageIndicatorTintColor = hexStringToUIColor(hex: "#0EA6C2")
        UIPageControl.appearance().pageIndicatorTintColor = .gray
        // --------------------------------------------------------
        // use the same UIkit for the picker view
        UISegmentedControl.appearance().selectedSegmentTintColor = .clear
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: hexStringToUIColor(hex: "#7B78AA")], for: .normal)
        UISegmentedControl.appearance().backgroundColor = nil
        //UISegmentedControl.appearance().tintColor = .red
        

    }

    private let images = ["Credit Card", "Credit Card (1)", "Credit Card (2)"]
    @State var currentTab: Payment = .cards
    @State private var textfield1: String = ""
    
    var body: some View {
        VStack(spacing: 0){
            customTopTabBar(currentTab: $currentTab)
        TabView(selection: $currentTab){
            ZStack{
            Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: .infinity).ignoresSafeArea()
            ScrollView{
                ZStack{
                Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: 875).ignoresSafeArea()
                    Circle().fill(Color(hexStringToUIColor(hex: "#00D7FF"))).blur(radius: 75).frame(width: 125, height: 125).position(x: 275, y: 600)
                // Circle().foregroundColor(Color.red).frame(width: 30, height: 30).position(x: 200, y: 720)
                VStack{
    //                Picker("new Segment", selection: $payment){
    //                    Text("Cards").tag(0)
    //                    Text("Account").tag(1)
    //                }.pickerStyle(.segmented).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    TabView {
                    ForEach(images, id: \.self) { item in
                         //3
                         Image(item)//.frame(height: 300)
                            //.resizable()
                            //.frame(width: 350, height: 220)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .scaledToFill()
                    }
                }
                .tabViewStyle(PageTabViewStyle()).frame(height: 300)
                    HStack(alignment: .center, spacing: 15){
                    ZStack{
                        Rectangle()//.stroke(.green)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: 70, height: 70).cornerRadius(20)
                        Image("Send").resizable().frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.08), lineWidth: 1).frame(width: 70, height: 70)
                            )
                        
                    }
                    ZStack{
                        Rectangle()//.stroke(.green)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: 70, height: 70).cornerRadius(20)
                        Image("Wallet").resizable().frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.08), lineWidth: 1).frame(width: 70, height: 70)
                            )
                    }
                    ZStack{
                        Rectangle()//.stroke(.green)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: 70, height: 70).cornerRadius(20)
                        Image("Send-1").resizable().frame(width: 50, height: 50).rotationEffect(.degrees(135)).offset(x: 0, y: -5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.08), lineWidth: 1).frame(width: 70, height: 70)
                            )
                    }
                    ZStack{
                        Rectangle()//.stroke(.green)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: 70, height: 70).cornerRadius(20)
                        Image("Chart").resizable().frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.08), lineWidth: 1).frame(width: 70, height: 70)
                            )
                    }
                    }
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: .infinity, height: 400).cornerRadius(20).padding()
                        VStack(alignment: .center, spacing: 30){
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                            Text("+").font(.largeTitle)
                            VStack(alignment: .leading, spacing: 3){
                                Text("Add Card").font(.system(size: 18)).fontWeight(.medium)
                                Text("Add your debit/credit card").font(.system(size: 15)).fontWeight(.regular).foregroundColor(Color(hexStringToUIColor(hex: "#7B78AA")))}
                            }
                            TextField("Card number", text: $textfield1)//.focused($emailFieldIsFocused)
                                .frame(width: 300)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .foregroundColor(.green)
                                //.shadow(color: .red, radius: 1, x: 10, y: 10)
                                .background(Color(hexStringToUIColor(hex: "#19173D")).opacity(0.5))
                                //.border(.secondary)
                                .cornerRadius(20)
                            
                            TextField("Card holder name", text: $textfield1)//.focused($emailFieldIsFocused)
                                .frame(width: 300)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .foregroundColor(.green)
                                //.shadow(color: .red, radius: 1, x: 10, y: 10)
                                .background(Color(hexStringToUIColor(hex: "#19173D")).opacity(0.5))
                                //.border(.secondary)
                                .cornerRadius(20)
                            
                            HStack
                            {TextField("Expiration Date", text: $textfield1)//.focused($emailFieldIsFocused)
                                .frame(width: 140)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .foregroundColor(.green)
                                //.shadow(color: .red, radius: 1, x: 10, y: 10)
                                .background(Color(hexStringToUIColor(hex: "#19173D")).opacity(0.5))
                                //.border(.secondary)
                                .cornerRadius(20)
                            
                            TextField("Security Code", text: $textfield1)//.focused($emailFieldIsFocused)
                                .frame(width: 120)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .foregroundColor(.green)
                                //.shadow(color: .red, radius: 1, x: 10, y: 10)
                                .background(Color(hexStringToUIColor(hex: "#19173D")).opacity(0.5))
                                //.border(.secondary)
                                .cornerRadius(20)}
                        }
                        Button{
                            
                        }label: {
                            Text("Next").frame(width: 140, height: 45, alignment: .center).background(){
                                LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#0E39C6"))]), startPoint: .leading, endPoint: .trailing)
                            }.foregroundColor(.white)
                        }
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                    }
                    }
                    Spacer()
                }
            }
            }
            }.preferredColorScheme(.dark)
                .applyBG()
                .tag(Payment.cards)
            
            
                NavigationView{
                    ZStack{
                                            Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: .infinity).ignoresSafeArea()
                    
                                            
                                                       // Circle().foregroundColor(Color.red).frame(width: 30, height: 30).position(x: 200, y: 720)
                    
                    VStack{
        //                Picker("new Segment", selection: $payment){
        //                    Text("Cards").tag(0)
        //                    Text("Account").tag(1)
        //                }.pickerStyle(.segmented).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        
                            
                            
                        
                        TabView {
                        ForEach(images, id: \.self) { item in
                             //3
                             Image(item)//.frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .scaledToFill()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle()).frame(height: 300)
                        Spacer()
                        Text("def not like aea")
                    }
                }
                    
                }.preferredColorScheme(.dark)
                    .applyBG()
                    .tag(Payment.account)
        }.accentColor(Color(hexStringToUIColor(hex: "#00D7FF")))
        }
    }
}

struct cardPageView_Previews: PreviewProvider {
    static var previews: some View {
        cardPageView().previewLayout(.fixed(width: 400, height: 300))
    }
}
