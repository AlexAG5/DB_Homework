-- Задание 2.
-- Название и продолжительность самого длительного трека.

SELECT name_track, duration_track FROM tracks
ORDER BY duration_track DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут.

SELECT name_track FROM tracks
WHERE duration_track >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT name_collection FROM collections 
WHERE date_of_release BETWEEN '2018' AND '2020';

--Исполнители, чьё имя состоит из одного слова.

SELECT artist_name FROM artists
WHERE NOT artist_name LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».

SELECT name_track FROM tracks
WHERE string_to_array(lower(name_track), ' ') && ARRAY ['my', 'мой'];

-- Задание 3.
-- Количество исполнителей в каждом жанре.

SELECT name_genre, COUNT(artist_name) artists_quantity FROM genre g
JOIN artist_genre ag ON g.genre_id = ag.genre_id
JOIN artists a ON ag.artist_id = a.artist_id
GROUP BY name_genre
ORDER BY artists_quantity DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(name_track) FROM albums alb
JOIN tracks t ON t.album_id = alb.album_id
WHERE date_of_release BETWEEN 2019 and 2020;

-- Средняя продолжительность треков по каждому альбому.

SELECT name_album, AVG(duration_track) avg_duration FROM albums a
JOIN tracks t ON t.album_id  = a.album_id
GROUP BY name_album
ORDER BY avg_duration DESC;

-- Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT artist_name FROM artists art
WHERE artist_name NOT IN(SELECT artist_name FROM artists art
JOIN albums alb ON alb.album_id = art.artist_id
JOIN artist_albums a_a ON a_a.artist_id = art.artist_id
WHERE date_of_release = 2020)
ORDER BY artist_name;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT DISTINCT name_collection FROM collections col
JOIN tracks_collections t_c ON t_c.collection_id = col.collection_id
JOIN tracks t ON t.track_id = t_c.track_id
JOIN artist_albums a_a ON a_a.album_id = t.album_id
JOIN artists a ON a.artist_id = a_a.album_id
WHERE artist_name LIKE '%Allie X%'
ORDER BY name_collection;

-- Задание 4.
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

SELECT DISTINCT name_album FROM albums alb
JOIN artist_albums a_a ON alb.album_id = a_a.album_id 
JOIN artists art ON a_a.artist_id = art.artist_id 
JOIN artist_genre a_g ON art.artist_id = a_g.artist_id 
GROUP BY name_album, a_g.artist_id 
HAVING COUNT(a_g.genre_id) > 1;


-- Наименования треков, которые не входят в сборники.

SELECT name_track FROM tracks t
LEFT JOIN tracks_collections t_c ON t.track_id = t_c.track_id 
WHERE t_c.track_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT artist_name, duration_track FROM tracks t
JOIN  albums  alb ON alb.album_id = t.album_id
JOIN  artist_albums a_a ON a_a.album_id = alb.album_id
JOIN  artists a ON a.artist_id = a_a.album_id
GROUP BY artist_name, duration_track
HAVING duration_track = (SELECT min(duration_track) from tracks)
ORDER BY artist_name;

-- Названия альбомов, содержащих наименьшее количество треков.

SELECT DISTINCT name_album FROM albums a
JOIN tracks t ON t.album_id = a.album_id 
WHERE t.album_id IN (
SELECT album_id FROM tracks 
GROUP BY album_id
HAVING count(track_id) = (
SELECT count(track_id) FROM tracks
GROUP BY album_id 
ORDER BY count
LIMIT 1))
ORDER BY name_album;