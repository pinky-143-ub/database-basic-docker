CREATE DATABASE IF NOT EXISTS tfi_heroes_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE tfi_heroes_db;

DROP TABLE IF EXISTS heroes;

CREATE TABLE heroes (
    hero_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    hero_name VARCHAR(100) NOT NULL,
    debut_year SMALLINT UNSIGNED NOT NULL,
    experience_years SMALLINT UNSIGNED NOT NULL,
    estimated_salary_min_inr BIGINT UNSIGNED NULL,
    estimated_salary_max_inr BIGINT UNSIGNED NULL,
    salary_basis VARCHAR(40) NOT NULL DEFAULT 'per film (estimated)',
    notes VARCHAR(255) NULL,
    PRIMARY KEY (hero_id),
    UNIQUE KEY uq_tfi_hero_name (hero_name),
    KEY idx_experience (experience_years),
    KEY idx_salary_min (estimated_salary_min_inr)
) ENGINE=InnoDB;

INSERT INTO heroes
(hero_name, debut_year, experience_years, estimated_salary_min_inr, estimated_salary_max_inr, salary_basis, notes)
VALUES
('Chiranjeevi',       1978, 48, 5000000000, 7500000000, 'per film (estimated)', 'Reported estimates vary; some reports quote lower or higher fees.'),
('Nagarjuna Akkineni',1986, 40, 2500000000, 4000000000, 'per film (estimated)', 'Approximate media estimate.'),
('Venkatesh Daggubati',1986,40, 1500000000, 3000000000, 'per film (estimated)', 'Approximate media estimate; role and project dependent.'),
('Balakrishna',       1974, 52, 3000000000, 5500000000, 'per film (estimated)', 'Reported trade estimate; varies by project.'),
('Pawan Kalyan',      1996, 30, 5000000000, 8000000000, 'per film (estimated)', 'Approximate 2025-era reports; political and profit-share arrangements may affect totals.'),
('Mahesh Babu',       1999, 27, 6000000000,10000000000, 'per film (estimated)', 'Approximate media estimate.'),
('Prabhas',           2002, 24, 8000000000,20000000000, 'per film (estimated)', 'Reported range; may include or be affected by profit-sharing arrangements.'),
('Allu Arjun',        2003, 23,20000000000,30000000000, 'per film (estimated)', 'High-end media reports; some projects use profit-sharing rather than a fixed fee.'),
('Ram Charan',        2007, 19, 6500000000,13000000000, 'per film (estimated)', 'Approximate 2025–2026 trade reports.'),
('Jr. NTR',           2001, 25, 6000000000,10000000000, 'per film (estimated)', 'Approximate media estimate.'),
('Ravi Teja',         1990, 36, 2500000000, 3000000000, 'per film (estimated)', 'Approximate 2025-era media estimate.'),
('Nani',              2008, 18, 2000000000, 3500000000, 'per film (estimated)', 'Approximate media estimate; reports differ.'),
('Vijay Deverakonda', 2011, 15, 2500000000, 4500000000, 'per film (estimated)', 'Approximate media estimate.'),
('Ram Pothineni',     2002, 24, 2000000000, 2500000000, 'per film (estimated)', 'Approximate media estimate.'),
('Nithiin',           2002, 24, 1000000000, 2000000000, 'per film (estimated)', 'Indicative estimate; publicly reported figures vary.'),
('Sharwanand',        2004, 22,  300000000, 1000000000, 'per film (estimated)', 'Indicative estimate; publicly reported figures vary.'),
('Sundeep Kishan',    2010, 16,  300000000, 1000000000, 'per film (estimated)', 'Indicative estimate; publicly reported figures vary.');

SELECT
    hero_name,
    debut_year,
    experience_years,
    ROUND(estimated_salary_min_inr / 10000000, 2) AS salary_min_crore,
    ROUND(estimated_salary_max_inr / 10000000, 2) AS salary_max_crore
FROM heroes
ORDER BY estimated_salary_max_inr DESC;
SELECT hero_name, debut_year, experience_years
FROM heroes
WHERE experience_years >= 20
ORDER BY experience_years DESC;
SELECT hero_name,
       ROUND(estimated_salary_max_inr / 10000000, 2) AS salary_max_crore
FROM heroes
ORDER BY estimated_salary_max_inr DESC
LIMIT 5;

SELECT hero_name,
       ROUND(estimated_salary_min_inr / 10000000, 2) AS salary_min_crore,
       ROUND(estimated_salary_max_inr / 10000000, 2) AS salary_max_crore
FROM heroes
WHERE estimated_salary_min_inr >= 200000000
ORDER BY estimated_salary_min_inr DESC;
SELECT *
FROM heroes
WHERE hero_name LIKE '%Nani%';
SELECT hero_name,
       debut_year,
       YEAR(CURDATE()) - debut_year AS experience_years_current
FROM heroes
ORDER BY experience_years_current DESC;
