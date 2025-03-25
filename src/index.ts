import { registerPlugin } from '@capacitor/core';
import type { ScreenshotDetectorPlugin } from './definitions';

const ScreenshotDetector = registerPlugin<ScreenshotDetectorPlugin>('ScreenshotDetector');

export * from './definitions';
export { ScreenshotDetector };