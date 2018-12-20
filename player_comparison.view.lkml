view: player_comparison {
  derived_table: {
    sql: SELECT
  team_info.shortName  AS team_info_short_name,
  team_info.teamName  AS team_info_team_name,
  player_info.firstName  AS player_info_first_name,
  player_info.lastName  AS player_info_last_name,
  player_info.primaryPosition  AS player_info_primary_position,
  COALESCE(SUM(game_skater_stats.goals ), 0) AS game_skater_stats_total_goals,
  COALESCE(SUM(game_skater_stats.assists ), 0) AS game_skater_stats_total_assists,
  COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0) AS game_skater_stats_total_power_play_goals,
  COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0) AS game_skater_stats_total_power_play_assists,
  (3*(COALESCE(SUM(game_skater_stats.goals ), 0))) + (2*(COALESCE(SUM(game_skater_stats.assists ), 0))) + ((COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0)) + (COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0)))  AS game_skater_stats_total_fantasy_points
FROM NHL.game_skater_stats  AS game_skater_stats
LEFT JOIN NHL.game  AS game ON game_skater_stats.game_id = game.game_id
LEFT JOIN NHL.player_info  AS player_info ON player_info.player_id = game_skater_stats.player_id
LEFT JOIN NHL.team_info  AS team_info ON team_info.team_id = game_skater_stats.team_id

WHERE
  (((game.date_time ) >= ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))) AND (game.date_time ) < ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY))))))
GROUP BY 1,2,3,4,5
ORDER BY 10 DESC ;;
  }


  dimension: team_city {
    type: string
    sql: ${TABLE}.team_info_short_name ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.team_info_team_name ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.player_info_first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.player_info_last_name ;;
  }

  dimension: primary_position {
    type: string
    sql: ${TABLE}.player_info_primary_position ;;
  }

  dimension: total_goals {
    type: number
    sql: ${TABLE}.game_skater_stats_total_goals ;;
  }

  dimension: total_assists {
    type: number
    sql: ${TABLE}.game_skater_stats_total_assists ;;
  }

  dimension: total_power_play_goals {
    type: number
    sql: ${TABLE}.game_skater_stats_total_power_play_goals ;;
  }

  dimension: total_power_play_assist {
    type: number
    sql: ${TABLE}.game_skater_stats_total_power_play_assists ;;
  }

  dimension: total_fantasy_points {
    type: number
    sql: ${TABLE}.game_skater_stats_total_fantasy_points ;;
  }

  measure: team_goals {
    type: sum
    sql: ${total_goals} ;;
  }

  measure: team_assists {
    type: sum
    sql: ${total_assists} ;;
  }

  measure: team_power_play_goals {
    type: sum
    sql: ${total_power_play_goals} ;;
  }

  measure: team_power_play_assists {
    type: sum
    sql: ${total_power_play_assist} ;;
  }

  measure: team_fantasy_points {
    type: sum
    sql: ${total_fantasy_points} ;;
  }
}
