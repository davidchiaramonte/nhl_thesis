view: game_shifts {
  sql_table_name: NHL.game_shifts ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${game_id}, ${player_id}) ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: period {
    type: number
    sql: ${TABLE}.period ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: shift_end {
    type: number
    sql: ${TABLE}.shift_end ;;
  }

  dimension: shift_start {
    type: number
    sql: ${TABLE}.shift_start ;;
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
