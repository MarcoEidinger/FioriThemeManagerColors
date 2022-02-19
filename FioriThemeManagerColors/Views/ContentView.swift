import FioriThemeManager
import SwiftUI

struct ContentView: View {
    @State var selectedColorPaletteVersion: PaletteVersion = .v6

    @Environment(\.colorScheme) var systemColorScheme
    @State var colorScheme: ColorScheme?

    var body: some View {
        NavigationView {

            SidebarView(
                paletteVersion: $selectedColorPaletteVersion,
                colorScheme: $colorScheme
            )

            ColorPaletteView(
                paletteVersion: $selectedColorPaletteVersion
            )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(colorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
