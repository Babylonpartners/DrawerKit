import UIKit

// TODO:
// - support device interface orientation changes
// - support insufficiently tall content
// - support not-covering status bar and/or having a gap at the top

/// Instances of this class are returned as part of the `DrawerPresenting` protocol.
public final class DrawerDisplayController: NSObject {
    /// The collection of configurable parameters dictating how the drawer works.
    public let configuration: DrawerConfiguration

    weak var presentingVC: (UIViewController & DrawerPresenting)?
    /* strong */ var presentedVC: (UIViewController & DrawerPresentable)

    let inDebugMode: Bool

    /// Initialiser for `DrawerDisplayController`.
    ///
    /// - Parameters:
    ///   - presentingViewController:
    ///        the view controller presenting the drawer.
    ///   - presentedViewController:
    ///        the view controller wanting to be presented as a drawer.
    ///   - configuration:
    ///        the collection of configurable parameters dictating how the drawer works.
    ///   - inDebugMode:
    ///        a boolean value which, when true, draws guiding lines on top of the
    ///        presenting view controller but below the presented view controller.
    ///        Its default value is false.
    public init(presentingViewController: (UIViewController & DrawerPresenting),
                presentedViewController: (UIViewController & DrawerPresentable),
                configuration: DrawerConfiguration = DrawerConfiguration(),
                inDebugMode: Bool = false) {
        self.presentingVC = presentingViewController
        self.presentedVC = presentedViewController
        self.configuration = configuration
        self.inDebugMode = inDebugMode
        super.init()
        presentedViewController.transitioningDelegate = self
        presentedViewController.modalPresentationStyle = .custom
        presentedViewController.modalTransitionStyle = .coverVertical
    }
}
