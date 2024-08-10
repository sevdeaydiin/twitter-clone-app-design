//
//  SlideMenu.swift
//  twitter-clone-app
//
//  Created by Sevde Aydın on 19.07.2024.
//

import SwiftUI

var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]

struct SlideMenu: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @Binding var isUserProfileActive: Bool
    @State var show = true
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    
                    Button {
                        isUserProfileActive = true
                    } label: {
                        Image("logo")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipShape(Circle())
                    }

                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading) {
                            Button {
                                isUserProfileActive = true
                            } label: {
                                Text(viewModel.currentUser?.name ?? "Name")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            }
                            Text("@\(viewModel.currentUser!.username)")
                                .foregroundStyle(.gray)
                            
                            HStack(spacing: 20) {
                                FollowView(count: 10, title: "Following")
                                FollowView(count: 8, title: "Followers")
                            }.padding(.top, 10)
                        }
                    }
                    Divider()
                        .padding(.top, 10)
                }
                Spacer()
                Button {
                    withAnimation {
                        self.show.toggle()
                    }
                } label: {
                    Image(systemName: show ? "chevron.down" : "chevron.up")
                        .foregroundStyle(.bg)
                }
            }
            
            VStack(alignment: .leading) {
                Button {
                    isUserProfileActive = true
                } label: {
                    MenuButton(title: "Profile")
                }
                
                ForEach(menuButtons, id: \.self) { item in
                    MenuButton(title: item)
                }
                
                Divider()
                    .padding(.top)
                
                Button {
                    viewModel.logout()
                } label: {
                    MenuButton(title: "Twitter Ads")
                }
                
                Divider()
                
                Button {
                    
                } label: {
                    Text("Settings and privacy")
                        .foregroundStyle(.black)
                }.padding(.top, 20)
                Button {
                    
                } label: {
                    Text("Help center")
                        .foregroundStyle(.black)
                }
                Spacer()
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("help")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.bg)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("barcode")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.bg)
                    }
                }
            }
            .opacity(show ? 1 : 0)
            .frame(height: show ? nil : 0)
            
            
            VStack(alignment: .leading) {
                Button {
                    
                } label: {
                    Text("Create a new account")
                        .foregroundStyle(.bg)
                }
                Button {
                    
                } label: {
                    Text("Add an existing account")
                        .foregroundStyle(.bg)
                }
                
                Spacer()
            }
            .opacity(!show ? 1 : 0)
            .frame(height: !show ? nil : 0)
            .padding(.top, 10)
        }
        .padding(.horizontal, 20)
        .padding(.top, edges!.top == 0 ? 15 : edges?.top)
        .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
        .frame(width: Sizes.width - 90)
        .background(.white)
        .ignoresSafeArea(.all, edges: .vertical)
        Spacer()
    }
}

