export interface BucaGoogleIntegrityPlugin {
  checkIntegrity(data: any): Promise<any>;
}
