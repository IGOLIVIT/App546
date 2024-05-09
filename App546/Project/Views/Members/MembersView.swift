//
//  MembersView.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct MembersView: View {
    
    @StateObject var viewModel = MembersViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Members")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                if viewModel.members.isEmpty {
                    
                    VStack {
                        
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.members, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment:.leading, spacing: 8) {
                                        
                                        Text(index.memName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Text(index.memNumber ?? "")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text("Information")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                                .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.3)))
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
                        
                        viewModel.isAdd = true
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
        .onAppear{
            
            viewModel.fetchMembers()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMembers(viewModel: viewModel)
        })
    }
}

#Preview {
    MembersView()
}
