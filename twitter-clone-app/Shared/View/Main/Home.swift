//
//  Home.swift
//  twitter-clone-app
//
//  Created by Sevde Aydın on 15.07.2024.
//

import SwiftUI

struct Home: View {
    
    @State var showCreateTweet = false
    @State var selectedIndex = 0
    @Binding var x: CGFloat
    let user: User
    
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    Feed(user: user)
                        .toolbar(.hidden)
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                              Image("Home")
                            
                        }
                        .tag(0)
                        
                    SearchView()
                        .toolbar(.hidden)
                        .onTapGesture {
                           
                        }
                        .tabItem {
                                Image("Search")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color.bg)
                        }
                        .tag(1)
                    
                    NotificationsView()
                        .toolbar(.hidden)
                        .onTapGesture {
                            
                        }
                        .tabItem {
                                Image("Notifications")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color.bg)
                            
                        }
                        .tag(2)
                    
                    MessagesView()
                        .toolbar(.hidden)
                        .onTapGesture {
                           
                           
                        }
                        .tabItem {
                                Image("Messages")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color.bg)
                          
                        }
                        .tag(3)
                }
                .padding(.bottom, 15)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        //if self.selectedIndex == 3 {
                            Button {
                                self.showCreateTweet.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    //.renderingMode(.template)
                                    //.resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.bg)
                                    
                                    .clipShape(Circle())
                        }
                        //}
                        /*else {
                            Button {
                                self.showCreateTweet.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    //.renderingMode(.template)
                                    //.resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.bg)
                                    
                                    .clipShape(Circle())
                        }
                        }*/
                        
                    }.padding()
                }.padding(.bottom, Sizes.height * 0.11)
            }
        }.sheet(isPresented: $showCreateTweet, content: {
            CreateTweetView(show: $showCreateTweet)
        })
    }
}
