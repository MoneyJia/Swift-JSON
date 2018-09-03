//
//  ViewModel.swift
//  Swift-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewModel    : NSObject {
    var coordinates: String!
    var truncated: Bool = false
    var created_at: String!
    var favorited: Bool = false
    var id_str: String!
    var in_reply_to_user_id_str: String!
    var entities: Entities!
    var text: String!
    var contributors: String!
    var id: Int = 0
    var retweet_count: Int = 0
    var in_reply_to_status_id_str: String!
    var geo: String!
    var retweeted: Bool = false
    var in_reply_to_user_id: String!
    var place: String!
    var source: String!
    var user: User!
    var in_reply_to_screen_name: String!
    var in_reply_to_status_id: String!
    
    init(jsonData:JSON) {
        
        coordinates = jsonData["coordinates"].stringValue
        truncated = jsonData["truncated"].boolValue
        created_at = jsonData["created_at"].stringValue
        favorited = jsonData["favorited"].boolValue
        id_str = jsonData["id_str"].stringValue
        in_reply_to_user_id_str = jsonData["in_reply_to_user_id_str"].stringValue
        entities = Entities.init(jsonData: jsonData["entities"])
        text = jsonData["text"].stringValue
        contributors = jsonData["contributors"].stringValue
        id = jsonData["id"].intValue
        retweet_count = jsonData["retweet_count"].intValue
        in_reply_to_status_id_str = jsonData["in_reply_to_status_id_str"].stringValue
        geo = jsonData["geo"].stringValue
        retweeted = jsonData["retweeted"].boolValue
        in_reply_to_user_id = jsonData["in_reply_to_user_id"].stringValue
        place = jsonData["place"].stringValue
        source = jsonData["source"].stringValue
        user = User.init(jsonData: jsonData["user"])
        in_reply_to_screen_name = jsonData["in_reply_to_screen_name"].stringValue
        in_reply_to_status_id = jsonData["in_reply_to_status_id"].stringValue
        
    }
    
    class Entities    : NSObject {
        
        var hashtags: [Any]!
        var user_mentions: [Any]!
        var description1: String!
        
        init(jsonData:JSON) {
            hashtags = jsonData["hashtags"].arrayObject
            user_mentions = jsonData["user_mentions"].arrayObject
            description1 = jsonData["description1"].stringValue
        }
        
    }
    
    class User    : NSObject {
        var name: String!
        var profile_sidebar_fill_color: String!
        var profile_background_tile: Bool = false
        var profile_sidebar_border_color: String!
        var profile_image_url: String!
        var created_at: String!
        var location: String!
        var follow_request_sent: Bool = false
        var id_str: String!
        var is_translator: Bool = false
        var profile_link_color: String!
        var default_profile: Bool = false
        var url: String!
        var contributors_enabled: Bool = false
        var favourites_count: Int = 0
        var profile_image_url_https: String!
        var id: Int = 0
        var listed_count: Int = 0
        var profile_use_background_image: Bool = false
        var profile_text_color: String!
        var followers_count: Int = 0
        var lang: String!
        var protected: Bool = false
        var geo_enabled: Bool = false
        var notifications: Bool = false
        var description1: String!
        var entities : Entities!
        var profile_background_color: String!
        var verified: Bool = false
        var profile_background_image_url_https: String!
        var statuses_count: Int = 0
        var profile_background_image_url: String!
        var default_profile_image: Bool = false
        var friends_count: Int = 0
        var following: Bool = false
        var show_all_inline_media: Bool = false
        var screen_name: String!
        
        init(jsonData:JSON) {
            profile_link_color = jsonData["profile_link_color"].stringValue
        }
        
    }
    
}
