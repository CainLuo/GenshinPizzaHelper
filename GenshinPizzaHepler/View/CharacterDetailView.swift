//
//  CharacterDetailView.swift
//  GenshinPizzaHepler
//
//  Created by 戴藏龙 on 2022/10/3.
//

import SwiftUI

@available(iOS 15, *)
struct CharacterDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    var account: Account
    var playerDetail: PlayerDetail { try! account.playerDetailResult!.get() }
    @State var showingCharacterName: String
    var avatar: PlayerDetail.Avatar {
        playerDetail.avatars.first(where: { avatar in
            avatar.name == showingCharacterName
        })!
    }

    var animation: Namespace.ID

    var body: some View {
        TabView(selection: $showingCharacterName) {
            ForEach(playerDetail.avatars, id: \.name) { avatar in
                EachCharacterDetailDatasView(avatar: avatar, animation: animation)
            }
        }
        .tabViewStyle(.page)
        .onTapGesture {
            closeView()
        }
        .background(
            EnkaWebIcon(iconString: avatar.namecardIconString)
                .scaledToFill()
                .ignoresSafeArea(.all)
                .overlay(.thinMaterial)
        )
        .onChange(of: showingCharacterName) { _ in
            simpleTaptic(type: .selection)
        }
        .ignoresSafeArea()
        .statusBarHidden(true)
    }

    func closeView() {
        simpleTaptic(type: .light)
        withAnimation(.interactiveSpring(response: 0.25, dampingFraction: 1.0, blendDuration: 0)) {
            viewModel.showCharacterDetailOfAccount = nil
            viewModel.showingCharacterName = nil
        }
    }
}

