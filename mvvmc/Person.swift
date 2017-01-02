//
//  Person.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String
    var lastName: String
    var nickname: String
    var cpf: Int
    var phoneNumber: Int
    var birthDate: Date

    init(mockParameter: Int) {
        self.firstName = "Nome\(mockParameter)"
        self.lastName = "Sobrenome\(mockParameter)"
        self.nickname = "pessoa\(mockParameter)"
        self.cpf = 10000000000 + mockParameter
        self.phoneNumber = 11000000000 + mockParameter

        let time = Double(24 * 3600 * mockParameter)
        self.birthDate = Date().addingTimeInterval(time)
    }
}
