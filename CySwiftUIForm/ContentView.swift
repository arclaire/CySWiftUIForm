//
//  ContentView.swift
//  CySwiftUIForm
//
//  Created by Lucy on 21/07/21.
//

import SwiftUI

struct ContentView: View {
    private var modelForms: [ModelForms] = UtilsData.shared.modelForms
    @ObservedObject var modelData: SampleData = SampleData()
    @State private var selectedGenderIndex: Int = 0
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false


    @ObservedObject private var modelInput: ModelInput = ModelInput()

    private var arrGender = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]
    private var arrData = ["Data1", "Data2", "Data3"]
    private var arrColors = ["red", "green", "blue", "white"]
    @State var isPrivate: Bool = true

    init() {
        for (index,dataSection) in self.modelForms.enumerated() {
            var inputForm: ModelSection = ModelSection()
            inputForm.intSection = index
            for _ in dataSection.modelFields {
                let modelField: ModelFieldInput = ModelFieldInput()
                inputForm.arrInputFields.append(modelField)
            }
            self.modelInput.arrSection.append(inputForm)
        }
    }

    var body: some View {
        //NavigationView {
        Form {

            ForEach(0..<self.modelForms.count) { i in
                let modelSect = self.modelForms[i]
                if modelSect.intColumn > 1 {
                    Section(header: Text(modelSect.strTitleSection)) {
                        HStack {
                            ForEach(0..<modelSect.modelFields.count) { y in
                                let model = modelSect.modelFields[y]
                                CellForm(modelField:model)
                            }
                        }

                    }
                } else {
                    Section(header: Text(modelSect.strTitleSection)) {
                        ForEach(0..<modelSect.modelFields.count) { y in
                            let model = modelSect.modelFields[y]
                            
                            CellForm(modelField:model)
                        }
                    }

                }

            }
        }
        //.navigationBarTitle("Form")
        //}

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
