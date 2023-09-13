//
//  Observable.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/09/13.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping ((T) -> Void)) {
        closure(value)
        listener = closure
    }
}