//
//  CalendarView.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("Sunday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesSunday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesSunday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Monday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesMonday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesMonday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Tuesday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesTuesday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesTuesday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Wednesday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesWednesday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesWednesday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Thursday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesThursday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesThursday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Friday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesFriday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesFriday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))

                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Text("Saturday")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    if viewModel.fetchClassesSaturday().isEmpty {
                        
                        HStack {
                            
                            Text("No classes")
                                .foregroundColor(.white.opacity(0.2))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                        .padding(.horizontal)
                        
                    } else {
                        
                        LazyVStack(spacing: 8) {
                            
                            ForEach(viewModel.fetchClassesSaturday(), id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text("\(index.clStartTime ?? "") - \(index.clEndTime ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("\(index.clColor ?? "")")))
                                     
                                        Text(index.clName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedClass = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isMore = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image("more")
                                    })
                                }
                                .padding()
                                .frame(height: 80)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                                .padding(.horizontal)
                            }
                        }
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isMore ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMore = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMore = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("\(viewModel.selectedClass?.clName ?? "") \(viewModel.selectedClass?.clStartTime ?? "")-\(viewModel.selectedClass?.clEndTime ?? "")")
                        .foregroundColor(.black.opacity(0.6))
                        .font(.system(size: 13, weight: .regular))
                        .padding()

                    Button(action: {

                        withAnimation(.spring()) {
                            
                            viewModel.isMore = false
                            
                        }
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = true
                        }
                                
                    }, label: {
                        
                        Text("Details")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMore = false
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isMore ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteClass(withClassName: viewModel.selectedClass?.clName ?? "", completion: {
                            
                            viewModel.fetchClasses()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddClass(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ClassDetail(viewModel: viewModel)
        })
        .onAppear{
            
            viewModel.fetchClasses()
        }
    }
}

#Preview {
    CalendarView()
}
