export interface ScreenshotDetectorPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
