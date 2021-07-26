//
//  ModelFormInput.swift
//  CySwiftUIForm
//
//  Created by Lucy on 25/07/21.
//

import Foundation

class ModelInput: ObservableObject {

    @Published var arrSection: [ModelSection] = []
    
}

struct ModelSection: Identifiable {
    let id = UUID()
    var intSection: Int = 0
    var arrInputFields: [ModelFieldInput] = [ModelFieldInput()]
}
struct ModelFieldInput: Identifiable {
    var strPickerSelection: String = ""
    var strTextField: String = ""
    var intPickerSelectionIndex: Int = 0
    let id = UUID()
}
