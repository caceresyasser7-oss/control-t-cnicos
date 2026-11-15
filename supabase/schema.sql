-- Control de Técnicos de Taller: tablas, seguridad y tiempo real.
-- Pegar completo en Supabase → SQL Editor → New query → Run.

create table if not exists public.tecnicos (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
create table if not exists public.ots (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
create table if not exists public.config (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Solo usuarios con sesión iniciada pueden leer y escribir.
alter table public.tecnicos enable row level security;
alter table public.ots      enable row level security;
alter table public.config   enable row level security;

drop policy if exists "usuarios del taller" on public.tecnicos;
drop policy if exists "usuarios del taller" on public.ots;
drop policy if exists "usuarios del taller" on public.config;
create policy "usuarios del taller" on public.tecnicos for all to authenticated using (true) with check (true);
create policy "usuarios del taller" on public.ots      for all to authenticated using (true) with check (true);
create policy "usuarios del taller" on public.config   for all to authenticated using (true) with check (true);

revoke all on public.tecnicos, public.ots, public.config from anon;
grant select, insert, update, delete on public.tecnicos, public.ots, public.config to authenticated;

-- Actualización en vivo entre usuarios.
alter publication supabase_realtime add table public.tecnicos, public.ots, public.config;
