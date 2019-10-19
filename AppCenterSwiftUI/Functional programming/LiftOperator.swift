prefix operator ^

prefix func ^ <T>(_ value: @autoclosure @escaping () -> T) -> () -> T {
    value
}
