//
//  customMenuTabBar.swift
//  CloneBank
//
//  Created by desarrollador11 on 10/06/22.
//

import SwiftUI

struct customMenuTabBar: View {
    @Binding var currentTab: MenuStatics
    var body: some View {
        GeometryReader{
            proxy in
            HStack(alignment: .center, spacing: 0){
                ForEach(MenuStatics.allCases, id: \.rawValue){
                    tab in
                    Button{
                        withAnimation(.easeInOut(duration: 0.2)){
                            currentTab = tab
                        }
                    }label: {
                        Text(tab.rawValue)
                            .foregroundColor(currentTab == tab ? Color(hexStringToUIColor(hex: "#00D7FF")) : .gray)
                            // add the new frame to clic the component
                            // inside the full button,
                            // as much as it need need, the half value returns
                            // a padding value
                            .frame(minWidth: UIScreen.screenWidth/CGFloat(MenuStatics.allCases.count)-20)
                    }
                    // use the frame .infinity to let the button to use the max
                    // size posible, so when another one apear, it will auto ajust
                    // to the new max zise, which will be half or the slider part
                    // of the list of items
                    .frame(maxWidth: .infinity)
                }
            }.frame(maxWidth:.infinity)
                .background(){
                    ZStack{
                        Rectangle().fill(.white.opacity(0.5))
                                //.blur(radius: 10)
                            .frame(width: UIScreen.screenWidth, height: 5).offset(x: 0, y: 20)
                        
                        
                        //Rectangle().fill(.red).frame(width: 1, height: .infinity)
                        
                        Rectangle().fill(Color(hexStringToUIColor(hex: "#00D7FF")))
                        //.blur(radius: 10)
                        .frame(width: UIScreen.screenWidth/2, height: 5)
                        .offset(x: -UIScreen.screenWidth/4,y:20)
                        .offset(x: indicatorOffSet(width: UIScreen.screenWidth))
                        Rectangle().fill(Color(hexStringToUIColor(hex: "#00D7FF")))
                        .blur(radius: 10)
                        .frame(width: UIScreen.screenWidth/2, height: 5)
                        .offset(x: -UIScreen.screenWidth/4,y:22.5)
                        .offset(x: indicatorOffSet(width: UIScreen.screenWidth))
                    }
                }
        }.frame(height:20).padding(.bottom,10).padding([.horizontal,.top])
            //.background(Color(hexStringToUIColor(hex: "#262450")))
    }
    func indicatorOffSet(width: CGFloat)->CGFloat{
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        
        let buttonWidth = width / CGFloat(MenuStatics.allCases.count)
        
        return index*buttonWidth
    }
    
    func getIndex()->Int{
        switch currentTab {
        case .income:
            return 0
        case .outcome:
            return 1
        }
    }
}

struct customMenuTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
