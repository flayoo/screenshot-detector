import Capacitor
import UIKit

@objc(ScreenshotDetectorPlugin)
public class ScreenshotDetectorPlugin: CAPPlugin {
    private var screenshotObserver: NSObjectProtocol?
    private var captureObserver: NSObjectProtocol?
    private var overlayView: UIView?

    @objc func enableDetection(_ call: CAPPluginCall) {
        // Screenshot-Erkennung aktivieren
        if screenshotObserver == nil {
            screenshotObserver = NotificationCenter.default.addObserver(
                forName: UIApplication.userDidTakeScreenshotNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                self?.notifyListeners("screenshotTaken", data: [:])
            }
        }

        // Screen Recording Detection aktivieren
        if captureObserver == nil {
            captureObserver = NotificationCenter.default.addObserver(
                forName: UIScreen.capturedDidChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                self?.handleScreenCaptureChange()
            }
        }

        // Initial-Check
        handleScreenCaptureChange()

        call.resolve()
    }

    @objc func disableDetection(_ call: CAPPluginCall) {
        // Screenshot-Erkennung deaktivieren
        if let observer = screenshotObserver {
            NotificationCenter.default.removeObserver(observer)
            screenshotObserver = nil
        }

        // Screen Recording Detection deaktivieren
        if let observer = captureObserver {
            NotificationCenter.default.removeObserver(observer)
            captureObserver = nil
        }

        removeOverlay()

        call.resolve()
    }

    private func handleScreenCaptureChange() {
        DispatchQueue.main.async {
            if UIScreen.main.isCaptured {
                self.addOverlay()
                self.notifyListeners("screenRecordingStarted", data: [:])
            } else {
                self.removeOverlay()
                self.notifyListeners("screenRecordingStopped", data: [:])
            }
        }
    }

    private func addOverlay() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }

        if overlayView == nil {
            let overlay = UIView(frame: window.bounds)
            overlay.backgroundColor = .black
            overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            window.addSubview(overlay)
            window.bringSubviewToFront(overlay)
            overlayView = overlay
        }
    }

    private func removeOverlay() {
        overlayView?.removeFromSuperview()
        overlayView = nil
    }
}