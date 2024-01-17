//
//  ViewForm.swift
//  CySwiftUIForm
//
//  Created by Lucy on 29/07/21.
//

import Foundation
import SwiftUI

struct CellForm: View {

    @ObservedObject var modelField: ModelField
    @State var isError = false
    var body: some View {
        if modelField.strType.lowercased() == "textfield" {
            TextField(modelField.strTitle, text: self.$modelField.strInput)
                .onChange(of: self.modelField.strInput) { newValue in
                    print("Name changed to \(newValue)!")
                    if self.modelField.strInput.count < self.modelField.intMin {
                        isError = true
                    } else {
                        isError = false
                    }
                }
            if isError {
                Text(modelField.strErrDescription)
                    .foregroundColor(.red)
            }
        }

        if modelField.strType.lowercased() == "text" {
            Text(modelField.strTitle)
            Color(.theme)
        }
        if modelField.strType.lowercased() == "segment"{

            Picker("", selection: self.$modelField.intInput) {
                // render picker options modelFields[0].arrData

                ForEach(0..<modelField.arrData.count) { index in
                    Text(modelField.arrData[index]).tag(index)
                    //Text("asdadsa").tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            if modelField.strflow.lowercased() == "dynamic" {
                if self.modelField.intInput == 1 {
                    if let model = self.modelField.arrData2 {
                        ForEach(0..<model.count) { i in
                            let modelEx = model[i]
                            CellFormExtended(modelField: modelEx)
                        }
                    }
                }
            }
        }

        if modelField.strType.lowercased() == "wheel"{
            // Segment Picker
            if modelField.strOptions.lowercased() == "gender" {
                Picker("", selection:self.$modelField.intInput) {
                    ForEach(0..<modelField.arrData.count) { index in
                        Text(modelField.arrData[index]).tag(index)
                        //Text("asdadsa").tag(index)
                    }
                }.pickerStyle(WheelPickerStyle())
            }

            if modelField.strOptions.lowercased() == "data" {
                Picker("", selection:self.$modelField.intInput) {
                    ForEach(0..<modelField.arrData.count) { index in
                        Text(modelField.arrData[index]).tag(index)
                        //Text("asdadsa").tag(index)
                    }
                }.pickerStyle(WheelPickerStyle())
            }

            if modelField.strOptions.lowercased() == "color" {
                Picker("", selection: self.$modelField.intInput) {
                    ForEach(0..<modelField.arrData.count) { index in
                        Text(modelField.arrData[index]).tag(index)
                        //Text("asdadsa").tag(index)
                    }
                }.pickerStyle(WheelPickerStyle())
            }

        }

        if modelField.strType.lowercased() == "menu"{
            if modelField.strOptions.lowercased() == "data" {
                HStack {
                    Picker("SelectData", selection: self.$modelField.intInput) {
                        ForEach(0..<modelField.arrData.count) { index in
                            Text(modelField.arrData[index]).tag(index)
                            //Text("asdadsa").tag(index)
                        }
                    }.pickerStyle(MenuPickerStyle())

                    Spacer()
                    Text(self.modelField.arrData[modelField.intInput])
                }
            }
        }

        if modelField.strType.lowercased() == "date"{
            DatePicker("Date",
                       selection: self.$modelField.dateInput,
                       displayedComponents: [.date])
        }


    }
}


struct CellFormExtended: View {

    @ObservedObject var modelField: ModelField
    var body: some View {

        VStack {

            if modelField.strType.lowercased() == "textfield" {
                TextField(modelField.strTitle, text: self.$modelField.strInput)
            }

            if modelField.strType.lowercased() == "segment"{

                Picker("", selection: self.$modelField.intInput) {
                    // render picker options modelFields[0].arrData

                    ForEach(0..<modelField.arrData.count) { index in
                        Text(modelField.arrData[index]).tag(index)
                        //Text("asdadsa").tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            if modelField.strType.lowercased() == "wheel"{
                // Segment Picker
                if modelField.strOptions.lowercased() == "gender" {
                    Picker("", selection:self.$modelField.intInput) {
                        ForEach(0..<modelField.arrData.count) { index in
                            Text(modelField.arrData[index]).tag(index)
                            //Text("asdadsa").tag(index)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }

                if modelField.strOptions.lowercased() == "data" {
                    Picker("", selection:self.$modelField.intInput) {
                        ForEach(0..<modelField.arrData.count) { index in
                            Text(modelField.arrData[index]).tag(index)
                            //Text("asdadsa").tag(index)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }

                if modelField.strOptions.lowercased() == "color" {
                    Picker("", selection: self.$modelField.intInput) {
                        ForEach(0..<modelField.arrData.count) { index in
                            Text(modelField.arrData[index]).tag(index)
                            //Text("asdadsa").tag(index)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }

            }

            if modelField.strType.lowercased() == "menu"{
                if modelField.strOptions.lowercased() == "data" {
                    HStack {
                        Picker("SelectData", selection: self.$modelField.intInput) {
                            ForEach(0..<modelField.arrData.count) { index in
                                Text(modelField.arrData[index]).tag(index)
                                //Text("asdadsa").tag(index)
                            }
                        }.pickerStyle(MenuPickerStyle())

                        Spacer()
                        Text(self.modelField.arrData[modelField.intInput])
                    }
                }
            }

            if modelField.strType.lowercased() == "date"{
                DatePicker("Date",
                           selection: self.$modelField.dateInput,
                           displayedComponents: [.date])
            }
        }

    }
}
