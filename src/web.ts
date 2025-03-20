import { WebPlugin } from '@capacitor/core';

import type { BucaGoogleIntegrityPlugin } from './definitions';

export class BucaGoogleIntegrityWeb extends WebPlugin implements BucaGoogleIntegrityPlugin {
  async checkIntegrity() {}
}
