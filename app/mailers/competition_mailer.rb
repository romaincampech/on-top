class CompetitionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.competition_mailer.created.subject
  #
  def competition_created(competition)
    @competition = competition
    mail(to: @competition.creator.email,
        subject: "#{@competition.name} has been created!")
  end

  def self.invited_participants(competition)
    @competition = competition
    @competition.players.each do |participant|
      if participant != @competition.creator
        invite(participant.first_name, participant.email, @competition).deliver_now
      end
    end
  end

  def invite(name, email, competition)
    @name = name
    @competition = competition
    mail(to: email,
        subject: "You have been invited to play in #{competition.name}")
  end
end
