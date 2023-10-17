CREATE TABLE Heroes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Universe VARCHAR(255) NOT NULL,
    Skill VARCHAR(255) NOT NULL,
    ImageURL VARCHAR(255) NOT NULL
);

CREATE TABLE Villains (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Universe VARCHAR(100) NOT NULL,
    Skill VARCHAR(100) NOT NULL,
    ImageURL VARCHAR(100) NOT NULL
);

CREATE TABLE inventories (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ItemCode VARCHAR(100),
    Stock INT,
    Description VARCHAR(100),
    Status VARCHAR(100)
);

INSERT INTO Heroes (Name, Universe, Skill, ImageURL)
VALUES
    ('ABADDON', 'UNIVERSAL', 'SHIELDS HIS ALLIES OR HIMSELF FROM ATTACKS', 'ABADDON.jpg'),
    ('ANTI-MAGE', 'AGILITY', 'SLASHES HIS FOES WITH MANA-DRAINING ATTACKS', 'ANTI-MAGE.jpg'),
    ('ANCIENT APPARITION', 'INTELLIGENCE', 'LAUNCHES A POWERFUL ICY BLAST FROM ANYWHERE ON THE MAP', 'ANCIENT APPARITION.jpg');

INSERT INTO Villains (Name, Universe, Skill, ImageURL)
VALUES
    ('DEATH PROPHET', 'INTELLIGENCE', 'SUMMONS AN ARMY OF GHOSTS TO ATTACK' , 'PROPHET.jpg'),
    ('LYCAN', 'UNIVERSAL', 'SHAPESHIFTS INTO A FEROCIOUS BEAST' , 'LYCAN.jpg'),
    ('NIGHT STALKER', 'STRENGTH', 'ENPOWERED BY THE SHADOWS OF NIGHTFALL' , 'STALKER.jpg');

INSERT INTO inventories (Name, ItemCode, Stock, Description, Status)
VALUES 
    ('Crystalys', 'ITM001', 10, 'A blade forged from rare crystals, it seeks weak points in enemy armor.', 'active'),
    ('Daedalus', 'ITM002', 5, 'A weapon of incredible power that is difficult for even the strongest of warriors to control.', 'active'),
    ('Butterfly', 'ITM003', 8, 'Only the mightiest and most experienced of warriors can wield the Butterfly, but it provides incredible dexterity in combat.', 'broken'),
    ('Eye of Skadi', 'ITM004', 12, 'Extremely rare artifact, guarded by the azure dragons.', 'active'),
    ('Yasha and Kaya', 'ITM005', 3, 'Yasha and Kaya when paired together share a natural resonance.', 'broken');



