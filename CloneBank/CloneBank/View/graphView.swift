//
//  graphView.swift
//  CloneBank
//
//  Created by desarrollador11 on 11/06/22.
//

import SwiftUI

struct graphView: View {
    var logs: [ActivityLog]
    @Binding var selectedIndex: Int
        
    init(logs: [ActivityLog], selectedIndex: Binding<Int>) {
        self._selectedIndex = selectedIndex
        
        let curr = Date() // Today's Date
        let sortedLogs = logs.sorted { (log1, log2) -> Bool in
            log1.date > log2.date
        } // Sort the logs in chronological order
        
        var mergedLogs: [ActivityLog] = []

        for i in 0..<12 { // Loop back for the past 12 weeks

            var weekLog: ActivityLog = ActivityLog(distance: 0, duration: 0, elevation: 0, date: Date())

            for log in sortedLogs {
                // If log is within specific week, then add to weekly total
                if log.date.distance(to: curr.addingTimeInterval(TimeInterval(-604800 * i))) < 604800 && log.date < curr.addingTimeInterval(TimeInterval(-604800 * i)) {
                    weekLog.distance += log.distance
                    weekLog.duration += log.duration
                    weekLog.elevation += log.elevation
                }
            }

            mergedLogs.insert(weekLog, at: 0)
        }

        self.logs = mergedLogs
    }
    var body: some View {
        ZStack{
            drawGrid()
            //.opacity(0.2)
            //.overlay(drawActivityGradient(logs: logs))
            //.overlay(drawActivityLine(logs: logs))
            .overlay(staticGraph().stroke(LinearGradient(gradient: Gradient(colors: [.orange, .clear]), startPoint: .top, endPoint: .bottom),style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round)))
            .overlay(staticGraph().fill(LinearGradient(gradient: Gradient(colors: [.orange, .clear]), startPoint: .top, endPoint: .bottom)))
            //.overlay(drawLogPoints(logs: logs))
            //.overlay(addUserInteraction(logs: logs))
//            staticGraph()
//                .stroke(.red,style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
//            //.fill(.red)
//                .frame(width: 300, height: 300)
//            staticGraph()
//                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))
//                .frame(width: 300, height: 300)
            
        //drawActivityGradient(logs: logs)
            //Circle().foregroundColor(.red).frame(width: 100, height: 100, alignment: .center)
        }
    }
}

struct graphView_Previews: PreviewProvider {
    static var previews: some View {
        graphView(logs: ActivityTestData.testData, selectedIndex: Binding<Int>.constant(0))
    }
}

struct ActivityLog {
    var distance: Double // Miles
    var duration: Double // Seconds
    var elevation: Double // Feet
    var date: Date
}

class ActivityTestData {
    static let testData: [ActivityLog] = [
            ActivityLog(distance: 1.77, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1609282718)),
            ActivityLog(distance: 3.01, duration: 2800, elevation: 156, date: Date(timeIntervalSince1970: 1607813915)),
            ActivityLog(distance: 8.12, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1607381915)),
            ActivityLog(distance: 2.22, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
            ActivityLog(distance: 3.12, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
            ActivityLog(distance: 9.01, duration: 3200, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
            ActivityLog(distance: 7.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
            ActivityLog(distance: 4.76, duration: 3200, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
            ActivityLog(distance: 12.12, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
            ActivityLog(distance: 6.01, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1604185115)),
            ActivityLog(distance: 8.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
            ActivityLog(distance: 4.76, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1603234715))
    ]
}

func drawGrid() -> some View {
    VStack(spacing: 0) {
        Color.black.frame(height: 1, alignment: .center)
        HStack(spacing: 0) {
            Color.clear
                .frame(width: 8, height: 100)
            ForEach(0..<11) { i in
                Color.black.frame(width: 1, height: 100, alignment: .center)
                Spacer()

            }
            Color.black.frame(width: 1, height: 100, alignment: .center)
            Color.clear
                .frame(width: 8, height: 100)
        }
        Color.black.frame(height: 1, alignment: .center)
    }
}

func drawActivityGradient(logs: [ActivityLog]) -> some View {
    LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
        //.padding(.horizontal, 8)
        //.padding(.bottom, 1)
        //.opacity(0.8)
        .mask(
            GeometryReader { geo in
                Path { p in
                    // Used for scaling graph data
                    let maxNum = logs.reduce(0) { (res, log) -> Double in
                        return max(res, log.distance)
                    }

                    let scale = geo.size.height / CGFloat(maxNum)

                    //Week Index used for drawing (0-11)
                    var index: CGFloat = 0

                    // Move to the starting y-point on graph
                    p.move(to: CGPoint(x: 8, y: geo.size.height - (CGFloat(logs[Int(index)].distance) * scale)))

                    // For each week draw line from previous week
                    for _ in logs {
                        if index != 0 {
                            p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / 11) * index, y: geo.size.height - (CGFloat(logs[Int(index)].distance) * scale)))
                        }
                        index += 1
                    }

                    // Finally close the subpath off by looping around to the beginning point.
                    p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / 11) * (index - 1), y: geo.size.height))
                    p.addLine(to: CGPoint(x: 8, y: geo.size.height))
                    p.closeSubpath()
                }
            }//.background(Color.green)
        )
}

struct staticGraph: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //path.move(to: CGPoint(x: 90, y: 100))
        path.move(to: CGPoint(x: 100, y: 100))
//        path.addLine(to: CGPoint(x: -20, y: 30))
//        path.addLine(to: CGPoint(x: -10, y: 70))
//        path.addLine(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: 100))
        path.addLine(to: CGPoint(x: 10, y: 50))
        path.addLine(to: CGPoint(x: 20, y: 90))
        path.addLine(to: CGPoint(x: 30, y: 40))
        path.addLine(to: CGPoint(x: 40, y: 30))
        path.addLine(to: CGPoint(x: 50, y: 55))
        path.addLine(to: CGPoint(x: 60, y: 20))
        path.addLine(to: CGPoint(x: 70, y: 30))
        path.addLine(to: CGPoint(x: 80, y: 55))
        path.addLine(to: CGPoint(x: 90, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 15))
        path.addLine(to: CGPoint(x: 110, y: 90))
        path.addLine(to: CGPoint(x: 120, y: 50))
        path.addLine(to: CGPoint(x: 130, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 90))
        path.addLine(to: CGPoint(x: 150, y: 40))
        path.addLine(to: CGPoint(x: 160, y: 30))
        path.addLine(to: CGPoint(x: 170, y: 55))
        path.addLine(to: CGPoint(x: 180, y: 100))
        path.addLine(to: CGPoint(x: 190, y: 90))
        path.addLine(to: CGPoint(x: 200, y: 50))
        path.addLine(to: CGPoint(x: 210, y: 50))
        path.addLine(to: CGPoint(x: 220, y: 90))
        path.addLine(to: CGPoint(x: 230, y: 40))
        path.addLine(to: CGPoint(x: 240, y: 30))
        path.addLine(to: CGPoint(x: 250, y: 55))
        path.addLine(to: CGPoint(x: 260, y: 100))
        path.addLine(to: CGPoint(x: 270, y: 30))
        path.addLine(to: CGPoint(x: 280, y: 55))
        path.addLine(to: CGPoint(x: 290, y: 100))
        path.addLine(to: CGPoint(x: 300, y: 50))
        path.addLine(to: CGPoint(x: 310, y: 50))
        path.addLine(to: CGPoint(x: 320, y: 90))
        path.addLine(to: CGPoint(x: 330, y: 40))
        path.addLine(to: CGPoint(x: 340, y: 30))
        path.addLine(to: CGPoint(x: 350, y: 55))
        path.addLine(to: CGPoint(x: 360, y: 100))
        path.addLine(to: CGPoint(x: 370, y: 30))
        path.addLine(to: CGPoint(x: 380, y: 55))
        path.addLine(to: CGPoint(x: 390, y: 100))
        path.closeSubpath()
        //path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

func drawActivityLine(logs: [ActivityLog]) -> some View {
    GeometryReader { geo in
        Path { p in
            let maxNum = logs.reduce(0) { (res, log) -> Double in
                return max(res, log.distance)
            }

            let scale = geo.size.height / CGFloat(maxNum)
            var index: CGFloat = 0

            p.move(to: CGPoint(x: 8, y: geo.size.height - (CGFloat(logs[0].distance) * scale)))

            for _ in logs {
                if index != 0 {
                    p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / 11) * index, y: geo.size.height - (CGFloat(logs[Int(index)].distance) * scale)))
                }
                index += 1
            }
        }
        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 80, dash: [], dashPhase: 0))
        .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
    }
}

func drawLogPoints(logs: [ActivityLog]) -> some View {
    GeometryReader { geo in

        let maxNum = logs.reduce(0) { (res, log) -> Double in
            return max(res, log.distance)
        }

        let scale = geo.size.height / CGFloat(maxNum)

        ForEach(logs.indices) {
            i in
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 80, dash: [], dashPhase: 0))
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
                .background(Color.white)
                .cornerRadius(5)
                .offset(x: 8 + ((geo.size.width - 16) / 11) * CGFloat(i) - 5, y: (geo.size.height - (CGFloat(logs[i].distance) * scale)) - 5)
        }
    }
}
