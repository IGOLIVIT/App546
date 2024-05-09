//
//  Not.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Not")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                 
                    Image("not2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(30)
                    
                }
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 10) {
                    
                    Text("Don't miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        
                        
                    }, label: {
                        
                        Text("Enable notifications")
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
            
            VStack {
                
                Button(action: {}, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                        .padding(5)
                        .background(Circle().fill(.white))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
