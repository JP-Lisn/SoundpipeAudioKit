// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AudioKit
import AudioKitEX
import AVFoundation
import CAudioKitEX

/// A 2nd order tunable equalization filter that provides a
/// peak/notch filter for building parametric/graphic equalizers.
/// With gain above 1, there will be a peak at the center frequency
/// with a width dependent on bandwidth. If gain is less than 1, a notch is
/// formed around the center frequency.
///
public class EqualizerFilter: Node {
    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "eqfl")

    // MARK: - Parameters

    /// Specification details for centerFrequency
    public static let centerFrequencyDef = NodeParameterDef(
        identifier: "centerFrequency",
        name: "Center Frequency",
        address: akGetParameterAddress("EqualizerFilterParameterCenterFrequency"),
        defaultValue: 1000.0,
        range: 12.0 ... 20000.0,
        unit: .hertz
    )

    /// Center frequency. (in Hertz)
    @Parameter(centerFrequencyDef) public var centerFrequency: AUValue

    /// Specification details for bandwidth
    public static let bandwidthDef = NodeParameterDef(
        identifier: "bandwidth",
        name: "Bandwidth",
        address: akGetParameterAddress("EqualizerFilterParameterBandwidth"),
        defaultValue: 100.0,
        range: 0.0 ... 20000.0,
        unit: .hertz
    )

    /// The peak/notch bandwidth in Hertz
    @Parameter(bandwidthDef) public var bandwidth: AUValue

    /// Specification details for gain
    public static let gainDef = NodeParameterDef(
        identifier: "gain",
        name: "Gain",
        address: akGetParameterAddress("EqualizerFilterParameterGain"),
        defaultValue: 10.0,
        range: -100.0 ... 100.0,
        unit: .percent
    )

    /// The peak/notch gain
    @Parameter(gainDef) public var gain: AUValue

    // MARK: - Initialization

    /// Initialize this filter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - centerFrequency: Center frequency. (in Hertz)
    ///   - bandwidth: The peak/notch bandwidth in Hertz
    ///   - gain: The peak/notch gain
    ///
    public init(
        _ input: Node,
        centerFrequency: AUValue = centerFrequencyDef.defaultValue,
        bandwidth: AUValue = bandwidthDef.defaultValue,
        gain: AUValue = gainDef.defaultValue
    ) {
        self.input = input

        setupParameters()

        self.centerFrequency = centerFrequency
        self.bandwidth = bandwidth
        self.gain = gain
    }
}
