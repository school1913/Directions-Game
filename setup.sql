create table games(code text primary key, status text default 'lobby', created timestamptz default now());
create table players(id uuid primary key default gen_random_uuid(), game text references games(code) on delete cascade, name text, avatar jsonb, points int default 0, done int default 0);
alter table games enable row level security;
alter table players enable row level security;
create policy "open games" on games for all using (true) with check (true);
create policy "open players" on players for all using (true) with check (true);
