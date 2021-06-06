ALTER TABLE tweet ADD Hashtag_data int DEFAULT Null;
ALTER TABLE users ADD CONSTRAINT fk_grade_id FOREIGN KEY (grade_id) REFERENCES grades(id);