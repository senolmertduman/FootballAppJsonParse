//
//  LeaguesVCPresenter.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 12.08.2023.
//

import Foundation

class LeaguesVCPresenter:ViewtoPresenterLeaguesVCProtocol{
    var interactor: PresentertoInteractorLeaguesVCProtocol?
    var view: PresentertoViewLeaguesVCProtocol?
    func getAllCompetitions() {
        interactor?.getCompetitions()
    }
}
extension LeaguesVCPresenter:InteractortoPresenterLeaguesVCProtocol{
    func sendDatatoLeaguesVCPresenter(competitions: [Competitions]) {
        view?.sendDatatoLeaguesVCView(competitions: competitions)
    }
}
