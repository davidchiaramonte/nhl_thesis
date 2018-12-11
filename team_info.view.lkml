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

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.shortName ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.teamName ;;
  }

  measure: count {
    type: count
    drill_fields: [team_name, short_name]
  }
}
