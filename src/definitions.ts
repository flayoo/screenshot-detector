export interface ScreenshotDetectorPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

}

export interface ScreenshotDetectorPlugin {
  enableDetection(): Promise<void>;
  disableDetection(): Promise<void>;
  addListener(
    eventName: 'screenshotTaken' | 'screenRecordingStarted' | 'screenRecordingStopped',
    listenerFunc: () => void
  ): Promise<void>;
}
