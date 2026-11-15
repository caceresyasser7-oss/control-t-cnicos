# Control de Técnicos de Taller

Página web para organizar al personal de mantenimiento: técnicos, órdenes de trabajo (OT), calendario con arrastre, carga semanal, productividad, balanceo automático de trabajo, dashboard gerencial y reportes PDF/Excel.

- `index.html`: la aplicación completa (no requiere compilar).
- `config.js`: URL y clave pública de Supabase.
- `supabase/schema.sql`: tablas, seguridad (RLS) y tiempo real. Se ejecuta una vez en el SQL Editor de Supabase.

Los datos se guardan en Supabase y todos los usuarios con sesión ven lo mismo en vivo. Los usuarios se crean en Supabase → Authentication → Users → Add user.
