class MatchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.match_mailer.score.subject
  #
  def score(match)
    @match = match
    if @match.player_one == @match.winner
      @loser = @match.player_two
    else
      @loser = @match.player_one
    end

    mail(to: @loser.email, subject: "Score added")
  end
end
