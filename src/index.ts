import { registerPlugin } from '@capacitor/core';

import type { BucaGoogleIntegrityPlugin } from './definitions';

const BucaGoogleIntegrity = registerPlugin<BucaGoogleIntegrityPlugin>('BucaGoogleIntegrity', {
  web: () => import('./web').then((m) => new m.BucaGoogleIntegrityWeb()),
});

export * from './definitions';
export { BucaGoogleIntegrity };
