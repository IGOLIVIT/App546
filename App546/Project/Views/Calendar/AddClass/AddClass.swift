//
//  AddClass.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct AddClass: View {
    
    @StateObject var viewModel: CalendarViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a class")
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
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.clName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.clName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    Menu(content: {
                        
                        ForEach(viewModel.Jums, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentJum = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentJum.isEmpty {
                            
                            HStack {
                                
                                Text("Jum / Venue")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentJum)
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
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Price")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.clPrice.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.clPrice)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding(.bottom, 25)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.days, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentDay = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentDay.isEmpty {
                            
                            HStack {
                                
                                Text("Days of the week*")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentDay)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Start time*")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.clStartTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.clStartTime)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("End time*")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.clEndTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.clEndTime)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    }
                    .padding(.bottom, 25)

                    HStack {
                        
                        ForEach(viewModel.colors, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentColor = index
                                
                            }, label: {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(Color("\(index)"))
                                        .frame(width: 40)
                                        .frame(maxWidth: .infinity)
                                 
                                    Circle()
                                        .stroke(.white, lineWidth: 1)
                                        .frame(width: 50)
                                        .opacity(viewModel.currentColor == index ? 1 : 0)
                                    
                                }
                            })
                            
                        }
                    }
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.clJumVenue = viewModel.currentJum
                    viewModel.clDirection = viewModel.currentDir
                    viewModel.clDayWeek = viewModel.currentDay
                    viewModel.clColor = viewModel.currentColor
                    
                    viewModel.addClass()
                    
                    viewModel.currentDir = ""
                    viewModel.currentJum = ""
                    viewModel.clName = ""
                    viewModel.clPrice = ""
                    viewModel.currentDay = ""
                    viewModel.clStartTime = ""
                    viewModel.clEndTime = ""
                    viewModel.currentColor = ""
                    
                    viewModel.fetchClasses()
                    
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
                .opacity(viewModel.currentDay.isEmpty || viewModel.clStartTime.isEmpty || viewModel.clEndTime.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentDay.isEmpty || viewModel.clStartTime.isEmpty || viewModel.clEndTime.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddClass(viewModel: CalendarViewModel())
}
