view: penalty_instigators {
  derived_table: {
    sql: SELECT
  player_info.firstName  AS player_info_first_name,
  player_info.lastName  AS player_info_last_name,
  COUNT(*) AS game_plays_penalty_count
FROM NHL.game_plays  AS game_plays
LEFT JOIN NHL.game_plays_players  AS game_plays_players ON game_plays.play_id = game_plays_players.play_id
LEFT JOIN NHL.player_info  AS player_info ON game_plays_players.player_id = player_info.player_id

WHERE ((((game_plays.dateTime ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))))) AND (game_plays.dateTime ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING)))))))) AND (game_plays.event = 'Penalty') AND (game_plays.description LIKE CONCAT(player_info.firstName, " ", player_info.lastName, "%"))
GROUP BY 1,2
ORDER BY 3 DESC
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

  dimension: penalties_caused {
    type: number
    sql: ${TABLE}.game_plays_penalty_count ;;
  }
}
