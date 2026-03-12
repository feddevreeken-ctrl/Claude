export { TokenOptimizer } from "./token-optimizer.js";
export type {
  CompactContext,
  EditResult,
  SwarmConfig,
  TokenOptimizerOptions,
} from "./types.js";

import { TokenOptimizer } from "./token-optimizer.js";
import type { TokenOptimizerOptions } from "./types.js";

/**
 * Returns a singleton-style TokenOptimizer instance.
 * Reads ANTHROPIC_API_KEY from the environment when no apiKey is provided.
 */
export async function getTokenOptimizer(
  options?: TokenOptimizerOptions,
): Promise<TokenOptimizer> {
  return new TokenOptimizer(options);
}
