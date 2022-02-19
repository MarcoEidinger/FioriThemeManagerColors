import FioriThemeManager

extension PaletteVersion {
    var description: String {
        switch self {
        case .v3_x:
            return "3_x"
        case .v3_2:
            return "3_2"
        case .v4:
            return "4"
        case .v5:
            return "5"
        case .v6:
            return "6"
        }
    }
}
