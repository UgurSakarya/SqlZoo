
-- Sql Zoo Music Tutorial Answers

 -- Q1. Find the title and artist who recorded the song 'Alison'.

 SELECT title, artist
FROM album JOIN track
ON (album.asin=track.album)
WHERE song = 'Alison';

 -- Q2. Which artist recorded the song 'Exodus'?

SELECT artist FROM album
JOIN track ON (album.asin = track.album)
WHERE song = 'Exodus';

 -- Q3. Show the song for each track on the album 'Blur'

SELECT song FROM track
JOIN album
ON track.album = album.asin
WHERE artist = 'Blur';

 -- Q4. For each album show the title and the total number of track.

SELECT title, COUNT(*)
FROM album JOIN track ON (asin=album)
GROUP BY title;

 -- Q5. For each album show the title and the total number of tracks containing the word 'Heart' 
--(albums with no such tracks need not be shown).

SELECT title, count(*)
FROM album
JOIN track ON album.asin=track.album
where song LIKE '%Heart%'
group by title;

-- Q6. A "title track" is where the song is the same as the title. Find the title tracks.

SELECT song FROM track
JOIN album ON track.album = album.asin
where track.song = album.title;

-- Q7. An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.

SELECT title FROM album
where title = artist;

-- Q8. Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.

SELECT track.song, count(distinct album.title)
FROM album join track ON album.asin = track.album
group by track.song
HAVING count(distinct album.title) > 2;

-- Q9. A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks. 

SELECT album.title, album.price, COUNT(*) AS number
FROM album JOIN track ON album.asin = track.album
GROUP BY album.title, album.price
HAVING (album.price / COUNT(*)) < 0.5;

-- Q10. List albums so that the album with the most tracks is first. Show the title and the number of tracks

SELECT album.title, COUNT(track.song)
FROM album
JOIN track ON album.asin = track.album
GROUP BY album.title
ORDER BY COUNT(track.song) DESC;

