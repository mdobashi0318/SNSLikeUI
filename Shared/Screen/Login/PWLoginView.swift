//
//  PWLoginView.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/12/11.
//

import Foundation
import SwiftUI

struct PWLoginView: View {
    
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15) {
                TextField("メールアドレス", text: $viewModel.mailaddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("パスワード", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Button(action: {
                    self.viewModel.login()
                }) {
                    Text("ログイン")
                        .modifier(CornerRadiusModifier(backgroundColor: viewModel.mailaddress.isEmpty || viewModel.password.isEmpty ? Color.gray : Color.blue,
                                                       width: 150, height: 50)
                        )
                }
                .disabled(viewModel.mailaddress.isEmpty || viewModel.password.isEmpty)
                Spacer()
            }
            .fullScreenCover(isPresented: $viewModel.isAuth) {
                BaseView()
            }
            .alert(isPresented: $viewModel.isAlert) {
                Alert(title: Text("メールアドレスまたは、パスワードが違います"), dismissButton: .cancel(Text("閉じる")))
            }
        }
    }
}



struct PWLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PWLoginView()
    }
}
