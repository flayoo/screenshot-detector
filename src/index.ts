import { registerPlugin } from '@capacitor/core';

import type { ScreenshotDetectorPluginPlugin } from './definitions';

const ScreenshotDetectorPlugin = registerPlugin<ScreenshotDetectorPluginPlugin>('ScreenshotDetectorPlugin', {
  web: () => import('./web').then((m) => new m.ScreenshotDetectorPluginWeb()),
});

export * from './definitions';
export { ScreenshotDetectorPlugin };
