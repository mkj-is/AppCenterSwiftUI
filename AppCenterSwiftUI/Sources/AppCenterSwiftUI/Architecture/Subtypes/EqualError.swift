struct EqualError: Equatable {
    let error: Error

    static func == (lhs: EqualError, rhs: EqualError) -> Bool { true }
}
