//
//  InfoViewModel.swift
//  App546
//
//  Created by IGOR on 06/05/2024.
//

import SwiftUI
import CoreData

final class InfoViewModel: ObservableObject {

    @Published var isDirections: Bool = false
    @Published var isJum: Bool = false
    @Published var isAddJum: Bool = false
    @Published var isAddDirection: Bool = false

    @AppStorage("Directions") var Directions: [String] = []
    @AppStorage("Jums") var Jums: [String] = []

    @Published var addJum = ""
    @Published var addDir = ""

}

