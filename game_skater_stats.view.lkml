view: game_skater_stats {
  sql_table_name: NHL.game_skater_stats ;;

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

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}