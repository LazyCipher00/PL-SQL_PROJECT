-- ============================================
-- BATCH 2: INSERT 30 DISEASE RECORDS
-- Real crop diseases for Africa
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 30 disease records for African crops...');
END;
/

-- Maize Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Maize', 'yellow stripes on leaves, stunted growth, poor cob formation', 'Use resistant varieties (DK 8033), apply nitrogen fertilizer', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Maize', 'white powdery substance on leaves, yellowing', 'Apply sulfur-based fungicide, avoid dense planting', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Maize', 'red/purple discoloration on leaves, rotting roots', 'Improve drainage, apply phosphorus fertilizer', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Maize', 'brown spots with yellow halo, early leaf death', 'Rotate crops, remove infected debris, use fungicide', 'HIGH');

-- Rice Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Rice', 'white streaks on leaves, empty grains', 'Use certified seeds, apply balanced fertilizer', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Rice', 'rotting at base, plants falling over', 'Ensure proper water management, use resistant varieties', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Rice', 'orange/yellow spots on leaves', 'Apply copper-based fungicide, avoid excess nitrogen', 'NORMAL');

-- Cassava Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Cassava', 'mosaic patterns on leaves, stunted growth', 'Use virus-free cuttings, remove infected plants', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Cassava', 'brown streaks on stems, wilting', 'Plant resistant varieties, practice crop rotation', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Cassava', 'root rot, foul smell, yellow leaves', 'Improve soil drainage, avoid waterlogging', 'NORMAL');

-- Banana Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Banana', 'yellowing leaves, black pseudostem', 'Use tissue culture plants, disinfect tools', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Banana', 'black spots on fruits, premature ripening', 'Remove infected bunches, improve air circulation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Banana', 'wilting, yellow streaks on leaves', 'Uproot infected plants, use resistant varieties', 'HIGH');

-- Coffee Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Coffee', 'brown leaf spots, defoliation', 'Prune affected branches, apply copper fungicide', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Coffee', 'berry rot, black lesions', 'Harvest regularly, improve drainage', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Coffee', 'yellow leaves, stunted growth', 'Test soil pH, apply micronutrients', 'NORMAL');

-- Tomato Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Tomato', 'early blight, concentric rings on leaves', 'Apply chlorothalonil, remove lower leaves', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Tomato', 'yellow leaves, curled edges', 'Control whiteflies, use resistant varieties', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Tomato', 'blossom end rot, dark spots on fruit', 'Maintain even soil moisture, add calcium', 'NORMAL');

-- Yam Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Yam', 'tuber rot, white fungal growth', 'Use healthy seed yams, treat with fungicide', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Yam', 'leaf spots, yellowing', 'Practice crop rotation, remove crop debris', 'NORMAL');

-- Sorghum Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Sorghum', 'red leaves, poor grain filling', 'Plant early, use resistant varieties', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Sorghum', 'gray mold on panicles', 'Avoid dense planting, apply fungicide if severe', 'NORMAL');

-- Millet Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Millet', 'downy mildew, white growth on leaves', 'Use certified seeds, practice crop rotation', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Millet', 'smut, black powder in grains', 'Treat seeds with fungicide, rogue infected plants', 'NORMAL');

-- Bean Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Bean', 'angular leaf spots, yellow leaves', 'Use disease-free seeds, practice sanitation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Bean', 'root rot, wilting plants', 'Improve drainage, avoid waterlogging', 'HIGH');

-- Cabbage Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Cabbage', 'black rot, V-shaped lesions', 'Use resistant varieties, rotate with non-crucifers', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Cabbage', 'clubroot, swollen roots', 'Lime soil to raise pH, practice long rotation', 'HIGH');

-- Onion Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Onion', 'purple blotch, elliptical spots', 'Apply mancozeb fungicide, avoid overhead irrigation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Onion', 'downy mildew, pale streaks on leaves', 'Improve air circulation, use resistant varieties', 'NORMAL');

-- Pepper Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Pepper', 'bacterial spot, water-soaked lesions', 'Use copper sprays, avoid working when wet', 'HIGH');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Pepper', 'anthracnose, sunken spots on fruits', 'Remove infected fruits, apply fungicide', 'NORMAL');

-- Sweet Potato Diseases
INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Sweet Potato', 'scurf, brown patches on roots', 'Use clean vines, practice crop rotation', 'NORMAL');

INSERT INTO diseases (crop_type, symptom_keywords, treatment, risk_level) VALUES 
('Sweet Potato', 'virus, mosaic patterns on leaves', 'Use virus-free planting material, control aphids', 'HIGH');

COMMIT;
SELECT '✅ BATCH 2 COMPLETE: 30 disease records inserted' AS status FROM dual;