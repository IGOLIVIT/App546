//
//  ClassDetail.swift
//  App546
//
//  Created by IGOR on 07/05/2024.
//

import SwiftUI

struct ClassDetail: View {
    
    @StateObject var viewModel: CalendarViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedClass?.clName ?? "")
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
                    
                    Text(viewModel.selectedClass?.clDirection ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedClass?.clName ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedClass?.clJumVenue ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedClass?.clPrice ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Text(viewModel.selectedClass?.clDayWeek ?? "")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    HStack {

                        Text(viewModel.selectedClass?.clStartTime ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        
                        Text(viewModel.selectedClass?.clEndTime ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ClassDetail(viewModel: CalendarViewModel())
}
