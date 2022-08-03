import FioriThemeManager
import SwiftUI

struct ColorPaletteView: View {
    @Binding var colorScheme: ColorScheme?
    @Binding var paletteVersion: PaletteVersion
    
    @State var searchText = ""

    var backgroundColorScheme: BackgroundColorScheme {
        colorScheme == .dark ? .darkConstant : .lightConstant
    }
    
    var body: some View {

        ScrollView {
            Text("Color Palette: \(paletteVersion.description)")
                .font(.largeTitle)
            
            TextField("Search", text: $searchText, prompt: Text("Search with Color Name")).multilineTextAlignment(.center)

            LazyVGrid(columns: .flexible(2), spacing: 20) {
                ForEach(Array(paletteVersion.supportedStyles()).sorted { $0.rawValue < $1.rawValue }
                    .filter({ colorStyle in
                        if searchText.count > 0 {
                            return colorStyle.rawValue.lowercased().contains(searchText.lowercased())
                        } else {
                            return true
                        }
                }), id: \.self) { colorStyle in
                    HStack {
                        Circle()
                            .fill(Color.preferredColor(colorStyle))
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(colorStyle.rawValue).font(.title)
                            Text(Color.preferredColor(colorStyle, background: backgroundColorScheme).toHex() ?? "N/A").italic()
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
        return Array(repeating: GridItem(.flexible()), count: amount)
    }
}
