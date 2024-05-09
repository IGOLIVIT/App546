//
//  AddMembers.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct AddMembers: View {
    
    @StateObject var viewModel: MembersViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a member")
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
                
                ScrollView(.vertical, showsIndicators: false) {

                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.memName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.memName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Phone number")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.memNumber.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.memNumber)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))

                    Menu(content: {
                        
                        ForEach(viewModel.Directions, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentDir = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentDir.isEmpty {
                            
                            HStack {
                                
                                Text("Directions")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentDir)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                            }
                        }
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
      
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.memDirections = viewModel.currentDir
                    
                    viewModel.addMember()
                    
                    viewModel.memName = ""
                    viewModel.memNumber = ""
                    viewModel.currentDir = ""
                    
                    viewModel.fetchMembers()
                    
                    viewModel.isAdd = false
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding()
                .opacity(viewModel.memName.isEmpty || viewModel.memNumber.isEmpty ? 0.5 : 1)
                .disabled(viewModel.memName.isEmpty || viewModel.memNumber.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddMembers(viewModel: MembersViewModel())
}
