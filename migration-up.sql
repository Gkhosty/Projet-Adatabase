
-- Création de l'enum resource_type
--J'ai créé un type ENUM pour le type de ressource,Cela limite les valeurs possible et evite les erreurs
CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');


--Table themes

--La table themes contient les catégories des ressources, comme Frontend ou Backend
CREATE TABLE themes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table resources
--
--La table resources est la table principale.
-- Elle est liée aux thèmes par theme_id. Un thème peut avoir plusieurs ressources
CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    url TEXT NOT NULL,
    description VARCHAR(255),
    type resource_type NOT NULL,
    is_ada BOOLEAN NOT NULL,
    theme_id INT NOT NULL REFERENCES themes(id)
);


-- Table skills
--Les compétences sont séparées pour être réutilisées dans plusieurs ressources
CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table resources_skills (relation N:N)
--Une ressource peut avoir plusieurs compétences, 
--et une compétence peut être liée à plusieurs ressources. 
--On utilise une table intermédiaire pour gérer cette relation N-N.” Les compétences sont séparées pour être réutilisées dans plusieurs ressources
CREATE TABLE resources_skills (
    resource_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (resource_id, skill_id),
    FOREIGN KEY (resource_id) REFERENCES resources(id),
    FOREIGN KEY (skill_id) REFERENCES skills(id)
);

