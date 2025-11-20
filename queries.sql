-- -- 1️ Récupérer la liste des thèmes
SELECT * FROM themes;

-- 2️ Récupérer toutes les ressources triées par date de mise à jour
-- (ajoutons une colonne updated_at pour l'exemple si tu veux trier)
-- Si tu n'as pas de colonne updated_at, tu peux utiliser l'id pour simuler l'ordre
SELECT * FROM resources
ORDER BY id DESC;

-- -- 3️ Récupérer uniquement le nom et l'url des ressources de type exercice
SELECT title, url
FROM resources
WHERE type = 'exercice';

 -- 4️ Récupérer le titre et la description des ressources d'Ada uniquement
SELECT title, description
FROM resources
WHERE is_ada = TRUE;


 -- 5️ Récupérer les ressources qui ont la compétence JavaScript associée

SELECT resources.*
FROM resources
JOIN resources_skills
    ON resources.id = resources_skills.resource_id
JOIN skills
    ON resources_skills.skill_id = skills.id
WHERE skills.name = 'JavaScript';


-- -- 6️ Récupérer les ressources dont le titre contient le mot "react" (sans tenir compte des majuscules)
SELECT *
FROM resources
WHERE LOWER(title) LIKE '%react%';

--Récupérer la liste des thèmes avec le nombre de ressources par thème
SELECT themes.id, themes.name, COUNT(resources.id) AS nombre_de_resources
FROM themes
LEFT JOIN resources
    ON resources.theme_id = themes.id
GROUP BY themes.id, themes.name
ORDER BY COUNT(resources.id) DESC;







