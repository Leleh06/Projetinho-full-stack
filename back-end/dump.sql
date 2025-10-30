CREATE DATABASE senai;
USE senai;
DROP DATABASE senai;


CREATE TABLE usuario(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(100)
);

CREATE TABLE lgs(
	id INT PRIMARY KEY AUTO_INCREMENT,
	categoria TEXT,
    horas_trabalhadas INT,
    linhas_codigo INT,
    bugs_corrigidos INT,
    
    id_user INT,
    FOREIGN KEY (id_user)
    REFERENCES usuario (id_user)
);


CREATE TABLE likes (
  log_id int NOT NULL,
  user_id int NOT NULL,
  KEY fk_log_idx (log_id),
  KEY fk_user_idx (user_id),
  CONSTRAINT fk_log FOREIGN KEY (log_id) REFERENCES lgs (id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES usuario (id_user)
);

insert into likes (log_id, user_id) values (1,1);
insert into likes(log_id, user_id) values (2,1);
insert into likes(log_id, user_id) values (1,1);
insert into likes(log_id, user_id) values (1,1);
insert into likes(log_id, user_id) values (2,1);
insert into likes(log_id, user_id) values (3,1);
insert into likes(log_id, user_id) values (1,1);

insert into usuario (nome, email, senha, idade) values("Leleh", "a@gmail.com", "123", 22),("Maria", "b@gmail.com", "124", 23);

CREATE TABLE `comment` (
  `log_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `mesage` VARCHAR(255) NULL,
  CONSTRAINT `fk_log_comment` FOREIGN KEY (`log_id`) REFERENCES `lgs` (`id`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id_user`));



INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Desenvolvimento de Gameplay', 22, 1850, 2);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Arte e Design', 30, 45, 0);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Correção de Bugs', 8, 90, 7);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Otimização', 16, 450, 1);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Desenvolvimento de UI/UX', 12, 680, 3);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Sonoplastia', 10, 5, 0);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Roteiro e Narrativa', 18, 10, 0);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Desenvolvimento de Gameplay', 40, 2500, 4);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Correção de Bugs', 5, 55, 5);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Arte e Design', 25, 30, 1);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Desenvolvimento de Gameplay', 35, 2100, 3);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Otimização', 20, 600, 2);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Correção de Bugs', 12, 150, 11);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Desenvolvimento de UI/UX', 9, 450, 2);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Sonoplastia', 7, 0, 0);
INSERT INTO lgs (id_user,categoria, horas_trabalhadas, linhas_codigo, bugs_corrigidos) VALUES (1,'Arte e Design', 33, 60, 0);

