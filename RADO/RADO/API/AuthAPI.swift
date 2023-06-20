import Foundation

enum AuthAPI {
    case login
    case signup
    
    func path() -> String {
        switch self {
        case .login:
            return "/user/login"
        case .signup:
            return "/user/signup"
        }
    }
}
