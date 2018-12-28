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

  dimension: full_name {
    type: string
    sql: concat(${first_name}," ",${last_name}) ;;
    link: {
      label: "Player News"
      url: "https://www.nhl.com/search#q={{ value | url_encode }}"
      icon_url: "http://pluspng.com/img-png/nhl-png-datei-logo-nhl-svg-2000.png"
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
    sql:  CONCAT("https://www.googleapis.com/customsearch/v1?q=",${full_name}," NHL portrait","&cx=018043677105343392876:la2bmnqp4yq&searchType=image&key=AIzaSyA9Dhc9gHV8NqcQdPSrsRz5oM9opisn3-4&num=1&fields=items%2Flink") ;;
    html: <img src='{{ value }}'> ;;
  }

  dimension: primary_position {
    type: string
    sql: ${TABLE}.primaryPosition ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}
