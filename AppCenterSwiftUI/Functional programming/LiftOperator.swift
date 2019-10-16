//
//  LiftOperator.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 16/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

prefix operator ^

prefix func ^ <T>(_ value: T) -> () -> T {
    { value }
}
