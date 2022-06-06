//
//  ContentView.swift
//  SwiftUIFirstApp
//
//  Created by desarrollador11 on 2/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = nil
    var body: some View {
        NavigationView {
            ScrollView{
        VStack {
                        VStack {
                            Text("Hello, world!")
                                .padding().font(.largeTitle).foregroundColor(.blue)
                            Image(systemName: "person.fill").resizable().frame(width: 50, height: 50)
                                    Menu{
                                        Button {
                                            } label: {
                                                Text("Linear")
                                                Image(systemName: "arrow.down.right.circle")
                                            }
                                            Button {
                                            } label: {
                                                Text("Radial")
                                                Image(systemName: "arrow.up.and.down.circle")
                                            }
                                        } label: {
                                             Text("DropDownMenu")
                                             Image(systemName: "tag.circle")
                                    }
                        }
                        
            
            
        }.background(Color.green)
                Divider()
                
            VStack {
                            VStack {
                                Text("Hello, world!")
                                    .padding().font(.largeTitle).foregroundColor(.blue)
                                Image(systemName: "person.fill").resizable().frame(width: 50, height: 50)
                                        Menu{
                                            Button {
                                                } label: {
                                                    Text("Linear")
                                                    Image(systemName: "arrow.down.right.circle")
                                                }
                                                Button {
                                                } label: {
                                                    Text("Radial")
                                                    Image(systemName: "arrow.up.and.down.circle")
                                                }
                                            } label: {
                                                 Text("DropDownMenu")
                                                 Image(systemName: "tag.circle")
                                        }
                            }
                
                
            }.background(Color.green)
                
            VStack {
                            VStack {
                                Text("Hello, world!")
                                    .padding().font(.largeTitle).foregroundColor(.blue)
                                Image(systemName: "person.fill").resizable().frame(width: 50, height: 50)
                                        Menu{
                                            Button {
                                                } label: {
                                                    Text("Linear")
                                                    Image(systemName: "arrow.down.right.circle")
                                                }
                                                Button {
                                                } label: {
                                                    Text("Radial")
                                                    Image(systemName: "arrow.up.and.down.circle")
                                                }
                                            } label: {
                                                 Text("DropDownMenu")
                                                 Image(systemName: "tag.circle")
                                        }
                            }
                
                
            }.background(Color.green)
                
            VStack {
                            VStack {
                                Text("Hello, world!")
                                    .padding().font(.largeTitle).foregroundColor(.blue)
                                Image(systemName: "person.fill").resizable().frame(width: 50, height: 50)
                                        Menu{
                                            Button {
                                                } label: {
                                                    Text("Linear")
                                                    Image(systemName: "arrow.down.right.circle")
                                                }
                                                Button {
                                                } label: {
                                                    Text("Radial")
                                                    Image(systemName: "arrow.up.and.down.circle")
                                                }
                                            } label: {
                                                 Text("DropDownMenu")
                                                 Image(systemName: "tag.circle")
                                        }
                            }
                
                
            }.background(Color.green)
            }.navigationTitle("Navigation").onAppear{
                UINavigationBarAppearance().setColor(title: .blue, background: .green)
            }
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
