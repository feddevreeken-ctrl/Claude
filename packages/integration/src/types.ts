export interface CompactContext {
  query: string;
  summary: string;
  keyPatterns: string[];
  tokenEstimate: number;
  compressionRatio: number;
}

export interface EditResult {
  success: boolean;
  file: string;
  linesChanged: number;
  durationMs: number;
  strategy: "fast-replace" | "ast-transform" | "diff-patch";
}

export interface SwarmConfig {
  agentCount: number;
  topology: "hierarchical" | "mesh" | "pipeline";
  maxConcurrency: number;
  timeoutMs: number;
  retryPolicy: {
    maxAttempts: number;
    backoffMs: number;
  };
  memoryStrategy: "shared" | "isolated" | "hybrid";
  coordinatorRatio: number;
}

export interface TokenOptimizerOptions {
  apiKey?: string;
  model?: string;
  contextWindowTokens?: number;
}
