import { createBrowserClient } from "@supabase/ssr";
import type { Database } from './types';

export const createClient = () =>
  createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
  );

export const supabase = createClient<Database>(NEXT_PUBLIC_SUPABASE_UR, EXT_PUBLIC_SUPABASE_ANON_KEY);
