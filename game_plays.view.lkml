view: game_plays {
  sql_table_name: NHL.game_plays ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dateTime ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: goals_away {
    type: number
    sql: ${TABLE}.goals_away ;;
  }

  dimension: goals_home {
    type: number
    sql: ${TABLE}.goals_home ;;
  }

  dimension: period {
    type: number
    sql: ${TABLE}.period ;;
  }

  dimension: period_time {
    type: number
    sql: ${TABLE}.periodTime ;;
  }

  dimension: period_time_remaining {
    type: number
    sql: ${TABLE}.periodTimeRemaining ;;
  }

  dimension: period_type {
    type: string
    sql: ${TABLE}.periodType ;;
  }

  dimension: play_id {
    type: string
    sql: ${TABLE}.play_id ;;
  }

  dimension: play_num {
    type: number
    sql: ${TABLE}.play_num ;;
  }

  dimension: rink_side {
    type: string
    sql: ${TABLE}.rink_side ;;
  }

  dimension: secondary_type {
    type: string
    sql: ${TABLE}.secondaryType ;;
  }

  dimension: st_x {
    type: string
    sql: ${TABLE}.st_x ;;
  }

  dimension: st_y {
    type: string
    sql: ${TABLE}.st_y ;;
  }

  dimension: team_id_against {
    type: string
    sql: ${TABLE}.team_id_against ;;
  }

  dimension: team_id_for {
    type: string
    sql: ${TABLE}.team_id_for ;;
  }

  dimension: x {
    type: string
    sql: ${TABLE}.x ;;
  }

  dimension: y {
    type: string
    sql: ${TABLE}.y ;;
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
