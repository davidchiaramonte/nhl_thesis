view: blocked_shots {
  derived_table: {
    persist_for: "8760 hours"
    sql: SELECT
  player_info.firstName  AS player_info_first_name,
  player_info.lastName  AS player_info_last_name,
  player_info.primaryPosition  AS player_info_primary_position,
  COUNT(*) AS game_plays_blocked_shots
FROM NHL.game_plays  AS game_plays
LEFT JOIN NHL.game  AS game ON game_plays.game_id = game.game_id
LEFT JOIN NHL.game_plays_players  AS game_plays_players ON game_plays.play_id = game_plays_players.play_id
LEFT JOIN NHL.player_info  AS player_info ON game_plays_players.player_id = player_info.player_id

WHERE
  (((game.date_time ) >= ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))) AND (game.date_time ) < ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 3 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))))) AND (game_plays.event = 'Blocked Shot') AND (game_plays.description LIKE CONCAT(player_info.firstName, " ", player_info.lastName, "%"))
GROUP BY 1,2,3
ORDER BY 4 DESC ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.player_info_first_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name}," ",${last_name}) ;;
    link: {
      label: "Player News"
      url: "https://www.nhl.com/search#q={{ value | url_encode }}"
      icon_url: "http://pluspng.com/img-png/nhl-png-datei-logo-nhl-svg-2000.png"
    }
    link: {
      label: "Player Breakdown"
      url: "/dashboards/6?Player+Name={{ value | url_encode }}"
      icon_url: "https://static.crozdesk.com/web_app_library/providers/logos/000/002/613/original/looker-data-platform-1506361407-logo.png?1506361407"
    }
    link: {
      label: "Player Comparison"
      url: "/dashboards/3?Player+1={{ value | url_encode }}"
      icon_url: "https://static.crozdesk.com/web_app_library/providers/logos/000/002/613/original/looker-data-platform-1506361407-logo.png?1506361407"
    }
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
