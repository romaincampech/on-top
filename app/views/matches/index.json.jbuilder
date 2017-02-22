
json.matches @competition.matches do |match|

    json.partial! 'matches/match', match: match

end
