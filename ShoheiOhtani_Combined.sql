SELECT *
FROM ohtani.shoheiohtani_batting;

-- Top 10 homerun seasons for Ohtani
SELECT `Year`, `HR`
FROM ohtani.shoheiohtani_batting
ORDER BY `HR` DESC;

-- Batting AVG for Ohtani while playing for NPH, LAA, and LAD
SELECT SUM(`H`)/SUM(`AB`) AS Ohtani_LAA_Average
FROM ohtani.shoheiohtani_batting
WHERE `Year` >= 2018
AND `Year` < 2024
;
SELECT SUM(`H`)/SUM(`AB`) AS Ohtani_NPH_Average
FROM ohtani.shoheiohtani_batting
WHERE `Year` >= 2013
AND `Year` < 2018
;
SELECT AVG(`BA`) AS Ohtani_LAD_Average
FROM ohtani.shoheiohtani_batting
WHERE `Year` >= 2024
AND `Year` < 2025
;

-- Ohtani Strikout Totals Year by Year
SELECT `Year`, `SO`
FROM ohtani.shoheiohtani_batting
ORDER BY `Year`;

-- What were Shohei Ohtani's Greatest Hitting Seasons All-time?
SELECT *
FROM ohtani.shoheiohtani_batting
WHERE `Year` = 2021
OR `Year` = 2023
OR `Year` = 2024
ORDER BY `Year`;

-- Is younger Shohei Ohtani more likely to steal bases than when he was older?
SELECT `Year`, `Age`, `SB`
FROM ohtani.shoheiohtani_batting
ORDER BY YEAR ASC;

-- Does more power mean more strikeouts for Shohei Ohtani?
SELECT `Year`, `Age`, `G`, `HR`, `SO`
FROM ohtani.shoheiohtani_batting
ORDER BY `Year` ASC;

SELECT *
FROM ohtani.shoheiohtani_pitching;

-- ERA for Ohtani while playing for NPH, LAA
SELECT (SUM(`ER`)/SUM(`IP`))*9 AS Ohtani_LAA_ERA
FROM ohtani.shoheiohtani_pitching
WHERE `Year` >= 2018
AND `Year` < 2023
AND `Year` <> 2020 -- Had to remove the one year where he pitched less than 10 games all year to balance data
;
SELECT (SUM(`ER`)/SUM(`IP`))*9 AS Ohtani_NPH_ERA
FROM ohtani.shoheiohtani_pitching
WHERE `Year` >= 2013
AND `Year` < 2018
;

-- Join and display the hitting and pitching statistics for Shohei Ohtani as a two way player for each season
SELECT
    B.year,
    B.Age,
    B.Tm,
    B.Lg,
    B.G,
    B.PA,
    B.R,
    B.H,
    B.HR,
    B.RBI,
    B.SB,
    B.SO,
    B.BA,
    B.OBP,
    B.SLG,
    B.OPS,
    P.GS,
    P.W,
    P.L,
	P.IP,
    P.SO,
    P.ERA,
    P.WHIP
FROM
    shoheiohtani_batting AS B
JOIN
    shoheiohtani_pitching AS P ON B.year = P.year; 
    -- 2019 does not show up due to injury**
