CREATE PROCEDURE japan
AS
SELECT movie.mov_title
FROM movie
WHERE movie.mov_lang = 'Japanese'

EXEC japan

CREATE PROCEDURE language
    @lang VARCHAR(20)
AS
SELECT movie.mov_title
FROM movie
WHERE movie.mov_lang = @lang

IF EXISTS (select *
from dbo.sysobjects
where id = object_id(N'[dbo].[cast]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[cast]
GO

EXEC language 'English'

SELECT *
FROM movie

CREATE PROCEDURE twoHours
    @lang VARCHAR(20),
    @length INT
AS
SELECT movie.mov_title
FROM movie
WHERE movie.mov_lang = @lang AND movie.mov_time > @length

EXEC twoHours 'English', 120
