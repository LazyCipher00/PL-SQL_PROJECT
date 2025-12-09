-- ============================================
--  INSERT 30 DISEASE RECORDS
--  Real crop diseases for Africa
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 30 disease records for African crops...');
END;
/

-- Maize Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Maize', 'yellow stripes on leaves, stunted growth, poor cob formation', 'Maize Streak Virus', 'Use resistant varieties (DK 8033), apply nitrogen fertilizer', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Maize', 'white powdery substance on leaves, yellowing', 'Powdery Mildew', 'Apply sulfur-based fungicide, avoid dense planting', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Maize', 'red/purple discoloration on leaves, rotting roots', 'Red Leaf Blight', 'Improve drainage, apply phosphorus fertilizer', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Maize', 'brown spots with yellow halo, early leaf death', 'Northern Leaf Blight', 'Rotate crops, remove infected debris, use fungicide', 'HIGH');

-- Rice Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Rice', 'white streaks on leaves, empty grains', 'Rice Blast', 'Use certified seeds, apply balanced fertilizer', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Rice', 'rotting at base, plants falling over', 'Bakanae Disease', 'Ensure proper water management, use resistant varieties', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Rice', 'orange/yellow spots on leaves', 'Bacterial Leaf Blight', 'Apply copper-based fungicide, avoid excess nitrogen', 'NORMAL');

-- Cassava Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Cassava', 'mosaic patterns on leaves, stunted growth', 'Cassava Mosaic Virus', 'Use virus-free cuttings, remove infected plants', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Cassava', 'brown streaks on stems, wilting', 'Cassava Brown Streak Disease', 'Plant resistant varieties, practice crop rotation', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Cassava', 'root rot, foul smell, yellow leaves', 'Cassava Root Rot', 'Improve soil drainage, avoid waterlogging', 'NORMAL');

-- Banana Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Banana', 'yellowing leaves, black pseudostem', 'Black Sigatoka', 'Use tissue culture plants, disinfect tools', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Banana', 'black spots on fruits, premature ripening', 'Anthracnose', 'Remove infected bunches, improve air circulation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Banana', 'wilting, yellow streaks on leaves', 'Panama Disease', 'Uproot infected plants, use resistant varieties', 'HIGH');

-- Coffee Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Coffee', 'brown leaf spots, defoliation', 'Coffee Leaf Rust', 'Prune affected branches, apply copper fungicide', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Coffee', 'berry rot, black lesions', 'Coffee Berry Disease', 'Harvest regularly, improve drainage', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Coffee', 'yellow leaves, stunted growth', 'Coffee Leaf Miner', 'Test soil pH, apply micronutrients', 'NORMAL');

-- Tomato Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Tomato', 'early blight, concentric rings on leaves', 'Early Blight', 'Apply chlorothalonil, remove lower leaves', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Tomato', 'yellow leaves, curled edges', 'Tomato Yellow Leaf Curl Virus', 'Control whiteflies, use resistant varieties', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Tomato', 'blossom end rot, dark spots on fruit', 'Blossom End Rot', 'Maintain even soil moisture, add calcium', 'NORMAL');

-- Yam Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Yam', 'tuber rot, white fungal growth', 'Yam Anthracnose', 'Use healthy seed yams, treat with fungicide', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Yam', 'leaf spots, yellowing', 'Yam Leaf Spot', 'Practice crop rotation, remove crop debris', 'NORMAL');

-- Sorghum Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Sorghum', 'red leaves, poor grain filling', 'Sorghum Red Leaf Spot', 'Plant early, use resistant varieties', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Sorghum', 'gray mold on panicles', 'Sorghum Gray Mold', 'Avoid dense planting, apply fungicide if severe', 'NORMAL');

-- Millet Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Millet', 'downy mildew, white growth on leaves', 'Millet Downy Mildew', 'Use certified seeds, practice crop rotation', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Millet', 'smut, black powder in grains', 'Millet Smut', 'Treat seeds with fungicide, rogue infected plants', 'NORMAL');

-- Bean Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Bean', 'angular leaf spots, yellow leaves', 'Angular Leaf Spot', 'Use disease-free seeds, practice sanitation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Bean', 'root rot, wilting plants', 'Bean Root Rot', 'Improve drainage, avoid waterlogging', 'HIGH');

-- Cabbage Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Cabbage', 'black rot, V-shaped lesions', 'Black Rot', 'Use resistant varieties, rotate with non-crucifers', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Cabbage', 'clubroot, swollen roots', 'Clubroot', 'Lime soil to raise pH, practice long rotation', 'HIGH');

-- Onion Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Onion', 'purple blotch, elliptical spots', 'Purple Blotch', 'Apply mancozeb fungicide, avoid overhead irrigation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Onion', 'downy mildew, pale streaks on leaves', 'Downy Mildew', 'Improve air circulation, use resistant varieties', 'NORMAL');

-- Pepper Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Pepper', 'bacterial spot, water-soaked lesions', 'Bacterial Spot', 'Use copper sprays, avoid working when wet', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Pepper', 'anthracnose, sunken spots on fruits', 'Anthracnose', 'Remove infected fruits, apply fungicide', 'NORMAL');

-- Sweet Potato Diseases
INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Sweet Potato', 'scurf, brown patches on roots', 'Sweet Potato Scurf', 'Use clean vines, practice crop rotation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, disease_name, treatment, risk_level) VALUES 
('Sweet Potato', 'virus, mosaic patterns on leaves', 'Sweet Potato Virus', 'Use virus-free planting material, control aphids', 'HIGH');

COMMIT;
SELECT ' COMPLETE: 30 disease records inserted' AS status FROM dual;
