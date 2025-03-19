export interface BucaGoogleIntegrityPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
