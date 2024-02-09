import SwiftUI

struct ProgressContentView: View {
    let calendar = Calendar.current
    let today = Date()
    
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                // Weekly calendar
                HStack(spacing: 8) {
                    ForEach(0..<7, id: \.self) { index in
                        let weekdayDate = calendar.date(byAdding: .day, value: index, to: startOfWeek)!
                        VStack {
                            Text(weekdayDate, format: .dateTime.weekday(.abbreviated))
                                .font(.caption)
                            Text(weekdayDate, format: .dateTime.day())
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                
                // Circular progress bar for daily step goal
                ZStack {
                    Circle()
                        .stroke(lineWidth: 20.0)
                        .opacity(0.3)
                        .foregroundColor(.blue)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.4)
                        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.purple)
                        .rotationEffect(Angle(degrees: 270.0))
                    
                    Text("7,235 steps")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(width: 200, height: 200)
                .padding(.vertical, 8)
                
                // Icons for calories, distance, and active minutes
                HStack(spacing: 16) {
                    // Calories burned
                    Image(systemName: "flame.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    // Distance covered
                    Image(systemName: "figure.walk.circle")
                        .foregroundColor(.blue)
                        .imageScale(.large)
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    // Active minutes
                    Image(systemName: "clock.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                }
                .padding(.vertical, 8)
                
                // Tabs for Daily, Week, Month
                HStack {
                    Text("DAILY")
                        .foregroundColor(.gray)
                    Text("WEEK")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Capsule().fill(Color.purple))
                    Text("MONTH")
                        .foregroundColor(.gray)
                }
                .font(.headline)
                .padding(.vertical, 8)
                
                // Line graph for weekly step count
                LineGraphView()
                    .frame(height: 200)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(LinearGradient(
                                colors: [Color.purple.opacity(0.6), Color.purple],
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                    )
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Notifications")
                .tabItem {
                    Label("Notifications", systemImage: "bell")
              }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .padding()
    }
    
    var startOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        return calendar.date(from: components)!
    }
}

struct LineGraphView: View {
    var body: some View {
        GeometryReader { geometry in
            let dataPoints: [CGFloat] = [0.2, 0.5, 0.3, 0.8, 0.7, 0.6, 0.9]
            let stepHeight = geometry.size.height
            let stepWidth = geometry.size.width / CGFloat(dataPoints.count - 1)
            
            Path { path in
                for index in dataPoints.indices {
                    let xPosition = stepWidth * CGFloat(index)
                    let yPosition = stepHeight * (1 - dataPoints[index])
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
               }
            }
            .stroke(Color.white, lineWidth: 2)
            
            ForEach(dataPoints.indices, id: \.self) { index in
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                    .position(x: stepWidth * CGFloat(index), y: stepHeight * (1 - dataPoints[index]))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressContentView()
    }
}



struct WalletContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
            
            VStack {
                Text("70%")
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(.black)
                Text("Available")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    WalletContentView()
}
