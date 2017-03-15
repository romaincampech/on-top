json.matches @competition.matches do |match|

    json.partial! 'matches/match', match: match

end

json.league_table_data @league_table_data
