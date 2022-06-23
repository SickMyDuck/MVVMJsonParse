////
////  PictureData.swift
////  MVVMJsonParse
////
////  Created by Ruslan Sadritdinov on 22.06.2022.
////
//
//import Foundation
//
//enum Content: Decodable {
//    case pictureData(PictureData)
//    case selectorData(SelectorData)
//    case hzData(HzData)
//}
//
//struct PictureData: Decodable {
//    let url: String
//    let text: String
//    
//    enum CodingKeys: String, CodingKey {
//        case url, text
//    }
//}
//
//struct SelectorData: Decodable {
//    let selectedID: Int
//    let variants: [Variant]
//    
//    enum CodingKeys: String, CodingKey {
//        case selectedID = "selectedId"
//        case variants
//    }
//}
//
//struct Variant: Decodable {
//    let id: Int
//    let text: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id, text
//    }
//}
//
//struct HzData: Decodable {
//    let text: String
//    
//    enum CodingKeys: String, CodingKey {
//        case text
//    }
//}
//
//struct RootData: Decodable {
//    let name: String
//    let testData: Content
//    
//    
//    enum ElementType:String, Decodable {
//        case hz
//        case picture
//        case selector
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case name, testData
//    }
//    
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let singleContainer = try decoder.singleValueContainer()
//        
//        let name = try container.decode(ElementType.self, forKey: .name)
//        
//        switch name {
//        case .hz:
//            let hzData = try singleContainer.decode(HzData.self)
//            testData = .hzData(hzData)
//        case .picture:
//            let pictureData = try singleContainer.decode(PictureData.self)
//            testData = .pictureData(pictureData)
//        case .selector:
//            let selectorData = try singleContainer.decode(SelectorData.self)
//            testData = .selectorData(selectorData)
//        }
//        
//        self.name = try container.decode(ElementType.self, forKey: .name).rawValue
//    }
//}
//
//struct Root: Decodable {
//    let testData: [RootData]
//    let view: [String]
//}
//
