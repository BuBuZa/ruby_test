class TournamentController < ApplicationController
  def index
    @teams = Team.all
  end

  def generate_results
    generate_division_results('A')
    generate_division_results('B')
    generate_playoff_results

    redirect_to root_path, notice: 'Результаты турнира сгенерированы'
  end

  def enter_teams
    @teams = Team.all
  end

  def distribute_teams
    teams = params[:teams]
    division_a_teams = teams.sample(8)
    division_b_teams = teams - division_a_teams

    Team.update_all(division: 'A', champion: false)
    Team.where(name: division_a_teams).update_all(division: 'A')
    Team.where(name: division_b_teams).update_all(division: 'B')

    redirect_to root_path, notice: 'Команды распределены по дивизионам'
  end
=begin
  def create_teams
    team_params[:names].each do |name|
      Team.create(name: name)
    end
    @teams = Team.all
    render :index

  end
=end
  def create_teams
  if team_params[:teams]
    team_params[:teams].each do |team_params|
      Team.create(name: team_params[:name])
    end
  end

  redirect_to root_path, notice: 'Команды созданы успешно'
  end


  private

  def team_params
    params.permit(teams: [:name])
  end

  def generate_playoff_results
    playoff_teams = Team.where(champion: true)

    playoff_teams.each_slice(2) do |first_team, second_team|
      home_score = rand(0..5)
      away_score = rand(0..5)
      Match.create(
        division: 'Play-off',
        home_team: first_team,
        away_team: second_team,
        home_team_score: home_score,
        away_team_score: away_score
      )

      if home_score > away_score
        first_team.update(champion: true)
        second_team.update(champion: false)
      else
        first_team.update(champion: false)
        second_team.update(champion: true)
      end
    end
  end
end


