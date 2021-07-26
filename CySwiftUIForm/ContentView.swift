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
                let modelSectInput = self.$modelInput.arrSection[i]
                if modelSect.intColumn > 1 {
                    Section(header: Text(modelSect.strTitleSection)) {
                        HStack {
                            ForEach(0..<modelSect.modelFields.count) { y in
                                let modelField = modelSect.modelFields[y]
                                let modelInputField = modelSectInput.arrInputFields[y]

                                if modelField.strType.lowercased() == "text" {
                                    Text(modelField.strTitle)
                                }

                                if modelField.strType.lowercased() == "textfield" {
                                    TextField(modelField.strTitle, text: modelInputField.strTextField)
                                }

                                if modelField.strType.lowercased() == "segment"{
                                    // Segment Picker
                                    //self.$modelInput.arrSection[i].arrInputFields[y].intPickerSelectionIndex
                                    // print(self.modelForms[0].modelFields[0].strOptions)
                                    if modelField.strOptions.lowercased() == "gender" {
                                        Picker("", selection: $modelData.intInput1) {
                                            // render picker options modelFields[0].arrData

                                            ForEach(0..<self.arrGender.count) { index in
                                                Text(self.arrGender[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                    }

                                    if modelField.strOptions.lowercased() == "data" {
                                        Picker("", selection: $selectedGenderIndex) {
                                            // render picker options modelFields[0].arrData

                                            ForEach(0..<self.arrData.count) { index in
                                                Text(self.arrData[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                    }

                                    if modelField.strOptions.lowercased() == "color" {
                                        Picker("", selection: $selectedGenderIndex) {
                                            // render picker options modelFields[0].arrData

                                            ForEach(0..<self.arrColors.count) { index in
                                                Text(self.arrColors[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                    }
                                }

                                if modelField.strType.lowercased() == "wheel"{
                                    // Segment Picker
                                    if modelField.strOptions.lowercased() == "gender" {
                                        Picker("", selection: $modelData.intInput3) {
                                            ForEach(0..<self.arrGender.count) { index in
                                                Text(self.arrGender[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(WheelPickerStyle())
                                    }

                                    if modelField.strOptions.lowercased() == "data" {
                                        Picker("", selection: $modelData.intInput3) {
                                            ForEach(0..<self.arrData.count) { index in
                                                Text(self.arrData[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(WheelPickerStyle())
                                    }

                                    if modelField.strOptions.lowercased() == "color" {
                                        Picker("", selection: $modelData.intInput3) {
                                            ForEach(0..<self.arrColors.count) { index in
                                                Text(self.arrColors[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(WheelPickerStyle())
                                    }

                                }

                                if modelField.strType.lowercased() == "date"{
                                    DatePicker("Date",
                                               selection: $modelData.date2,
                                               displayedComponents: [.date])
                                }

                            }
                        }

                    }
                } else {
                    Section(header: Text(modelSect.strTitleSection)) {
                        ForEach(0..<modelSect.modelFields.count) { y in
                            let modelField = modelSect.modelFields[y]
                            let modelInputField = modelSectInput.arrInputFields[y]

                            if modelField.strType.lowercased() == "text" {
                                Text(modelField.strTitle)
                            }

                            if modelField.strType.lowercased() == "textfield" {
                                TextField(modelField.strTitle, text: modelInputField.strTextField)
                            }

                            if modelField.strType.lowercased() == "segment"{
                                // Segment Picker
                                //self.$modelInput.arrSection[i].arrInputFields[y].intPickerSelectionIndex
                                // print(self.modelForms[0].modelFields[0].strOptions)
                                if modelField.strOptions.lowercased() == "gender" {
                                    Picker("", selection: $modelData.intInput2) {
                                        // render picker options modelFields[0].arrData

                                        ForEach(0..<self.arrGender.count) { index in
                                            Text(self.arrGender[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                }

                                if modelField.strOptions.lowercased() == "data" {
                                    Picker("", selection: $selectedGenderIndex) {
                                        // render picker options modelFields[0].arrData

                                        ForEach(0..<self.arrData.count) { index in
                                            Text(self.arrData[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                }

                                if modelField.strOptions.lowercased() == "color" {
                                    Picker("", selection: $selectedGenderIndex) {
                                        // render picker options modelFields[0].arrData

                                        ForEach(0..<self.arrColors.count) { index in
                                            Text(self.arrColors[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                }
                            }

                            if modelField.strType.lowercased() == "wheel"{
                                // Segment Picker
                                if modelField.strOptions.lowercased() == "gender" {
                                    Picker("", selection: $modelData.intInput4) {
                                        ForEach(0..<self.arrGender.count) { index in
                                            Text(self.arrGender[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                }

                                if modelField.strOptions.lowercased() == "data" {
                                    Picker("", selection: $modelData.intInput4) {
                                        ForEach(0..<self.arrData.count) { index in
                                            Text(self.arrData[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                }

                                if modelField.strOptions.lowercased() == "color" {
                                    Picker("", selection: $modelData.intInput4) {
                                        ForEach(0..<self.arrColors.count) { index in
                                            Text(self.arrColors[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                }

                            }

                            if modelField.strType.lowercased() == "menu"{
                                if modelField.strOptions.lowercased() == "data" {
                                    HStack {
                                        Picker("SelectData", selection: $modelData.intInput5) {
                                            ForEach(0..<self.arrData.count) { index in
                                                Text(self.arrData[index]).tag(index)
                                                //Text("asdadsa").tag(index)
                                            }
                                        }.pickerStyle(MenuPickerStyle())

                                        Spacer()
                                        Text(self.arrData[modelData.intInput5])
                                    }
                                }

                                if modelField.strOptions.lowercased() == "color" {
                                    Picker("Select Color", selection: $modelData.intInput5) {
                                        ForEach(0..<self.arrColors.count) { index in
                                            Text(self.arrColors[index]).tag(index)
                                            //Text("asdadsa").tag(index)
                                        }
                                    }.pickerStyle(MenuPickerStyle())
                                }

                            }
                            if modelField.strType.lowercased() == "date"{
                                DatePicker("Date of birth",
                                           selection: $modelData.date,
                                           displayedComponents: [.date])
                            }
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
