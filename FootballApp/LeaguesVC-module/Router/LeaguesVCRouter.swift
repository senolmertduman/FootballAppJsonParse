//
//  LeaguesVCRouter.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 12.08.2023.
//

import Foundation

class LeaguesVCRouter: PresentertoRouterLeaguesVCProtocol{
    static func createLeaguesVCModel(ref: LeaguesVC) {
        let presenter = LeaguesVCPresenter()
        
        ref.leaguesVCPresenter = presenter
        
        ref.leaguesVCPresenter?.interactor = LeaguesVCInteractor()
        ref.leaguesVCPresenter?.view = ref
        
        ref.leaguesVCPresenter?.interactor?.presenter = presenter
    }
}
