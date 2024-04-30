//
//  StatisticsView.swift
//  Timeen
//
//  Created by Leonardo on 21/04/24.
//

import SwiftUI

struct StatisticsView: View {
    
    @State private var colors: [Color] = [ Color.red, Color.yellow]
    @EnvironmentObject private var bodyVM: BodyViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    StreakAnimatedIcon()
                        .font(.system(size: 70))
                    VStack {
                        Text("Racha")
                            .foregroundStyle(.orange.darker())
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Días seguidos de entrenamiento.")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("4")
                        .foregroundStyle(.orange.darker())
                        .bold()
                        .font(.system(size: 70))
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                
                HStack {
                    ScoreAnimatedIcon()
                        .font(.system(size: 70))
                    VStack {
                        Text("Score")
                            .foregroundStyle(Color(.blue))
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Promedio de las últimas 5 pruebas.")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("9.2")
                        .foregroundStyle(Color(.blue))
                        .bold()
                        .font(.system(size: 70))
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                
                
                
                HStack {
                    TestsAnimatedIcon()
                        .font(.system(size: 70))
                    VStack {
                        Text("Pruebas")
                            .foregroundStyle(Color(.red))
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Número de pruebas totales.")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("24")
                        .foregroundStyle(Color(.red))
                        .bold()
                        .font(.system(size: 70))
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                
                HStack {
                    DaysAnimatedIcon()
                        .font(.system(size: 70))
                    VStack {
                        Text("Días")
                            .foregroundStyle(Color.yellow)
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Número de pruebas totales.")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("11")
                        .foregroundStyle(Color(.yellow))
                        .bold()
                        .font(.system(size: 70))
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                
                HStack {
                    TestsAnimatedIcon()
                        .font(.system(size: 70))
                    VStack {
                        Text("Top")
                            .foregroundStyle(Color(.red))
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Número de pruebas totales.")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text("24")
                        .foregroundStyle(Color(.red))
                        .bold()
                        .font(.system(size: 70))
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                
                .navigationTitle("Estadísticas")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
            .background(Color(.background))
            
            BottomMenu()
        }
    }
}

#Preview {
    NavigationStack {
        StatisticsView()
            .environmentObject(BodyViewModel())
    }
}
