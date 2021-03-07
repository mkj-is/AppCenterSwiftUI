struct Equalized<T>: Equatable {
    let value: T

    static func == (lhs: Equalized<T>, rhs: Equalized<T>) -> Bool { true }
}
