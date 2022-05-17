//
//  ContentView.swift
//  weatherApp
//
//  Created by Josafat Vicente Pérez on 17/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                
                cityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 25)
                HStack( spacing: 15){
                    DaysView(dayOFtheWeek: "Mon", imageName: "cloud.sun.fill", temperature: 20)
                    DaysView(dayOFtheWeek: "Tue", imageName: "cloud.sun.rain.fill", temperature: 22)
                    DaysView(dayOFtheWeek: "Wed", imageName: "cloud.bolt.rain.fill", temperature: 21)
                    DaysView(dayOFtheWeek: "Tue", imageName: "wind", temperature: 24)
                    DaysView(dayOFtheWeek: "Fri", imageName: "cloud.sun.fill", temperature: 25)
                }
                
                Spacer()
                Button{
                    isNight.toggle()
                } label : {
                    WeatherButton(title: "Change Day Time", textColor: .blue, bgColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DaysView: View {
    
    var dayOFtheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
       
            VStack{
                Text(dayOFtheWeek)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(temperature) C")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
           
            
        
    }
}

struct BackgroundView: View {
    
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct cityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature) C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 60)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50, alignment: .center)
            .background(bgColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
