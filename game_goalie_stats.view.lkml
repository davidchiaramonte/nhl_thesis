view: game_goalie_stats {
  sql_table_name: NHL.game_goalie_stats ;;

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: decision {
    type: string
    sql: ${TABLE}.decision ;;
  }

  dimension: even_saves {
    type: number
    sql: ${TABLE}.evenSaves ;;
  }

  dimension: even_shots_against {
    type: number
    sql: ${TABLE}.evenShotsAgainst ;;
  }

  dimension: even_strength_save_percentage {
    type: number
    sql: ${TABLE}.evenStrengthSavePercentage ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals ;;
  }

  dimension: pim {
    type: number
    sql: ${TABLE}.pim ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: power_play_save_percentage {
    type: number
    sql: ${TABLE}.powerPlaySavePercentage ;;
  }

  dimension: power_play_saves {
    type: number
    sql: ${TABLE}.powerPlaySaves ;;
  }

  dimension: power_play_shots_against {
    type: number
    sql: ${TABLE}.powerPlayShotsAgainst ;;
  }

  dimension: save_percentage {
    type: number
    sql: ${TABLE}.savePercentage ;;
  }

  dimension: saves {
    type: number
    sql: ${TABLE}.saves ;;
  }

  dimension: short_handed_saves {
    type: number
    sql: ${TABLE}.shortHandedSaves ;;
  }

  dimension: short_handed_shots_against {
    type: number
    sql: ${TABLE}.shortHandedShotsAgainst ;;
  }

  dimension: shots {
    type: number
    sql: ${TABLE}.shots ;;
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
