//
//  LoginView_macOS.swift
//  iLegym (macOS)
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct LoginView: View {
    @State var userName = ""
    @State var userPassword = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("登录 iLegym")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 10, trailing: 10))
                    .foregroundColor(.blue)
                Spacer().frame(width: 100, height: 80)

                VStack {
                    Text("User Name")
                        .font(.callout)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your user name here.", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer()
                        .frame(width: 100, height: 16, alignment: .center)
                    Text("Password")
                        .font(.callout)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SecureField("Enter your password here.", text: $userPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                }.padding()
                Spacer().frame(width: 100, height: 60)

                Button(action: {
                }) {
                    Text("Log in")
                        .fontWeight(.bold)
                        .bold()
                        .foregroundColor(.white)
                }
//                    .frame(width: UIScreen.main.bounds.width - 32, height: 44, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(22)
                Spacer()
            }
            .onTapGesture {
                print("tap")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
