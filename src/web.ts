import { WebPlugin } from '@capacitor/core';

import type { BucaGoogleIntegrityPlugin } from './definitions';

export class BucaGoogleIntegrityWeb extends WebPlugin implements BucaGoogleIntegrityPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
