//
//  User.swift
//  Autolayout
//
//  Created by Victor Shurapov on 6/8/18.
//  Copyright © 2018 Victor Shurapov. All rights reserved.
//

import Foundation

struct User
{
    let name: String
    let company: String
    let login: String
    let password: String
    
    var lastLogin: Date
    
    static func login(login: String, password: String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }

     static let database: Dictionary<String, User> = {
        var theDatabase = Dictionary<String, User>()
        for user in [
            User(name: "John Appleseed", company: "Apple", login: "japple", password: "foo", lastLogin: Date.demoRandom()),
            User(name: "Madison Bumgarner", company: "World Champion San Francisco Giants", login: "madbum", password: "foo", lastLogin: Date.demoRandom()),
            User(name: "John Hennessy", company: "Stanford", login: "hennessy", password: "foo", lastLogin: Date.demoRandom()),
            User(name: "Bad Guy", company: "Criminals, Inc.", login: "baddie", password: "foo", lastLogin: Date.demoRandom())
        ] {
            theDatabase[user.login] = user
        }
        return theDatabase
    }()
}

private extension Date {
    static func demoRandom() -> Date {
        let randomIntervalIntoThePast = -Double(arc4random() % 60*60*24*20)
        return Date(timeIntervalSinceNow: randomIntervalIntoThePast)
    }
}
