-- T?o c? s? d? li?u
CREATE DATABASE food_ordering_system2;
USE food_ordering_system;

-- B?ng user
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

-- B?ng restaurant
CREATE TABLE restaurant (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);

-- B?ng food
CREATE TABLE food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

-- B?ng food_type
CREATE TABLE food_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255)
);

-- B?ng order
CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- B?ng sub_food
CREATE TABLE sub_food (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- B?ng rate_res
CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    PRIMARY KEY (user_id, res_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- B?ng like_res
CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    PRIMARY KEY (user_id, res_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


-- Th   m d ? li ? u v   o b ? ng user
INSERT INTO
    user (full_name, email, password)
VALUES
    (
        'Nguy?n V?n A',
        'nguyenvana@example.com',
        'matkhau123'
    ),
    (
        'Tr?n Th? B',
        'tranthib@example.com',
        'matkhau456'
    ),
    ('L  V?n C', 'levanc@example.com', 'matkhau789'),
    (
        'Ph?m Th? D',
        'phamthid@example.com',
        'matkhau101'
    ),
    (
        'Ho ng V?n E',
        'hoangvane@example.com',
        'matkhau202'
    ),
    ('V? Th? F', 'vuthif@example.com', 'matkhau303'),
    ('Ng  V?n G', 'ngovang@example.com', 'matkhau404'),
    (
        '?inh Th? H',
        'dinhthih@example.com',
        'matkhau505'
    );
-- Th   m d ? li ? u v   o b ? ng restaurant
INSERT INTO
    restaurant (res_name, image, description)
VALUES
    ('Nh  h ng A', 'imageA.png', 'M  t? nh  h ng A'),
    ('Nh  h ng B', 'imageB.png', 'M  t? nh  h ng B'),
    ('Nh  h ng C', 'imageC.png', 'M  t? nh  h ng C'),
    ('Nh  h ng D', 'imageD.png', 'M  t? nh  h ng D');
-- Th   m d ? li ? u v   o b ? ng food_type
INSERT INTO
    food_type (type_name)
VALUES
    ('Khai v?'),
    ('M n ch nh'),
    ('Tr ng mi?ng');
-- Th   m d ? li ? u v   o b ? ng food
INSERT INTO
    food (food_name, image, price, description, type_id)
VALUES
    (
        'Pizza',
        'pizza.png',
        99.99,
        'Pizza ph  mai ngon',
        2
    ),
    (
        'Burger',
        'burger.png',
        79.99,
        'Burger b  ngon',
        2
    ),
    ('Salad', 'salad.png', 49.99, 'Salad rau xanh', 1),
    ('M   ', 'pasta.png', 89.99, 'M    s?t kem', 2),
    ('Kem', 'icecream.png', 29.99, 'Kem vani', 3);
-- Th   m d ? li ? u v   o b ? ng order
INSERT INTO
    `order` (user_id, food_id, amount, code, arr_sub_id)
VALUES
    (1, 1, 2, 'CODE123', '1,2'),
    (2, 2, 1, 'CODE456', '3'),
    (3, 3, 3, 'CODE789', '4,5'),
    (4, 1, 1, 'CODE101', '2,3'),
    (5, 4, 2, 'CODE202', '1,4'),
    (6, 5, 1, 'CODE303', '5'),
    (7, 2, 2, 'CODE404', '2'),
    (8, 3, 1, 'CODE505', '3,4');
-- Th   m d ? li ? u v   o b ? ng sub_food
INSERT INTO
    sub_food (sub_name, sub_price, food_id)
VALUES
    ('Ph  mai th m', 15.0, 1),
    ('Th?t x ng kh i', 20.0, 2),
    ('B nh m ', 5.0, 3),
    ('Tr?ng', 10.0, 4),
    ('X c x ch', 25.0, 5);
-- Th   m d ? li ? u v   o b ? ng rate_res
INSERT INTO
    rate_res (user_id, res_id, amount, date_rate)
VALUES
    (1, 1, 5, '2024-01-01 12:00:00'),
    (2, 2, 4, '2024-02-01 13:00:00'),
    (3, 3, 3, '2024-03-01 14:00:00'),
    (4, 4, 5, '2024-04-01 15:00:00');
-- Th   m d ? li ? u v   o b ? ng like_res
INSERT INTO
    like_res (user_id, res_id, date_like)
VALUES
    (1, 1, '2024-01-01 12:00:00'),
    (1, 2, '2024-01-02 12:00:00'),
    (1, 3, '2024-01-03 12:00:00'),
    (2, 1, '2024-02-01 12:00:00'),
    (2, 2, '2024-02-02 12:00:00'),
    (3, 1, '2024-03-01 12:00:00'),
    (4, 1, '2024-04-01 12:00:00'),
    (4, 3, '2024-04-02 12:00:00');

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

SELECT * FROM food;

--5 ng??i ?  like nh  h ng nhi?u nh?t
SELECT u.user_id, u.full_name, u.email, COUNT(lr.res_id) AS like_count
FROM like_res lr
JOIN user u ON lr.user_id = u.user_id  -- K?t n?i v?i b?ng user ?? l?y th ng tin ng??i d ng.
GROUP BY u.user_id                    -- Nh m c c b?n ghi theo user_id.
ORDER BY like_count DESC              -- S?p x?p k?t qu? theo s? l??t like gi?m d?n.
LIMIT 5;                              -- Gi?i h?n k?t qu? tr? v? 5 b?n ghi.



--2 nh  h ng c  l??t like nhi?u nh?t

SELECT r.res_id, r.res_name, r.image, r.description, COUNT(lr.user_id) AS like_count
FROM like_res lr
JOIN restaurant r ON lr.res_id = r.res_id  -- K?t n?i v?i b?ng restaurant ?? l?y th ng tin nh  h ng.
GROUP BY r.res_id                         -- Nh m c c b?n ghi theo res_id.
ORDER BY like_count DESC                  -- S?p x?p k?t qu? theo s? l??t like gi?m d?n.
LIMIT 2;                                  -- Gi?i h?n k?t qu? tr? v? 2 b?n ghi.


--ng??i ?  ??t h ng nhi?u nh?t
SELECT u.user_id, u.full_name, u.email, COUNT(o.order_id) AS order_count
FROM `order` o
JOIN user u ON o.user_id = u.user_id  -- K?t n?i v?i b?ng user ?? l?y th ng tin ng??i d ng.
GROUP BY u.user_id                    -- Nh m c c b?n ghi theo user_id.
ORDER BY order_count DESC             -- S?p x?p k?t qu? theo s? l??ng ??n h ng gi?m d?n.
LIMIT 1;                              -- Gi?i h?n k?t qu? tr? v? 1 b?n ghi.


--ng??i d ng kh ng ho?t ??ng trong h? th?ng
SELECT u.user_id, u.full_name, u.email
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id    -- Th?c hi?n LEFT JOIN v?i b?ng order theo user_id.
LEFT JOIN like_res lr ON u.user_id = lr.user_id -- Th?c hi?n LEFT JOIN v?i b?ng like_res theo user_id.
LEFT JOIN rate_res rr ON u.user_id = rr.user_id -- Th?c hi?n LEFT JOIN v?i b?ng rate_res theo user_id.
WHERE o.user_id IS NULL 
  AND lr.user_id IS NULL 
  AND rr.user_id IS NULL;                       -- L?c c c ng??i d ng kh ng c  ho?t ??ng.
