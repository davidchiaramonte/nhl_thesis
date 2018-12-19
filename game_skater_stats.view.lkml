view: game_skater_stats {
  sql_table_name: NHL.game_skater_stats ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${game_id}, ${player_id}) ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: blocked {
    type: number
    sql: ${TABLE}.blocked ;;
  }

  dimension: even_time_on_ice {
    type: number
    sql: ${TABLE}.evenTimeOnIce ;;
  }

  dimension: face_off_wins {
    type: number
    sql: ${TABLE}.faceOffWins ;;
  }

  dimension: faceoff_taken {
    type: number
    sql: ${TABLE}.faceoffTaken ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: giveaways {
    type: number
    sql: ${TABLE}.giveaways ;;
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: penalty_minutes {
    type: number
    sql: ${TABLE}.penaltyMinutes ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: plus_minus {
    type: number
    sql: ${TABLE}.plusMinus ;;
  }

  dimension: power_play_assists {
    type: number
    sql: ${TABLE}.powerPlayAssists ;;
  }

  dimension: power_play_goals {
    type: number
    sql: ${TABLE}.powerPlayGoals ;;
  }

  dimension: power_play_time_on_ice {
    type: number
    sql: ${TABLE}.powerPlayTimeOnIce ;;
  }

  dimension: short_handed_assists {
    type: number
    sql: ${TABLE}.shortHandedAssists ;;
  }

  dimension: short_handed_goals {
    type: number
    sql: ${TABLE}.shortHandedGoals ;;
  }

  dimension: short_handed_time_on_ice {
    type: number
    sql: ${TABLE}.shortHandedTimeOnIce ;;
  }

  dimension: shots {
    type: number
    sql: ${TABLE}.shots ;;
  }

  dimension: takeaways {
    type: number
    sql: ${TABLE}.takeaways ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: time_on_ice {
    type: number
    sql: ${TABLE}.timeOnIce ;;
  }

  measure: total_goals {
    type: sum
    sql: ${goals} ;;
  }

  measure: total_assists {
    type: sum
    sql: ${assists} ;;
  }

  measure: total_power_play_goals {
    type: sum
    sql: ${power_play_goals} ;;
  }

  measure: total_power_play_assists {
    type: sum
    sql: ${power_play_assists} ;;
  }

  measure: total_fantasy_points {
    type: number
    sql: (3*${game_skater_stats.total_goals}) + (2*${game_skater_stats.total_assists}) + (${game_skater_stats.total_power_play_goals} + ${game_skater_stats.total_power_play_assists}) ;;
  }

  measure: total_penalty_minutes {
    type: sum
    sql: ${penalty_minutes} ;;
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
