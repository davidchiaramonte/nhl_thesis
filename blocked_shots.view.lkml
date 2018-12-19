view: blocked_shots {
  derived_table: {
    persist_for: "8760 hours"
    sql: SELECT
  player_info.firstName  AS player_info_first_name,
  player_info.lastName  AS player_info_last_name,
  player_info.primaryPosition AS player_info_primary_position,
  COUNT(*) AS game_plays_blocked_shots
FROM NHL.game_plays  AS game_plays
LEFT JOIN NHL.game_plays_players  AS game_plays_players ON game_plays.play_id = game_plays_players.play_id
LEFT JOIN NHL.player_info  AS player_info ON game_plays_players.player_id = player_info.player_id

WHERE ((((game_plays.dateTime ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))))) AND (game_plays.dateTime ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING)))))))) AND (game_plays.event = 'Blocked Shot') AND (game_plays.description LIKE CONCAT(player_info.firstName, " ", player_info.lastName, "%"))
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 500 ;;
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

  dimension: number_of_blocked_shots {
    type: number
    sql: ${TABLE}.game_plays_blocked_shots ;;
  }
}
