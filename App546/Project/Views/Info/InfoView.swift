//
//  InfoView.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct InfoView: View {

    @StateObject var viewModel = InfoViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("More info")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        NavigationLink(destination: {
                            
                            DirectionsView(viewModel: viewModel)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            HStack {
                                
                                VStack(alignment:.leading, spacing: 8) {
                                    
                                    HStack {
                                        
                                        Image("directions")
                                        
                                        Text("Directions")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                    }
                                    
                                    Text("Types of training (Functional training, yoga, football, power training, boxing...)")
                                        .foregroundColor(.white.opacity(0.2))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 200, alignment: .leading)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.3)))
                            .padding(1)
                        })
                        
                        NavigationLink(destination: {
                            
                            JumView(viewModel: viewModel)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            HStack {
                                
                                VStack(alignment:.leading, spacing: 8) {
                                    
                                    HStack {
                                        
                                        Image("jum")
                                        
                                        Text("Jum / Venue")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                    }
                                    
                                    Text("Types of training (Functional training, yoga, football, power training, boxing...)")
                                        .foregroundColor(.white.opacity(0.2))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 200, alignment: .leading)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.3)))
                            .padding(1)
                        })
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    InfoView()
}
