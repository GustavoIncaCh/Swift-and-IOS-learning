//
//  staticsPageView.swift
//  CloneBank
//
//  Created by desarrollador11 on 9/06/22.
//

import SwiftUI

struct staticsPageView: View {
    @State var  optionPick = 1
    
    
    init(){
        // use the same UIkit for the picker view
        UISegmentedControl.appearance().selectedSegmentTintColor = .clear
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: hexStringToUIColor(hex: "#7B78AA")], for: .normal)
        UISegmentedControl.appearance().backgroundColor = nil
    }
    
    @State var currentTab: MenuStatics = .income
    @State var dataPoints: [Double] = [15, 2, 7, 16, 32, 39, 5, 3, 25, 21]
    var body: some View {
        ZStack{
            Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: .infinity).ignoresSafeArea()
                ZStack{
                    Color(hexStringToUIColor(hex: "#19173D")).frame(width: .infinity,height: .infinity).ignoresSafeArea()
                    Circle().fill(Color(hexStringToUIColor(hex: "#00D7FF"))).blur(radius: 75).frame(width: 175, height: 175).position(x: 250, y: 175)
                // Circle().foregroundColor(Color.red).frame(width: 30, height: 30).position(x: 200, y: 720)
                VStack{
                    customMenuTabBar(currentTab: $currentTab)
                        Picker("Picker",selection: $optionPick){
                            Text("Week").tag(0)
                            Text("Month").tag(1)
                            Text("Year").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())
                        //.background(){ LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#0E39C6"))]), startPoint: .leading, endPoint: .trailing)}
                    ZStack{
                        Rectangle().foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.04)).frame(width: .infinity, height: 400).cornerRadius(20).padding()
                        graphView(logs: ActivityTestData.testData, selectedIndex: Binding<Int>.constant(0))
                        
                        VStack(alignment: .center, spacing: 30){
//                        VStack(alignment: .leading){
//
//                            HStack(alignment: .top){
//                            Text("+").font(.largeTitle)
//                            VStack(alignment: .leading, spacing: 3){
//                                Text("Add Card").font(.system(size: 18)).fontWeight(.medium)
//                                Text("Add your debit/credit card").font(.system(size: 15)).fontWeight(.regular).foregroundColor(Color(hexStringToUIColor(hex: "#7B78AA")))}
//                            }
//
//
////                            LineChartView(dataPoints: dataPoints)
////                              .frame(height: 200)
////                              .padding(4)
////                              .background(Color.gray.opacity(0.1).cornerRadius(16))
////                              .padding()
//
////                        Button{
////
////                        }label: {
////                            Text("Next").frame(width: 140, height: 45, alignment: .center).background(){
////                                LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#0DA6C2")), Color(hexStringToUIColor(hex: "#0E39C6"))]), startPoint: .leading, endPoint: .trailing)
////                            }.foregroundColor(.white)
////                        }
////                        .cornerRadius(20)
////                        .overlay(
////                            RoundedRectangle(cornerRadius: 20)
////                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
////                        )
//                    }
                    }
                    Spacer()
                }
            }
                }}
}
}

struct staticsPageView_Previews: PreviewProvider {
    static var previews: some View {
        staticsPageView()
    }
}

struct LineView: View {
  var dataPoints: [Double]

  var highestPoint: Double {
    let max = dataPoints.max() ?? 1.0
    if max == 0 { return 1.0 }
    return max
  }

  var body: some View {
    GeometryReader { geometry in
      let height = geometry.size.height
      let width = geometry.size.width

      Path { path in
        path.move(to: CGPoint(x: 0, y: height * self.ratio(for: 0)))

        for index in 1..<dataPoints.count {
          path.addLine(to: CGPoint(
            x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
            y: height * self.ratio(for: index)))
        }
      }
      .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2, lineJoin: .round))
    }
    .padding(.vertical)
  }

  private func ratio(for index: Int) -> Double {
    1 - (dataPoints[index] / highestPoint)
  }
}

struct LineChartView: View {
  var dataPoints: [Double]
  var lineColor: Color = .red
  var outerCircleColor: Color = .red
  var innerCircleColor: Color = .white

  var body: some View {
    ZStack {
      LineView(dataPoints: dataPoints)
        .accentColor(lineColor)

      LineChartCircleView(dataPoints: dataPoints, radius: 3.0)
        .accentColor(outerCircleColor)

      //LineChartCircleView(dataPoints: dataPoints, radius: 1.0).accentColor(innerCircleColor)
    }
  }
}

struct LineChartCircleView: View {
  var dataPoints: [Double]
  var radius: CGFloat

  var highestPoint: Double {
    let max = dataPoints.max() ?? 1.0
    if max == 0 { return 1.0 }
    return max
  }

  var body: some View {
    GeometryReader { geometry in
      let height = geometry.size.height
      let width = geometry.size.width

      Path { path in
        path.move(to: CGPoint(x: 0, y: (height * self.ratio(for: 0)) - radius))

        path.addArc(center: CGPoint(x: 0, y: height * self.ratio(for: 0)),
                    radius: radius, startAngle: .zero,
                    endAngle: .degrees(360.0), clockwise: false)

        for index in 1..<dataPoints.count {
          path.move(to: CGPoint(
            x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
            y: height * dataPoints[index] / highestPoint))

          path.addArc(center: CGPoint(
            x: CGFloat(index) * width / CGFloat(dataPoints.count - 1),
            y: height * self.ratio(for: index)),
                      radius: radius, startAngle: .zero,
                      endAngle: .degrees(360.0), clockwise: false)
        }
      }
      .stroke(Color.accentColor, lineWidth: 2)
    }
    .padding(.vertical)
  }

  private func ratio(for index: Int) -> Double {
    1 - (dataPoints[index] / highestPoint)
  }
}
