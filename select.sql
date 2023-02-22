/*название и год выхода альбомов, вышедших в 2018 году*/
SELECT name, year FROM album WHERE year = 2018;
/*название и продолжительность самого длительного трека*/
SELECT title, duration FROM track WHERE duration=(SELECT MAX(duration) FROM track);
/*название треков, продолжительность которых не менее 3,5 минуты*/
SELECT title FROM track WHERE duration >= 210;
/*названия сборников, вышедших в период с 2018 по 2020 год включительно*/
SELECT title FROM collection WHERE year >= 2018 AND year <= 2020;
/*или так*/
SELECT title FROM collection WHERE year BETWEEN 2018 AND 2020;
/*исполнители, чье имя состоит из 1 слова*/
SELECT name FROM artist WHERE name NOT LIKE '% %';
/*название треков, которые содержат слово "мой"/"my"*/
SELECT title FROM track WHERE title LIKE '%my%';
