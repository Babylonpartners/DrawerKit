import UIKit

/// All the configurable parameters in one place.

public struct DrawerConfiguration {
    /// The total duration, in seconds, for the drawer to transition from its
    /// collapsed state to its fully-expanded state, or vice-versa. The default
    /// value is 0.4 seconds.
    public var totalDurationInSeconds: TimeInterval

    /// When the drawer transitions between its collapsed and partially-expanded
    /// states, or between its partially-expanded and its fully-expanded states, in
    /// either direction, the distance traveled by the drawer is some fraction of
    /// the total distance traveled between the collapsed and fully-expanded states.
    /// You have a choice between having those fractional transitions take the same
    /// amount of time as the full transition, and having them take a time that is
    /// a fraction of the total time, where the fraction used is the fraction of
    /// space those partial transitions travel. In the first case, all transitions
    /// have the same duration (`totalDurationInSeconds`) but different speeds, while
    /// in the second case different transitions have different durations but the same
    /// speed. The default is `false`, that is, all transitions last the same amount
    /// of time.
    public var durationIsProportionalToDistanceTraveled: Bool

    /// The type of timing curve to use for the animations. The full set of cubic
    /// Bezier curves and spring-based curves is supported. Note that selecting a
    /// spring-based timing curve may cause the `totalDurationInSeconds` parameter
    /// to be ignored because the duration, for a fully general spring-based timing
    /// curve provider, is computed based on the specifics of the spring-based curve.
    /// The default is `UISpringTimingParameters()`, which is the system's global
    /// spring-based timing curve.
    public var timingCurveProvider: UITimingCurveProvider

    /// When `true`, the drawer is presented first in its partially expanded state.
    /// When `false`, the presentation is always to full screen and there is no
    /// partially expanded state. The default value is `true`.
    public var supportsPartialExpansion: Bool

    /// When `true`, dismissing the drawer from its fully expanded state can result
    /// in the drawer stopping at its partially expanded state. When `false`, the
    /// dismissal is always straight to the collapsed state. Note that
    /// `supportsPartialExpansion` being `false` implies `dismissesInStages` being
    /// `false` as well but you can have `supportsPartialExpansion == true` and
    /// `dismissesInStages == false`, which would result in presentations to the
    /// partially expanded state but all dismissals would be straight to the collapsed
    /// state. The default value is `true`.
    public var dismissesInStages: Bool

    /// Whether or not the drawer can be dragged up and down. The default value is `true`.
    public var isDrawerDraggable: Bool

    /// Whether or not the drawer can be fully presentable by tapping on it.
    /// The default value is `true`.
    public var isFullyPresentableByDrawerTaps: Bool

    /// How many taps are required for fully presenting the drawer by tapping on it.
    /// The default value is 1.
    public var numberOfTapsForFullDrawerPresentation: Int

    /// Whether or not the drawer can be dismissed by tapping anywhere outside of it.
    /// The default value is `true`.
    public var isDismissableByOutsideDrawerTaps: Bool

    /// How many taps are required for dismissing the drawer by tapping outside of it.
    /// The default value is 1.
    public var numberOfTapsForOutsideDrawerDismissal: Int

    /// How fast one needs to "flick" the drawer up or down to make it ignore the
    /// partially expanded state. Flicking fast enough up always presents to full screen
    /// and flicking fast enough down always collapses the drawer. A typically good value
    /// is around 3 points per screen height per second, and that is also the default
    /// value of this property.
    public var flickSpeedThreshold: CGFloat

    /// There is a band around the partially expanded position of the drawer where
    /// ending a drag inside will cause the drawer to move back to the partially
    /// expanded position (subjected to the conditions set by `supportsPartialExpansion`
    /// and `dismissesInStages`, of course). Set `inDebugMode` to `true` to see lines
    /// drawn at those positions. This value represents the gap *above* the partially
    /// expanded position. The default value is 40 points.
    public var upperMarkGap: CGFloat

    /// There is a band around the partially expanded position of the drawer where
    /// ending a drag inside will cause the drawer to move back to the partially
    /// expanded position (subjected to the conditions set by `supportsPartialExpansion`
    /// and `dismissesInStages`, of course). Set `inDebugMode` to `true` to see lines
    /// drawn at those positions. This value represents the gap *below* the partially
    /// expanded position. The default value is 40 points.
    public var lowerMarkGap: CGFloat

    /// The animating drawer also animates the radius of its top left and top right
    /// corners, from 0 to the value of this property. Setting this to 0 prevents any
    /// corner animations from taking place. The default value is 15 points.
    public var maximumCornerRadius: CGFloat

    /// Whether or not to automatically add a handle view to the presented content.
    /// The default is `true`.
    public var hasHandleView: Bool

    /// The configuration options for the handle view, should it be shown.
    public var handleViewConfiguration: HandleViewConfiguration

    public init(totalDurationInSeconds: TimeInterval = 0.4,
                durationIsProportionalToDistanceTraveled: Bool = false,
                timingCurveProvider: UITimingCurveProvider = UISpringTimingParameters(),
                supportsPartialExpansion: Bool = true,
                dismissesInStages: Bool = true,
                isDrawerDraggable: Bool = true,
                isFullyPresentableByDrawerTaps: Bool = true,
                numberOfTapsForFullDrawerPresentation: Int = 1,
                isDismissableByOutsideDrawerTaps: Bool = true,
                numberOfTapsForOutsideDrawerDismissal: Int = 1,
                flickSpeedThreshold: CGFloat = 3,
                upperMarkGap: CGFloat = 40,
                lowerMarkGap: CGFloat = 40,
                maximumCornerRadius: CGFloat = 15,
                hasHandleView: Bool = true,
                handleViewConfiguration: HandleViewConfiguration = HandleViewConfiguration()) {
        self.totalDurationInSeconds = (totalDurationInSeconds > 0 ? totalDurationInSeconds : 0.4)
        self.durationIsProportionalToDistanceTraveled = durationIsProportionalToDistanceTraveled
        self.timingCurveProvider = timingCurveProvider
        self.supportsPartialExpansion = supportsPartialExpansion
        self.dismissesInStages = dismissesInStages
        self.isDrawerDraggable = isDrawerDraggable
        self.isFullyPresentableByDrawerTaps = isFullyPresentableByDrawerTaps
        self.numberOfTapsForFullDrawerPresentation = max(0, numberOfTapsForFullDrawerPresentation)
        self.isDismissableByOutsideDrawerTaps = isDismissableByOutsideDrawerTaps
        self.numberOfTapsForOutsideDrawerDismissal = max(0, numberOfTapsForOutsideDrawerDismissal)
        self.flickSpeedThreshold = max(0, flickSpeedThreshold)
        self.upperMarkGap = max(0, upperMarkGap)
        self.lowerMarkGap = max(0, lowerMarkGap)
        self.maximumCornerRadius = max(0, maximumCornerRadius)
        self.hasHandleView = hasHandleView
        self.handleViewConfiguration = handleViewConfiguration
    }
}

extension DrawerConfiguration: Equatable {
    public static func ==(lhs: DrawerConfiguration, rhs: DrawerConfiguration) -> Bool {
        return lhs.totalDurationInSeconds == rhs.totalDurationInSeconds
            && lhs.durationIsProportionalToDistanceTraveled == rhs.durationIsProportionalToDistanceTraveled
            && lhs.timingCurveProvider === rhs.timingCurveProvider
            && lhs.supportsPartialExpansion == rhs.supportsPartialExpansion
            && lhs.dismissesInStages == rhs.dismissesInStages
            && lhs.isDrawerDraggable == rhs.isDrawerDraggable
            && lhs.isFullyPresentableByDrawerTaps == rhs.isFullyPresentableByDrawerTaps
            && lhs.numberOfTapsForFullDrawerPresentation == rhs.numberOfTapsForFullDrawerPresentation
            && lhs.isDismissableByOutsideDrawerTaps == rhs.isDismissableByOutsideDrawerTaps
            && lhs.numberOfTapsForOutsideDrawerDismissal == rhs.numberOfTapsForOutsideDrawerDismissal
            && lhs.flickSpeedThreshold == rhs.flickSpeedThreshold
            && lhs.upperMarkGap == rhs.upperMarkGap
            && lhs.lowerMarkGap == rhs.lowerMarkGap
            && lhs.maximumCornerRadius == rhs.maximumCornerRadius
            && lhs.hasHandleView == rhs.hasHandleView
            && lhs.handleViewConfiguration == rhs.handleViewConfiguration
    }
}
