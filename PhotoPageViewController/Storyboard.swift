// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardScene : RawRepresentable {
  static var storyboardName : String { get }
  static func storyboard() -> UIStoryboard
  static func initialViewController() -> UIViewController
  func viewController() -> UIViewController
  static func viewController(identifier: Self) -> UIViewController
}

extension StoryboardScene where Self.RawValue == String {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    return storyboard().instantiateInitialViewController()!
  }

  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

extension UIStoryboard {
  struct Scene {

    enum Main : String, StoryboardScene {
      static let storyboardName = "Main"

      case PageItemViewController = "pageItemViewController"
      static func pageItemViewControllerViewController() -> ImagePageItemViewController {
        return Main.PageItemViewController.viewController() as! ImagePageItemViewController
      }
    }
  }

  struct Segue {
    enum Main : String {
      case ShowCollectionVIewPageController = "showCollectionVIewPageController"
      case ShowUIPageVIewController = "showUIPageVIewController"
    }
  }
}
