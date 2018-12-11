connection: "nhl_db_thesis"

# include all the views
include: "*.view"

datagroup: nhl_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nhl_thesis_default_datagroup

explore: game {}

explore: game_goalie_stats {
  join: game {
    type: left_outer
    sql_on: ${game_goalie_stats.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: game_plays {
  join: game {
    type: left_outer
    sql_on: ${game_plays.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: game_plays_players {
  join: game {
    type: left_outer
    sql_on: ${game_plays_players.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: game_shifts {
  join: game {
    type: left_outer
    sql_on: ${game_shifts.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: game_skater_stats {
  join: game {
    type: left_outer
    sql_on: ${game_skater_stats.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: game_teams_stats {
  join: game {
    type: left_outer
    sql_on: ${game_teams_stats.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
}

explore: player_info {}

explore: team_info {}
