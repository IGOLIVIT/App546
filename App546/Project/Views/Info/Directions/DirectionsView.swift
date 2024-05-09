//
//  DirectionsView.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct DirectionsView: View {

    @StateObject var viewModel: InfoViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Directions")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.Directions.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            Image("info")
                            
                            Text("Add directions")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .padding(.top)
                        
                        Text("This will help you make calendar entries more conveniently")
                            .foregroundColor(.white.opacity(0.2))
                            .font(.system(size: 12, weight: .regular))
                            .multilineTextAlignment(.center)
                            .frame(width: 250)
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                            .background(Circle().fill(Color("prim")))
                            .padding()
                            .opacity(0.2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.3)))
                    .padding()
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.Directions, id: \.self) { index in
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        if viewModel.Directions.contains(index) {
                                            
                                            if let indexer = viewModel.Directions.firstIndex(of: index) {
                                                
                                                viewModel.Directions.remove(at: indexer)
                                            }
                                            
                                        }

                                    }, label: {
                                        
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .font(.system(size: 16, weight: .regular))
                                    })
                                }
                                .padding()
                                .frame(height: 70)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                                .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.3)))
                                .padding(1)
                            }
                        }
                        .padding()
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddDirection = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                        .background(Circle().fill(Color("prim")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAddDirection, content: {
            
            AddDirections(viewModel: viewModel)
        })
    }
}

#Preview {
    DirectionsView(viewModel: InfoViewModel())
}
