view: game {
  sql_table_name: NHL.game ;;

  dimension: game_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.game_id ;;
  }

  dimension: away_goals {
    type: number
    sql: ${TABLE}.away_goals ;;
  }

  dimension: away_team_id {
    type: number
    sql: ${TABLE}.away_team_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_time ;;
  }

  dimension: home_goals {
    type: number
    sql: ${TABLE}.home_goals ;;
  }

  dimension: home_rink_side_start {
    type: string
    sql: ${TABLE}.home_rink_side_start ;;
  }

  dimension: home_team_id {
    type: number
    sql: ${TABLE}.home_team_id ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  dimension: venue_link {
    type: string
    sql: ${TABLE}.venue_link ;;
  }

  dimension: venue_time_zone_id {
    type: string
    sql: ${TABLE}.venue_time_zone_id ;;
  }

  dimension: venue_time_zone_offset {
    type: number
    sql: ${TABLE}.venue_time_zone_offset ;;
  }

  dimension: venue_time_zone_tz {
    type: string
    sql: ${TABLE}.venue_time_zone_tz ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_home_goals {
    type: sum
    sql: ${home_goals} ;;
  }

  measure: total_away_goals {
    type: sum
    sql: ${away_goals} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      game_id,
      game_goalie_stats.count,
      game_plays.count,
      game_plays_players.count,
      game_shifts.count,
      game_skater_stats.count,
      game_teams_stats.count
    ]
  }
}
