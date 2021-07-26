//
//  ModelForm.swift
//  WKWebViewLocal
//
//  Created by Lucy on 17/06/21.
//  Copyright © 2021 Mellowmuse. All rights reserved.
//
import SwiftUI
import Foundation
/*
 {
     "column":"1",
     "titleSection": "Personal Info",
     "fields":[
         {
             "title":"name",
             "type":"textfield",
             "minStr":"3",
             "maxStr":"30",
             "errorDesc":"This field is required",
             "isRequired":"true",
             "placeholder":"input your name",
             "textColor":"black",
             "data":["sample a", "sample b", "sample c"],
             "typeData":"string",
         },
     ],
 },
 */
import Foundation

class SampleData: ObservableObject {
    @Published var strInput1: String = ""
    @Published var intInput1: Int = 0

    @Published var strInput2: String = ""
    @Published var intInput2: Int = 0

    @Published var strInput3: String = ""
    @Published var intInput3: Int = 0

    @Published var strInput4: String = ""
    @Published var intInput4: Int = 0
    
    @Published var strInput5: String = ""
    @Published var intInput5: Int = 0

    @Published var strInput6: String = ""
    @Published var intInput6: Int = 0

    @Published var date: Date = Date()
    @Published var date2: Date = Date()
}

class ModelForms: Codable {
    let id = UUID()
    var intColumn: Int
    var strTitleSection: String
    var modelFields: [ModelField]

    var dictionary: [String: Any] {
        return
            [
                "column": intColumn,
                "titleSection": strTitleSection,
            ]
    }

    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }

    enum CodingKeys: String, CodingKey {
        case intColumn = "column"
        case strTitleSection = "titleSection"
        case modelFields = "fields"
    }

}

class ModelField: Codable {
    let id = UUID()
    var strTitle: String
    var strType: String
    var strErrDescription: String
    var intMin: Int
    var intMax: Int
    var strPlaceholder: String
    var strColorText: String
    var strIsRequired: String
    var strTypeData: String
    var strOptions: String
    var arrData: [String] = []
    var strInput: String = ""
    var intInput: Int = 0
    var dateInput: Date = Date()

    var dictionary: [String: Any] {
        return
            [
                "type": strType,
                "title": strTitle,
                "errorDesc": strErrDescription,
                "placeholder": strPlaceholder,
                "textColor": strColorText,
                "minStr": intMin,
                "maxStr": intMax,
                "isRequired": strIsRequired,
                "typeData": strTypeData,
                "options": strOptions,
                "data": arrData,

            ]
    }
    enum CodingKeys: String, CodingKey {
        case strTitle = "title"
        case strType = "type"
        case strErrDescription = "errorDesc"
        case strPlaceholder = "placeholder"
        case strColorText = "textColor"
        case intMin = "minStr"
        case intMax = "maxStr"
        case strIsRequired = "isRequired"
        case strTypeData = "typeData"
        case strOptions = "options"
        case arrData = "data"

    }
}
/*  "title":"name",
 "type":"textfield",
 "minStr":"3",
 "maxStr":"30",
 "errorDesc":"This field is required",
 "isRequired":"true",
 "placeholder":"input your name",
 "textColor":"black",
 "data":["sample a", "sample b", "sample c"],
 "typeData":"string",*/
