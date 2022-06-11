//
//  customTabBar.swift
//  CloneBank
//
//  Created by desarrollador11 on 7/06/22.
//

import SwiftUI

struct customTabBar: View {
    @Binding var currentTab: Enum
    var body: some View {
        GeometryReader{
            proxy in
            let width = proxy.size.width
            
            HStack(spacing:0){
                ForEach(Enum.allCases, id: \.rawValue){
                    tab in
                    Button{
                        withAnimation(.easeInOut(duration: 0.2)){
                            currentTab = tab
                        }
                    }label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30).frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color(hexStringToUIColor(hex: "#00D7FF")) : .gray)
                    }
                }
            }.frame(maxWidth:.infinity)
                .background(){
                    Circle().fill(Color(hexStringToUIColor(hex: "#00D7FF"))).blur(radius: 10).frame(width: 25, height: 25).offset(x: -135).offset(x: indicatorOffSet(width: width))
                }
        }.frame(height:30).padding(.bottom,10).padding([.horizontal,.top])
            .background(Color(hexStringToUIColor(hex: "#262450")).opacity(0.8))
            //.background(Color.white.opacity(0.15))
    }
    func indicatorOffSet(width: CGFloat)->CGFloat{
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        
        let buttonWidth = width / CGFloat(Enum.allCases.count)
        
        return index*buttonWidth
    }
    
    func getIndex()->Int{
        switch currentTab {
        case .homeCase:
            return 0
        case .billCase:
            return 1
        case .userCase:
            return 2
        case .staticsCase:
            return 3
        }
    }
}

struct customTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
