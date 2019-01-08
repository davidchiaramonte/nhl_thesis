view: starting_lineup {
  derived_table: {
    persist_for: "8760 hours"
    sql:
      (SELECT
  team_info.shortName  AS City_Name,
  team_info.teamName  AS Team_Name,
  player_info.firstName  AS First_Name,
  player_info.lastName  AS Last_Name,
  player_info.primaryPosition  AS Primary_Position,
  COALESCE(SUM(game_skater_stats.goals ), 0) AS Total_Goals,
  COALESCE(SUM(game_skater_stats.assists ), 0) AS Total_Assists,
  COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0) AS Total_Power_Play_Goals,
  COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0) AS Total_Power_Play_Assists,
  (3*(COALESCE(SUM(game_skater_stats.goals ), 0))) + (2*(COALESCE(SUM(game_skater_stats.assists ), 0))) + ((COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0)) + (COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0)))  AS Total_Fantasy_Points
FROM NHL.game_skater_stats  AS game_skater_stats
LEFT JOIN NHL.game  AS game ON game_skater_stats.game_id = game.game_id
LEFT JOIN NHL.player_info  AS player_info ON player_info.player_id = game_skater_stats.player_id
LEFT JOIN NHL.team_info  AS team_info ON team_info.team_id = game_skater_stats.team_id

WHERE ((((game.date_time ) >= ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))) AND (game.date_time ) < ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 3 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY))))))) AND ((player_info.primaryPosition  IN ('C', 'LW', 'RW')))
GROUP BY 1,2,3,4,5
ORDER BY 10 DESC
LIMIT 12)

UNION ALL

(SELECT
  team_info.shortName  AS City_Name,
  team_info.teamName  AS Team_Name,
  player_info.firstName  AS First_Name,
  player_info.lastName  AS Last_Name,
  player_info.primaryPosition  AS Primary_Position,
  COALESCE(SUM(game_skater_stats.goals ), 0) AS Total_Goals,
  COALESCE(SUM(game_skater_stats.assists ), 0) AS Total_Assists,
  COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0) AS Total_Power_Play_Goals,
  COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0) AS Total_Power_Play_Assists,
  (3*(COALESCE(SUM(game_skater_stats.goals ), 0))) + (2*(COALESCE(SUM(game_skater_stats.assists ), 0))) + ((COALESCE(SUM(game_skater_stats.powerPlayGoals ), 0)) + (COALESCE(SUM(game_skater_stats.powerPlayAssists ), 0)))  AS Total_Fantasy_Points
FROM NHL.game_skater_stats  AS game_skater_stats
LEFT JOIN NHL.game  AS game ON game_skater_stats.game_id = game.game_id
LEFT JOIN NHL.player_info  AS player_info ON player_info.player_id = game_skater_stats.player_id
LEFT JOIN NHL.team_info  AS team_info ON team_info.team_id = game_skater_stats.team_id

WHERE ((((game.date_time ) >= ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY)))) AND (game.date_time ) < ((DATE(TIMESTAMP_TRUNC(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 2 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS DATE), INTERVAL -1 YEAR) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), YEAR) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP), DAY))))))) AND (player_info.primaryPosition = 'D')
GROUP BY 1,2,3,4,5
ORDER BY 10 DESC
LIMIT 6);;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.City_Name ;;
  }

  dimension: full_team_name {
    type: string
    sql: concat(${city_name}," ",${team_name}) ;;
    link: {
      label: "Team News"
      url: "https://www.nhl.com/search#q={{ value | url_encode }}"
      icon_url: "http://pluspng.com/img-png/nhl-png-datei-logo-nhl-svg-2000.png"
    }
    link: {
      label: "Team Breakdown"
      url: "/dashboards/7?Team+Name={{ value | url_encode }}"
      icon_url: "https://static.crozdesk.com/web_app_library/providers/logos/000/002/613/original/looker-data-platform-1506361407-logo.png?1506361407"
    }
    link: {
      label: "Team Comparison"
      url: "/dashboards/5?Team+1={{ value | url_encode }}"
      icon_url: "https://static.crozdesk.com/web_app_library/providers/logos/000/002/613/original/looker-data-platform-1506361407-logo.png?1506361407"
    }
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.Team_Name ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
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
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: primary_position {
    type: string
    sql: ${TABLE}.Primary_Position ;;
  }

  dimension: total_goals {
    type: number
    sql: ${TABLE}.Total_Goals ;;
  }

  dimension: total_assists {
    type: number
    sql: ${TABLE}.Total_Assists ;;
  }

  dimension: total_power_play_goals {
    type: number
    sql: ${TABLE}.Total_Power_Play_Goals ;;
  }

  dimension: total_power_play_assists {
    type: number
    sql: ${TABLE}.Total_Power_Play_Assists ;;
  }

  dimension: total_fantasy_points {
    type: number
    sql: ${TABLE}.Total_Fantasy_Points ;;
  }
}
