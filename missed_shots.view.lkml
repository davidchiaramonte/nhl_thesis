view: missed_shots {
  derived_table: {
    persist_for: "8760 hours"
    sql: SELECT
  player_info.firstName  AS first_name,
  player_info.lastName  AS last_name,
  player_info.primaryPosition AS primaryPosition,
  COUNT(*) AS game_plays_missed_shots,
  SUM(game_skater_stats.shots) AS total_shots
FROM NHL.game_plays  AS game_plays
LEFT JOIN NHL.game_plays_players  AS game_plays_players ON game_plays.play_id = game_plays_players.play_id
LEFT JOIN NHL.player_info  AS player_info ON game_plays_players.player_id = player_info.player_id
LEFT JOIN NHL.game_skater_stats AS game_skater_stats ON game_plays.game_id = game_skater_stats.game_id

WHERE ((((game_plays.dateTime ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))))) AND (game_plays.dateTime ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING)))))))) AND (game_plays.event = 'Missed Shot') AND (game_plays.description LIKE CONCAT(player_info.firstName, " ", player_info.lastName, "%"))
GROUP BY 1,2,3
ORDER BY 5 DESC
LIMIT 500 ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: primary_position {
    type: string
    sql: ${TABLE}.primaryposition ;;
  }

  dimension: missed_shots {
    type: number
    sql: ${TABLE}.game_plays_missed_shots ;;
  }

  dimension: total_shots {
    type: number
    sql: ${TABLE}.total_shots ;;
  }

  dimension: percent_shots_missed {
    type: number
    sql: ${missed_shots}/${total_shots} ;;
    value_format: "0.00%"
  }
}
