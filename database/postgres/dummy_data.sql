-- Insert country codes
INSERT INTO artbase.country (country_code, country) VALUES ('91', 'India') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('1', 'United States') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('44', 'United Kingdom') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('61', 'Australia') ON CONFLICT DO NOTHING;

-- Enable extension (one time per database) for storing encrypted passwords
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Insert customer data
INSERT INTO artbase.customer (name, email, password) VALUES ('Arjun Banerjee', 'arjunbanerjee@gmail.com', crypt('arjunbanerjee', gen_salt('bf'))) ON CONFLICT (email) DO NOTHING;
INSERT INTO artbase.customer (name, email, password) VALUES ('James Walker', 'jameswalker@gmail.com', crypt('jameswalker', gen_salt('bf'))) ON CONFLICT (email) DO NOTHING;
INSERT INTO artbase.customer (name, email, password) VALUES ('Olivia Gray', 'oliviagray@gmail.com', crypt('oliviagray', gen_salt('bf'))) ON CONFLICT (email) DO NOTHING;
INSERT INTO artbase.customer (name, email, password) VALUES ('Mia Jones', 'miajones@gmail.com', crypt('miajones', gen_salt('bf'))) ON CONFLICT (email) DO NOTHING;

-- Insert artist data
INSERT INTO artbase.artist (name, country, state, birth_year, statement, email, password) VALUES (
    'Sneha Chatterjee',
    'India',
    'West Bengal',
    '1995-01-25',
    'Every landscape in this collection is one I''ve sat in front of, marveled at and savored. While I''m glad to have captured the comfort they''ve brought me, I hope you also get a taste of their vastness. The colors, lines, and shapes I use seek to emulate how otherworldly they seem in today''s modern society.',
    'snehachatterjee@gmail.com',
    crypt('snehachatterjee', gen_salt('bf'))
) ON CONFLICT (email) DO NOTHING;

INSERT INTO artbase.artist (name, country, state, birth_year, statement, email, password) VALUES (
    'Glennie Kennedy',
    'United States',
    'Florida',
    '1992-04-15',
    'White paper disgusts me.

I use oil paints to disrupt the purity of the blank canvas with abstract shapes and lines. I feature very loosely interpreted seascapes and sunsets prominently. I''ve lived my whole life steps away from the ocean, and I find it the most meaningful inspiration. My pieces attempt to join the joy of abandon with color to create bold, bright, daring pieces. Living in Miami, I am no stranger to vibrancy and create works that transport others to this magical space.',
    'glenniekennedy@gmail.com',
    crypt('glenniekennedy', gen_salt('bf'))
) ON CONFLICT (email) DO NOTHING;

INSERT INTO artbase.artist (name, country, state, birth_year, statement, email, password) VALUES (
    'Todd Brost',
    'United Kingdom',
    'England',
    '1985-06-10',
    'Throughout my years as a glass artist, I''ve found that only grief is more fragile than the medium I work with. My shards strive to capture this emotion that''s so personal yet universal using a combination of refracted light, bold staining and unique sculptures. While the pieces are off-limits, I hope they encourage you to get in touch with the feelings you may have been avoiding.',
    'toddbrost@gmail.com',
    crypt('toddbrost', gen_salt('bf'))
) ON CONFLICT (email) DO NOTHING;

INSERT INTO artbase.artist (name, country, state, birth_year, statement, email, password) VALUES (
    'Jordan Price',
    'Australia',
    'New South Wales',
    '1988-10-30',
    'The modern person is prideful and refuses to admit when they don''t know something. My collection is a humbling opportunity to learn new things and revisit the childlike joy of being surprised. Whatever you learn, share it meekly.',
    'jordanprice@gmail.com',
    crypt('toddbrost', gen_salt('bf'))
) ON CONFLICT (email) DO NOTHING;
