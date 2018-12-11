view: game_teams_stats {
  sql_table_name: NHL.game_teams_stats ;;

  dimension: face_off_win_percentage {
    type: number
    sql: ${TABLE}.faceOffWinPercentage ;;
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

  dimension: head_coach {
    type: string
    sql: ${TABLE}.head_coach ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: ho_a {
    type: string
    sql: ${TABLE}.HoA ;;
  }

  dimension: pim {
    type: number
    sql: ${TABLE}.pim ;;
  }

  dimension: power_play_goals {
    type: number
    sql: ${TABLE}.powerPlayGoals ;;
  }

  dimension: power_play_opportunities {
    type: number
    sql: ${TABLE}.powerPlayOpportunities ;;
  }

  dimension: settled_in {
    type: string
    sql: ${TABLE}.settled_in ;;
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

  dimension: won {
    type: yesno
    sql: ${TABLE}.won ;;
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
