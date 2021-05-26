// Split a String into its "words"
func splitStringIntoParts(_ expression: String) -> [String] {
    return expression.split{ $0 == " " }.map{ String($0) }
}
