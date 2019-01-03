view: team_info {
  sql_table_name: NHL.team_info ;;

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
  }

  dimension: franchise_id {
    type: number
    sql: ${TABLE}.franchiseId ;;
  }

  dimension: logo {
    sql:  CONCAT("https://www.googleapis.com/customsearch/v1?q=",${full_team_name}," logo","&cx=018043677105343392876:la2bmnqp4yq&searchType=image&key=AIzaSyA9Dhc9gHV8NqcQdPSrsRz5oM9opisn3-4&num=1&fields=items%2Flink") ;;
    html: <img src='{{ value }}'> ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.shortName ;;
    link: {
      label: "Stadium Information"
      url: "https://www.google.com/search?q={{ value | url_encode }} NHL Stadium information"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "Stadium Location"
      url: "https://www.google.com/maps?q={{ value | url_encode }} NHL stadium"
      icon_url: "https://img.icons8.com/color/1600/google-maps.png"
    }
  }

  dimension: full_team_name {
    type: string
    sql: CASE
      WHEN ${short_name} = "NY Islanders" THEN "New York Islanders"
      WHEN ${short_name} = "NY Rangers" THEN "New York Rangers"
      ELSE concat(${short_name}," ",${team_name})
      END;;
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

  dimension: team_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.teamName ;;
    link: {
      label: "Current Roster"
      url: "https://www.nhl.com/{{ value | downcase | remove: ' ' }}/roster/"
      icon_url: "http://pluspng.com/img-png/nhl-png-datei-logo-nhl-svg-2000.png"
    }
    link: {
      label: "Skater Stats"
      url: "https://www.nhl.com/{{ value | downcase | remove: ' ' }}/stats/regular-season"
      icon_url: "https://statsweb-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/STATS_Logo_FullColor_RGB.png"
    }
  }

  measure: count {
    type: count
    drill_fields: [team_name, short_name]
  }
}
