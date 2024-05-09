//
//  U1.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 10) {
                    
                    Text("Сontrol your finances")
                        .foregroundColor(.white)
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Text("Create an operation in a few clicks")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
            }
        }
    }
}

#Preview {
    U1()
}
