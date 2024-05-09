//
//  MemberDetail.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct MemberDetail: View {
    
    @StateObject var viewModel: MembersViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedMembers?.memName ?? "")
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
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .medium))

                        })
                        
                    }
                }
                .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text(viewModel.selectedMembers?.memName ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedMembers?.memNumber ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedMembers?.memDirections ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                }
                .padding()

            }
        }
    }
}

#Preview {
    MemberDetail(viewModel: MembersViewModel())
}
