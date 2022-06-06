//
//  ImageView.swift
//  SwiftUIFirstApp
//
//  Created by desarrollador11 on 4/06/22.
//

import SwiftUI

struct ImageView: View {
    init(){
        // this line clears the color of the form field so then we can give
        // a new color or leave it as transparent
            UITableView.appearance().backgroundColor = .clear
        //UITableView.appearance().sectionHeaderTopPadding = 0
        }
    @State private var uName: String = ""
    @State private var uPassWord: String = ""
    @State private var selection: String? = nil
    
    var body: some View {
        TabView{
        NavigationView{
            ZStack {
                //Color.red.edgesIgnoringSafeArea(.all)
                
                // adding the ignoreSafeArea it works well
                Image("background1").frame(width: .infinity,height: .infinity).ignoresSafeArea()
                VStack (alignment: .center){
                    Image("profile1").resizable().frame(width: 150, height: 150).background(Color.blue).clipShape(Circle()).overlay(Circle().stroke(Color.blue))
                    Text("Audrey Leeblank").padding(10).font(Font.system(size: 30))
                    VStack(alignment: .leading){
                    Text("User")
                    TextField("Insert your e-mail", text: $uName).textFieldStyle(.roundedBorder).frame(maxWidth: 325)
                    Text("Pasword")
                    SecureField("Password", text: $uPassWord).textFieldStyle(.roundedBorder).frame(maxWidth: 325)
                    }
                        // use this for from field data it will appear in the same
                    // from and will be recognize as the same from
//                    Form {
//                        TextField(text: $uName, prompt: Text("e-mail")) {
//                            Text("Username")
//                        }
//                        SecureField(text: $uPassWord, prompt: Text("Password")) {
//                            Text("Password")
//                        }
//                    }.padding(0).foregroundColor(Color.green).frame(width: 350, height: 150, alignment: .topTrailing)
                    HStack (alignment: .center){
                        Button {
                            //Text("Sign In")
                            print("algo")
                        } label: {
                            Text("Register").frame(minWidth: 0, maxWidth: 100)
                                .padding(20)
                        }.background(Color(hexStringToUIColor(hex: "#CF236C"))).cornerRadius(10).foregroundColor(.white).font(Font.system(size: 24)).frame(width: 200)
                        
//                        Button(action: {
//                            print("signIn printed")
//                        }){
//                            Text("Sign In")
//                        }.background(Color.pink).cornerRadius(10).padding().foregroundColor(.white).font(.largeTitle)
                        
                            Button {
                                //Text("Sign In")
                                print("algo")
                            } label: {
                                Text("Sign In").frame(minWidth: 0, maxWidth: 100)
                                    .padding(20)
                            }.background(Color(hexStringToUIColor(hex: "#C1F36C"))).cornerRadius(10).foregroundColor(.white).font(Font.system(size: 24)).frame(width: 200)
                    }
                    NavigationLink(destination:  ContentView()) {
//                    Button {
//                        //Text("Sign In")
//                        print("algo")
//                    } label: {
                        Text("Not Sign In").frame(minWidth: 0, maxWidth: .infinity)
                            .padding(20)
                    }.background(Color(hexStringToUIColor(hex: "#C1F36C"))).cornerRadius(10).foregroundColor(.white).font(Font.system(size: 24)).frame(width: .infinity).padding([.top, .leading, .trailing])
              //      }
                
            }
            }.navigationBarTitle("Sign In")
        }
        }
}
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
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

extension UINavigationBarAppearance {
    func setColor(title: UIColor? = nil, background: UIColor? = nil) {
        configureWithTransparentBackground()
        if let titleColor = title {
            largeTitleTextAttributes = [.foregroundColor: titleColor]
            titleTextAttributes = [.foregroundColor: titleColor]
        }
        backgroundColor = background
        UINavigationBar.appearance().scrollEdgeAppearance = self
        UINavigationBar.appearance().standardAppearance = self
    }
}
