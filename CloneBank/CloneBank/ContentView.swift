//
//  ContentView.swift
//  CloneBank
//
//  Created by desarrollador11 on 6/06/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var currentTab: Enum = .homeCase
    
    init(){
            // this line clears the color of the form field so then we can give
            // a new color or leave it as transparent
        //UITableView.appearance().backgroundColor = hexStringToUIColor(hex: "#262450")
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = .red
        //UITabBar.appearance().barTintColor = hexStringToUIColor(hex: "#19173D")
        UITabBar.appearance().backgroundColor = .red
        UITabBar.appearance().isHidden = true
        //UITabBar.appearance().color
        //UITabBar.appearance().barTintColor = .clear
        //UITableView.appearance().tintColor = .white
                        //UITableView.appearance().sectionHeaderTopPadding = 0
            }
    var body: some View {
        ZStack{
        TabView(selection: $currentTab){
                transactionPageView()
                .applyBG()
                .tag(Enum.homeCase)
            // ---------------------------------------------------------------------
//                            .tabItem {
//                                Image(systemName: "house").foregroundColor(.white)
//                            }
            // ---------------------------------------------------------------------
            NavigationView {
//                ZStack {
//                Color.green
//                    .opacity(0.1)
//                    .ignoresSafeArea()
//
//                VStack {
//                    Text("Have the shape style touching the safe area edge.")
//                        .padding()
//                        .frame(maxHeight: .infinity)
//
//                    Rectangle()
//                        .fill(Color.clear)
//                        .frame(height: 10)
//                        .background(Color.green.opacity(0.2))
//                }
//                .font(.title2)
//            }
                
                cardPageView()
                    .navigationTitle("Wallet").navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(leading: Button{
//
//                }label: {
//                    Image(systemName: "chevron.backward")
//                })
                .navigationBarBackButtonHidden(true)
                            .navigationBarItems(
                            leading: Button(action : {
                                self.mode.wrappedValue.dismiss()
                                withAnimation(.easeInOut(duration: 0.2)){
                                    currentTab = Enum.homeCase
                                }
                            }){
                                Image(systemName: "chevron.backward").foregroundColor(.white)
                            },
                            trailing: Button(action : {
//                                self.mode.wrappedValue.dismiss()
//                                withAnimation(.easeInOut(duration: 0.2)){
//                                    currentTab = Enum.homeCase
//                                }
                            }){
                                Image(systemName: "ellipsis").foregroundColor(.white).rotationEffect(.degrees(-90))
                            })
            }
            .applyBG()
            .tag(Enum.billCase)
            // ---------------------------------------------------------------------
//                        .tabItem {
//                            //appear2 ?
//                            Text(" asda")
//                            Image(systemName: "plus.circle.fill").foregroundColor(.green)
//
//
//
////                              : ZStack{
////                                  Circle()
////                                      .fill(.blue)
////                                      .frame(width: 100, height: 100)
////                                  Image(systemName: "pencil.slash").foregroundColor(.green)
////                                  Text("aea")}
//                        }.onAppear(){
//                            appear2 = true
//                            print("entro al appear")
//
//                        }.onDisappear() {
//                            appear2 = false
//                            print("entro al gesture")
//                        }.shadow(color: Color.purple, radius: 100, x: 0, y: 0)
            // ---------------------------------------------------------------------
            
            
            NavigationView {
//                ZStack {
//                                Color.green
//                                    .opacity(0.1)
//                                    .ignoresSafeArea()
//
//                                VStack {
//                                    Text("You can use gradients as the TabView's background color.")
//                                        .padding()
//                                        .frame(maxHeight: .infinity)
//
//                                    Rectangle()
//                                        .fill(Color.clear)
//                                        .frame(height: 10)
//                                        .background(gradient)
//                                }
//                    .font(.title2)}
                Text("userCase")
            }.navigationTitle("Wallet").applyBG()
            .tag(Enum.userCase)
            // ---------------------------------------------------------------------
//                        .tabItem {
//                            Image(systemName: "person").foregroundColor(.white)
//                            Text("aea")
//                        }
            // ---------------------------------------------------------------------
            NavigationView {
                staticsPageView().navigationTitle("Statics").navigationBarTitleDisplayMode(.inline)
                //                .navigationBarItems(leading: Button{
                //
                //                }label: {
                //                    Image(systemName: "chevron.backward")
                //                })
                                .navigationBarBackButtonHidden(true)
                                            .navigationBarItems(
                                            leading: Button(action : {
                                                self.mode.wrappedValue.dismiss()
                                                withAnimation(.easeInOut(duration: 0.2)){
                                                    currentTab = Enum.homeCase
                                                }
                                            }){
                                                Image(systemName: "chevron.backward").foregroundColor(.white)
                                            })
            }.navigationTitle("Statics").applyBG()
            .tag(Enum.staticsCase)
            // ---------------------------------------------------------------------
//                        .tabItem {
//                            Image(systemName: "lines.measurement.horizontal").foregroundColor(.white)
//                            Text("aea")
//                        }
            // ---------------------------------------------------------------------
            
//            GeometryReader{
//                proxy in HStack(spacing:0){
//                    ForEach
//                }
//            }
        }.accentColor(Color(hexStringToUIColor(hex: "#00D7FF")))
//            .onAppear(){
//
//            let appearance = UITabBarAppearance()
//            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
//            appearance.backgroundColor = UIColor(Color(hexStringToUIColor(hex: "#262450")).opacity(0.75))
//
//            // Use this appearance when scrolling behind the TabView:
//            UITabBar.appearance().standardAppearance = appearance
//            // Use this appearance when scrolled all the way up:
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
        
//            .onAppear {
//            let appearance = UITabBarAppearance()
//            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
//                appearance.backgroundColor = UIColor(.white)
//
//            // Use this appearance when scrolling behind the TabView:
//            UITabBar.appearance().standardAppearance = appearance
//            // Use this appearance when scrolled all the way up:
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
            customTabBar(currentTab: $currentTab).position(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight-100)
            
            Rectangle().fill(Color.white.opacity(0.15)).frame(width: UIScreen.screenWidth, height: 1).position(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight-128)
            
            //Divider()
            //customTabBar()
        // new VStack end of case
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// functions and extensions
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
