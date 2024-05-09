//
//  AddJum.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct AddJum: View {

    @StateObject var viewModel: InfoViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Jum / Venue")
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
                        
                        Text("Enter")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addJum.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addJum)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.Jums.append(viewModel.addJum)
                    
                    viewModel.addJum = ""
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.addJum.isEmpty ? 0.5 : 1)
                .disabled(viewModel.addJum.isEmpty ? true : false)
                .padding()
            }
        }
    }
}

#Preview {
    AddJum(viewModel: InfoViewModel())
}