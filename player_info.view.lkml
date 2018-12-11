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

  dimension: last_name {
    type: string
    sql: ${TABLE}.lastName ;;
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
    type: number
    sql: ${TABLE}.player_id ;;
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
