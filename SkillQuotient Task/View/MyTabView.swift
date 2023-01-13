//
//  MyTabView.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//
import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            NavigationView{
                Summary()
            }
                .tabItem {
                    Label("Summary", systemImage: "list.dash")
                }

            Text("Accounts")
                .tabItem {
                    Label("Accounts", systemImage: "square.and.pencil")
                }
            Text("payments")
                .tabItem {
                    Label("Payments", systemImage: "square.fill")
                }
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
