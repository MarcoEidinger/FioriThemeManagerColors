import FioriThemeManager
import SwiftUI

struct ColorPaletteView: View {
    @Binding var paletteVersion: PaletteVersion
    
    var body: some View {
        ScrollView {
            Text("Color Palette: \(paletteVersion.description)")
                .font(.largeTitle)

            LazyVGrid(columns: .flexible(2), spacing: 20) {
                ForEach(Array(paletteVersion.supportedStyles()).sorted { $0.rawValue < $1.rawValue }, id: \.self) { colorStyle in
                    HStack {
                        Circle()
                            .fill(Color.preferredColor(colorStyle))
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(colorStyle.rawValue).font(.title)
                            Text(Color.preferredColor(colorStyle).toHex() ?? "N/A").italic()
                                .textSelection(.enabled)
                        }
                    }
                    .frame(width: 500, height: 120, alignment: .leading)
                }
            }
        }
    }
}

private extension Array where Element == GridItem {
    static func flexible(_ amount: Int) -> [GridItem] {
        guard amount > 0 else { return [GridItem(.flexible())] }
        var result = [GridItem]()
        for _ in 0 ... amount-1 {
            result.append(GridItem(.flexible()))
        }
        return result
    }
}
