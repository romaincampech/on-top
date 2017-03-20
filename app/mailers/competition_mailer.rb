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

  # def invited_participants(competition)
  #   @competition = competition
  #   mail(to: @competition.competition_participants.each {|participant| participant.email})
end
