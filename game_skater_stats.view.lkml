view: game_skater_stats {
  sql_table_name: NHL.game_skater_stats ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${game_id}, ${player_id}) ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: blocked {
    type: number
    sql: ${TABLE}.blocked ;;
  }

  dimension: even_time_on_ice {
    type: number
    sql: ${TABLE}.evenTimeOnIce ;;
  }

  dimension: face_off_wins {
    type: number
    sql: ${TABLE}.faceOffWins ;;
  }

  dimension: faceoff_taken {
    type: number
    sql: ${TABLE}.faceoffTaken ;;
  }

  dimension: game_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.game_id ;;
  }

  dimension: giveaways {
    type: number
    sql: ${TABLE}.giveaways ;;
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: penalty_minutes {
    type: number
    sql: ${TABLE}.penaltyMinutes ;;
  }

  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: plus_minus {
    type: number
    sql: ${TABLE}.plusMinus ;;
    html: {% if value > 0 %}
            <p style="color: lime">{{ rendered_value }}</p>
          {% elsif value < 0 %}
            <p style="color: red">{{ rendered_value }}</p>
          {% else %}
            <p style="color: black">{{ rendered_value }}</p>
          {% endif %} ;;
  }

  dimension: power_play_assists {
    type: number
    sql: ${TABLE}.powerPlayAssists ;;
  }

  dimension: power_play_goals {
    type: number
    sql: ${TABLE}.powerPlayGoals ;;
  }

  dimension: power_play_time_on_ice {
    type: number
    sql: ${TABLE}.powerPlayTimeOnIce ;;
  }

  dimension: short_handed_assists {
    type: number
    sql: ${TABLE}.shortHandedAssists ;;
  }

  dimension: short_handed_goals {
    type: number
    sql: ${TABLE}.shortHandedGoals ;;
  }

  dimension: short_handed_time_on_ice {
    type: number
    sql: ${TABLE}.shortHandedTimeOnIce ;;
  }

  dimension: shots {
    type: number
    sql: ${TABLE}.shots ;;
  }

  dimension: takeaways {
    type: number
    sql: ${TABLE}.takeaways ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: time_on_ice {
    type: number
    sql: ${TABLE}.timeOnIce ;;
  }

  measure: total_goals {
    type: sum
    sql: ${goals} ;;
  }

  measure: total_assists {
    type: sum
    sql: ${assists} ;;
  }

  measure: total_power_play_goals {
    type: sum
    sql: ${power_play_goals} ;;
  }

  measure: total_power_play_assists {
    type: sum
    sql: ${power_play_assists} ;;
  }

  measure: total_fantasy_points {
    type: number
    sql: (3*${game_skater_stats.total_goals}) + (2*${game_skater_stats.total_assists}) + (${game_skater_stats.total_power_play_goals} + ${game_skater_stats.total_power_play_assists}) ;;
  }

  measure: total_penalty_minutes {
    type: sum
    sql: ${penalty_minutes} ;;
  }

  measure: average_penalty_minutes {
    type: average
    sql: ${penalty_minutes} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_shots_on_goal {
    type: average
    sql: ${shots} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_goals {
    type: average
    sql: ${goals} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_assists {
    type: average
    sql: ${assists} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_power_play_goals {
    type: average
    sql: ${power_play_goals} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_power_play_assists {
    type: average
    sql: ${power_play_assists} ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: average_fantasy_points {
    type: number
    sql: (3*${average_goals}) + (2*${average_assists}) + ${average_power_play_goals} + ${average_power_play_goals} ;;
    value_format: "0.00"
    link: {
      label: "How Fantasy Scoring Works"
      url: "https://www.dummies.com/sports/fantasy-sports/fantasy-hockey/how-does-fantasy-hockey-scoring-work/"
    }
  }

  measure: average_time_on_ice {
    type: average
    sql: ${time_on_ice}/60 ;;
    value_format: "0.00"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: games_played {
    type: count_distinct
    sql: ${game_id} ;;
    drill_fields: [game_id]
  }

  measure: average_plus_minus {
    type: average
    sql: ${plus_minus} ;;
    html: {% if value > 0 %}
    <p style="color: lime">{{ rendered_value }}</p>
    {% elsif value < 0 %}
    <p style="color: red">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black">{{ rendered_value }}</p>
    {% endif %} ;;
    value_format: "0.0000"
    link: {
      label: "Hockey Term Definitions"
      url: "https://en.wikipedia.org/wiki/Glossary_of_ice_hockey_terms"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/1122px-Wikipedia-logo-v2.svg.png"
    }
  }

  measure: total_team_plus_minus {
    type: sum
    sql: ${plus_minus} ;;
    value_format: "0.0000"
    description: "To be used with Game Count to calculate team plus minus"
  }

  measure: average_team_plus_minus {
    type: number
    sql: 1.0* ${total_team_plus_minus}/${game.count} ;;
    value_format: "0.0000"
    html: {% if value > 0 %}
    <p style="color: lime">{{ rendered_value }}</p>
    {% elsif value < 0 %}
    <p style="color: red">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  measure: total_team_shots_on_goal {
    type: sum
    sql: ${shots} ;;
    value_format: "0.00"
    description: "To be used with Game Count to calculate team shots on goal"
  }

  measure: count {
    type: count
    drill_fields: [game.game_id]
  }
}
