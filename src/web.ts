import { WebPlugin } from '@capacitor/core';

import type { ScreenshotDetectorPluginPlugin } from './definitions';

export class ScreenshotDetectorPluginWeb extends WebPlugin implements ScreenshotDetectorPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
