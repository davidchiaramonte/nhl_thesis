connection: "nhl_db_thesis"

# include all the views
include: "*.view"

include: "*.dashboard"

datagroup: nhl_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: scheduler_test {
  sql_trigger: SELECT count(*) FROM game ;;
  max_cache_age: "6 hours"
}

#Adding a Model Label can group explores into one, single list
#label: "Test 1"

persist_with: nhl_thesis_default_datagroup

explore: game {}

explore: game_goalie_stats {
  join: game {
    type: left_outer
    sql_on: ${game_goalie_stats.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
  join: player_info {
    type: left_outer
    sql_on: ${game_goalie_stats.player_id} = ${player_info.player_id} ;;
    relationship: many_to_one
  }
  join: team_info {
    type: left_outer
    sql_on: ${game_goalie_stats.team_id} = ${team_info.team_id} ;;
    relationship: many_to_one
  }
}

explore: game_plays {
  join: game {
    type: left_outer
    sql_on: ${game_plays.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
  join: game_plays_players {
    type: left_outer
    sql_on: ${game_plays.play_id} = ${game_plays_players.play_id} ;;
    relationship: many_to_one
  }
  join: player_info {
    type: left_outer
    sql_on: ${game_plays_players.player_id} = ${player_info.player_id} ;;
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
  join: player_info {
    type: left_outer
    sql_on: ${player_info.player_id} = ${game_skater_stats.player_id} ;;
    relationship: many_to_one
  }
  join: team_info {
    type: left_outer
    sql_on: ${team_info.team_id} = ${game_skater_stats.team_id} ;;
    relationship: many_to_one
  }
}

explore: game_teams_stats {
  join: game {
    type: left_outer
    sql_on: ${game_teams_stats.game_id} = ${game.game_id} ;;
    relationship: many_to_one
  }
  join: team_info {
    type: left_outer
    sql_on: ${game_teams_stats.team_id} = ${team_info.team_id} ;;
    relationship: many_to_one
  }
}

explore: player_info {}

explore: team_info {}

### END OF AUTO-GENERATED EXPLORES ###

explore: starting_lineup {}

explore: penalty_instigators {}

explore: top_hitters {}

explore: blocked_shots {}

explore: giveaways {}

explore: missed_shots {}

explore: player_comparison {}

# explore: total_info {
#   from: game_plays
#   join: game {
#     type: left_outer
#     sql_on: ${total_info.game_id} = ${game.game_id} ;;
#     relationship: many_to_one
#   }
#     join: game_teams_stats {
#       type: left_outer
#       sql_on: ${game_teams_stats.game_id} = ${game.game_id} ;;
#       relationship: many_to_one
#     }
#   join: game_plays_players {
#       type: left_outer
#       sql_on: ${game_plays_players.play_id} = ${total_info.play_id} ;;
#       relationship: many_to_one
#   }
#   join: game_goalie_stats {
#       type: left_outer
#       sql_on: ${game.game_id} = ${game_goalie_stats.game_id} ;;
#       relationship: many_to_one
#   }
#   join: game_shifts {
#       type: left_outer
#       sql_on: ${game_shifts.game_id} = ${game.game_id} ;;
#       relationship: many_to_one
#   }
#   join: game_skater_stats {
#       type: left_outer
#       sql_on: ${game.game_id} = ${game_skater_stats.game_id} ;;
#       relationship: many_to_one
#   }
#   join: player_info {
#       type: left_outer
#       sql_on:  ;;
#   }
# }
#
# explore: goalie_shots_blocked {
#   from: game_plays
#   join: game {
#     type: left_outer
#     sql_on: ${goalie_shots_blocked.game_id} = ${game.game_id} ;;
#     relationship: many_to_one
#   }
#   join: game_goalie_stats {
#     type: left_outer
#     sql_on: ${game.game_id} = ${game_goalie_stats.game_id} ;;
#     relationship: many_to_one
#   }
#   join: player_info {
#     type: left_outer
#     sql_on: ${game_goalie_stats.team_id} = ${player_info.player_id} ;;
#     relationship: many_to_one
#   }
# }
