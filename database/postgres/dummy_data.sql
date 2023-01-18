-- Insert country codes
INSERT INTO artbase.country (country_code, country) VALUES ('91', 'India') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('1', 'United States') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('44', 'United Kingdom') ON CONFLICT DO NOTHING;
INSERT INTO artbase.country (country_code, country) VALUES ('61', 'Australia') ON CONFLICT DO NOTHING;
