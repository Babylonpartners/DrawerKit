import UIKit

extension PresentationController {
    var durationInSeconds: TimeInterval {
        return configuration.durationInSeconds
    }

    var timingCurveProvider: UITimingCurveProvider {
        return configuration.timingCurveProvider
    }

    var supportsPartialExpansion: Bool {
        return configuration.supportsPartialExpansion
    }

    var dismissesInStages: Bool {
        return configuration.dismissesInStages
    }

    var flickSpeedThreshold: CGFloat {
        return configuration.flickSpeedThreshold
    }

    var upperMarkGap: CGFloat {
        return configuration.upperMarkGap
    }

    var lowerMarkGap: CGFloat {
        return configuration.lowerMarkGap
    }

    var maximumCornerRadius: CGFloat {
        return configuration.maximumCornerRadius
    }

    var isDrawerDraggable: Bool {
        return configuration.isDrawerDraggable
    }

    var isFullyPresentableByDrawerTaps: Bool {
        return configuration.isFullyPresentableByDrawerTaps
    }

    var numberOfTapsForFullDrawerPresentation: Int {
        return configuration.numberOfTapsForFullDrawerPresentation
    }

    var isDismissableByOutsideDrawerTaps: Bool {
        return configuration.isDismissableByOutsideDrawerTaps
    }

    var numberOfTapsForOutsideDrawerDismissal: Int {
        return configuration.numberOfTapsForOutsideDrawerDismissal
    }
}
