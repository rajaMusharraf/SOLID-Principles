//
//  LoginModel.swift
//  SOLID Principles
//
//  Created by Raja Musharraf on 18/02/2026.
//

struct LoginResponseModel: Codable {
    var id : String?
    var username : String?
    var useremail : String?
    var name : String?
    var token : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case useremail = "useremail"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        useremail = try values.decodeIfPresent(String.self, forKey: .useremail)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
