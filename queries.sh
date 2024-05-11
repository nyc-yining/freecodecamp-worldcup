echo -e "\nWinner of the 2018 tournament team name:"
echo $($PSQL "SELECT t.name FROM teams t LEFT JOIN games g ON t.team_id=g.winner_id WHERE g.year=2018 AND round='Final'")

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo $($PSQL "SELECT t.name FROM games g FULL JOIN teams t ON g.winner_id=t.team_id OR g.opponent_id=t.team_id WHERE (g.year='2014' AND g.round='Eighth-Final') ORDER BY t.name")

echo -e "\nList of unique winning team names in the whole data set:"
echo $($PSQL "SELECT DISTINCT(t.name) FROM games g LEFT JOIN teams t ON g.winner_id=t.team_id ORDER BY t.name")

echo -e "\nYear and team name of all the champions:"
echo $($PSQL "SELECT g.year, t.name FROM games g LEFT JOIN teams t ON g.winner_id=t.team_id WHERE round='Final' ORDER BY g.year")
