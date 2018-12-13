view: game_plays_players {
  sql_table_name: NHL.game_plays_players ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${play_id}, ${player_id}) ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: play_id {
    type: string
    sql: ${TABLE}.play_id ;;
  }

  dimension: play_num {
    type: number
    sql: ${TABLE}.play_num ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: player_type {
    type: string
    sql: ${TABLE}.playerType ;;
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
