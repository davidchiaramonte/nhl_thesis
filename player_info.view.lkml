view: player_info {
  sql_table_name: NHL.player_info ;;

  dimension: birth_city {
    type: string
    sql: ${TABLE}.birthCity ;;
  }

  dimension_group: birth {
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
    sql: ${TABLE}.birthDate ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.firstName ;;
  }

  dimension: link_to_comparison {
    type: string
    sql: CONCAT("How does ", ${full_name}, " compare to other players?") ;;
    link: {
      label: "Team Comparison"
      url: "/dashboards/3?Player+1={{ player_info.full_name._value | url_encode }}"
      icon_url: "https://www.looker.com/favicon.ico"
    }
  }

#   dimension: link_to_comparison_with_filter {
#     type: string
#     sql: CONCAT("How does ", ${full_name}, " compare to other players?") ;;
#     link: {
#       label: "Team Comparison"
#       url: "/dashboards/3?Player+1={{ full_name_filter._parameter_value | url_encode }}"
#       icon_url: "https://www.looker.com/favicon.ico"
#     }
#   }
#
#   parameter: full_name_filter {
#     type: string
#     suggest_dimension: full_name
#   }

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
    sql: ${TABLE}.lastName ;;
    drill_fields: [last_name]
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.nationality ;;
  }

  dimension: player_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: player_portrait {
    sql:  CONCAT(${first_name}," ",${last_name}," current NHL headshot portrait") ;;
    html: <img src="http://looker-feeling-lucky.herokuapp.com/api.php?q={{ value | url_param_escape }}" height="100%" width="100%" /> ;;
  }

  dimension: primary_position {
    type: string
    sql: ${TABLE}.primaryPosition ;;
  }

  dimension: primary_position_formatted {
    type: string
    sql: CASE WHEN ${TABLE}.primaryPosition = 'C' THEN 'Center'
          WHEN ${TABLE}.primaryPosition = 'D' THEN 'Defenseman'
          WHEN ${TABLE}.primaryPosition = 'LW' THEN 'Left Wing'
          WHEN ${TABLE}.primaryPosition = 'RW' THEN 'Right Wing'
          WHEN ${TABLE}.primaryPosition = 'G' THEN 'Goalie'
          ELSE 'Other'
          END;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
