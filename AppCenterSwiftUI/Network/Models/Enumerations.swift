import Foundation

enum OperationSystem: String, Decodable {
    case android = "Android"
    case iOS, macOS, tvOS
    case tizen = "Tizen"
    case windows = "Windows"
    case linux = "Linux"
    case custom = "Custom"
}


enum Platform: String, Decodable {
    case java = "Java"
    case apple = "Objective-C-Swift"
    case uwp = "UWP"
    case cordova = "Cordova"
    case reactNative = "React-Native"
    case unity = "Unity"
    case electron = "Electron"
    case xamarin = "Xamarin"
    case wpf = "WPF"
    case winForms = "WinForms"
    case unknown = "Unknown"
    case custom = "Custom"
}


enum Origin: String, Decodable {
    case appcenter, hockeyapp, codepush
}

enum Permission: String, Decodable {
    case manager, developer, viewer, tester
}

enum OwnerType: String, Decodable {
    case user
    case organization = "org"
}

enum DestinationType: String, Decodable {
    case group, store, tester
}

enum DistributionStore: String, Decodable {
    case intune, googleplay, apple, none
}
