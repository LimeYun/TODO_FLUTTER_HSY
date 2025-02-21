DROP TABLE IF EXISTS `todos`;

CREATE TABLE todos (
    `no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`id`	VARCHAR(64)	NOT NULL	COMMENT 'UK',
	`name`	TEXT	NOT NULL	COMMENT '할일',
	`status`	BOOLEAN	NOT NULL	DEFAULT false	COMMENT '상태',
	`todo_date`	TIMESTAMP	NOT NULL	COMMENT '일정날짜'
)

INSERT INTO todos (id, name, status, todo_date)
VALUES 
	(UUID(), '강사님(근데 거의 선생님이셨어요 ㅋㅋ)', TRUE, '2025-02-14 09:00:00'),
	(UUID(), '항상 진심으로 대해주셔서', TRUE, '2025-02-14 09:00:00'),
	(UUID(), '정말로 감사합니다.', FALSE, '2025-02-16 09:00:00'),
	(UUID(), '못되게 굴어서 죄송합니다.', TRUE, '2025-02-15 09:00:00'),
	(UUID(), '선생님 덕분에 좋은 기억만 가지고 갈 수 있었습니다!!', FALSE, '2025-02-21 09:00:00'),
	(UUID(), '앞으로의 인생에 좋은 일만 있으시길 항상 기도하겠습니다!! ㅋㅋㅋㅋㅋ', FALSE, '2025-02-22 09:00:00')



SELECT * FROM todos WHERE DATE(todo_date) = '2025-02-16';
