
-- Création de l'enum resource_type
CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');


--Table themes

CREATE TABLE themes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table resources
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
CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table resources_skills (relation N:N)
CREATE TABLE resources_skills (
    resource_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (resource_id, skill_id),
    FOREIGN KEY (resource_id) REFERENCES resources(id),
    FOREIGN KEY (skill_id) REFERENCES skills(id)
);

