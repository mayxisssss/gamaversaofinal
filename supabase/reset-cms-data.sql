-- Limpa configurações antigas/bugadas do CMS sem apagar usuários.
-- Rode no Supabase SQL Editor se o painel/site estiver preso com valores antigos.

update cms_data
set data = '{}'::jsonb,
    updated_at = now()
where id = 'main';

insert into cms_data (id, data)
values ('main', '{}'::jsonb)
on conflict (id) do update
set data = '{}'::jsonb,
    updated_at = now();

-- Opcional: limpar logs e estatísticas
-- delete from admin_logs;
-- delete from analytics_events;
