- dashboard: nhl_thesis
  title: NHL Thesis
  layout: newspaper
  elements:
  - title: Top 25 Centers
    name: Top 25 Centers
    model: nhl_thesis
    explore: game_skater_stats
    type: table
    fields:
    - team_info.short_name
    - team_info.team_name
    - player_info.first_name
    - player_info.last_name
    - player_info.primary_position
    - game_skater_stats.total_goals
    - game_skater_stats.total_assists
    - game_skater_stats.total_power_play_goals
    - game_skater_stats.total_power_play_assists
    - game_skater_stats.total_fantasy_points
    filters:
      player_info.primary_position: C
    sorts:
    - game_skater_stats.total_fantasy_points desc
    limit: 25
    column_limit: 50
    hidden_fields:
    - player_info.primary_position
    listen:
      Historical Data: game.date_date
    row: 16
    col: 12
    width: 12
    height: 8
  - title: Top 25 Left Wings
    name: Top 25 Left Wings
    model: nhl_thesis
    explore: game_skater_stats
    type: table
    fields:
    - team_info.short_name
    - team_info.team_name
    - player_info.first_name
    - player_info.last_name
    - player_info.primary_position
    - game_skater_stats.total_goals
    - game_skater_stats.total_assists
    - game_skater_stats.total_power_play_goals
    - game_skater_stats.total_power_play_assists
    - game_skater_stats.total_fantasy_points
    filters:
      player_info.primary_position: LW
    sorts:
    - game_skater_stats.total_fantasy_points desc
    limit: 25
    column_limit: 50
    hidden_fields:
    - player_info.primary_position
    listen:
      Historical Data: game.date_date
    row: 32
    col: 0
    width: 12
    height: 8
  - title: Top 25 Right Wings
    name: Top 25 Right Wings
    model: nhl_thesis
    explore: game_skater_stats
    type: table
    fields:
    - team_info.short_name
    - team_info.team_name
    - player_info.first_name
    - player_info.last_name
    - player_info.primary_position
    - game_skater_stats.total_goals
    - game_skater_stats.total_assists
    - game_skater_stats.total_power_play_goals
    - game_skater_stats.total_power_play_assists
    - game_skater_stats.total_fantasy_points
    filters:
      player_info.primary_position: RW
    sorts:
    - game_skater_stats.total_fantasy_points desc
    limit: 25
    column_limit: 50
    hidden_fields:
    - player_info.primary_position
    listen:
      Historical Data: game.date_date
    row: 32
    col: 12
    width: 12
    height: 8
  - title: Top 25 Defensemen
    name: Top 25 Defensemen
    model: nhl_thesis
    explore: game_skater_stats
    type: table
    fields:
    - team_info.short_name
    - team_info.team_name
    - player_info.first_name
    - player_info.last_name
    - player_info.primary_position
    - game_skater_stats.total_goals
    - game_skater_stats.total_assists
    - game_skater_stats.total_power_play_goals
    - game_skater_stats.total_power_play_assists
    - game_skater_stats.total_fantasy_points
    filters:
      player_info.primary_position: D
    sorts:
    - game_skater_stats.total_fantasy_points desc
    limit: 25
    column_limit: 50
    hidden_fields:
    - player_info.primary_position
    listen:
      Historical Data: game.date_date
    row: 24
    col: 12
    width: 12
    height: 8
  - title: Players by Position and Team
    name: Players by Position and Team
    model: nhl_thesis
    explore: game_skater_stats
    type: collapsible_tree
    fields:
    - team_info.short_name
    - player_info.primary_position
    - player_info.last_name
    - game.date_year
    filters:
      game.date_year: 2 years
    sorts:
    - team_info.short_name
    limit: 5000
    query_timezone: America/Los_Angeles
    color_with_children: "#006D75"
    color_empty: "#EA7200"
    series_types: {}
    hidden_fields:
    - game.date_year
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 16
  - title: Average Goalie Save Percentage (>20 Games)
    name: Average Goalie Save Percentage (>20 Games)
    model: nhl_thesis
    explore: game_goalie_stats
    type: looker_scatter
    fields:
    - team_info.short_name
    - team_info.team_name
    - player_info.first_name
    - player_info.last_name
    - game_goalie_stats.average_save_percentage
    - game.number_of_games_played
    filters:
      player_info.primary_position: G
      game.number_of_games_played: ">=20"
    sorts:
    - game_goalie_stats.average_save_percentage desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#db7f2a"
    - "#635189"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors:
      game_goalie_stats.average_save_percentage: "#EA7200"
      game.number_of_games_played: "#006D75"
    series_types: {}
    series_point_styles:
      game_goalie_stats.average_save_percentage: diamond
      game.number_of_games_played: square
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: game.number_of_games_played
        name: Number of Games Played
        axisId: game.number_of_games_played
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: game_goalie_stats.average_save_percentage
        name: Average Save Percentage
        axisId: game_goalie_stats.average_save_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: ''
    plot_size_by_field: false
    show_null_points: true
    hidden_fields:
    - player_info.first_name
    - team_info.short_name
    - team_info.team_name
    listen:
      Historical Data: game.date_date
    row: 51
    col: 0
    width: 24
    height: 6
  - name: "-----------------------------------------------------------------------------------------------Player\
      \ Information-----------------------------------------------------------------------------------------------"
    type: text
    title_text: "-----------------------------------------------------------------------------------------------Player\
      \ Information-----------------------------------------------------------------------------------------------"
    subtitle_text: Check here for specific scoring by player
    row: 14
    col: 0
    width: 24
    height: 2
  - name: "-----------------------------------------------------------------------------------Goalie\
      \ and Defensive Information-----------------------------------------------------------------------------------"
    type: text
    title_text: "-----------------------------------------------------------------------------------Goalie\
      \ and Defensive Information-----------------------------------------------------------------------------------"
    subtitle_text: Check here for goalie-related statistics
    row: 49
    col: 0
    width: 24
    height: 2
  - name: NHL Fantasy Dream Team
    type: text
    title_text: NHL Fantasy Dream Team
    subtitle_text: All-star line up ➡️
    body_text: "<center><img src=\"https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/05_NHL_Shield.svg/1280px-05_NHL_Shield.svg.png\"\
      \ width=\"150\" height=\"172\"></center>\n<br>\n<b><i>“God bless fantasy [sports].\
      \ There are many things a man can do with his time… this is better than those\
      \ things.” \n<br><center>– Pete from The League"
    row: 0
    col: 0
    width: 5
    height: 14
  - title: Top 25 Goalies (by Number of Wins)
    name: Top 25 Goalies (by Number of Wins)
    model: nhl_thesis
    explore: game_goalie_stats
    type: table
    fields:
    - game_goalie_stats.total_wins
    - game_goalie_stats.total_games_played
    - team_info.full_team_name
    - player_info.full_name
    filters:
      player_info.primary_position: G
    sorts:
    - game_goalie_stats.total_wins desc
    limit: 25
    dynamic_fields:
    - table_calculation: win_percentage
      label: Win Percentage
      expression: "${game_goalie_stats.total_wins}/${game_goalie_stats.total_games_played}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    listen:
      Historical Data: game.date_date
    row: 57
    col: 0
    width: 12
    height: 8
  - title: Godly Goalies
    name: Godly Goalies
    model: nhl_thesis
    explore: game_goalie_stats
    type: table
    fields:
    - team_info.full_team_name
    - player_info.full_name
    - game_goalie_stats.total_wins
    - game_goalie_stats.total_games_played
    filters:
      game.date_date: 2 years
      player_info.primary_position: G
    sorts:
    - game_goalie_stats.total_wins desc
    limit: 4
    column_limit: 50
    dynamic_fields:
    - table_calculation: win_percentage
      label: Win Percentage
      expression: "${game_goalie_stats.total_wins}/${game_goalie_stats.total_games_played}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    listen: {}
    row: 11
    col: 5
    width: 19
    height: 3
  - title: Dream Team Lineup
    name: Dream Team Lineup
    model: nhl_thesis
    explore: starting_lineup
    type: table
    fields:
    - starting_lineup.city_name
    - starting_lineup.team_name
    - starting_lineup.first_name
    - starting_lineup.last_name
    - starting_lineup.full_team_name
    - starting_lineup.full_name
    - starting_lineup.primary_position
    - starting_lineup.total_goals
    - starting_lineup.total_assists
    - starting_lineup.total_power_play_goals
    - starting_lineup.total_power_play_assists
    - starting_lineup.total_fantasy_points
    sorts:
    - starting_lineup.total_fantasy_points desc
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields:
    - starting_lineup.city_name
    - starting_lineup.team_name
    - starting_lineup.first_name
    - starting_lineup.last_name
    listen: {}
    row: 0
    col: 5
    width: 19
    height: 11
  - title: Shot Blockers
    name: Shot Blockers
    model: nhl_thesis
    explore: blocked_shots
    type: table
    fields:
    - blocked_shots.first_name
    - blocked_shots.last_name
    - blocked_shots.full_name
    - blocked_shots.primary_position
    - blocked_shots.number_of_blocked_shots
    sorts:
    - blocked_shots.number_of_blocked_shots desc
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields:
    - blocked_shots.last_name
    - blocked_shots.first_name
    listen: {}
    row: 57
    col: 12
    width: 12
    height: 8
  - title: Top Giveaways by Player
    name: Top Giveaways by Player
    model: nhl_thesis
    explore: giveaways
    type: table
    fields:
    - giveaways.first_name
    - giveaways.last_name
    - giveaways.full_name
    - giveaways.primary_position
    - giveaways.number_of_giveaways
    sorts:
    - giveaways.number_of_giveaways desc
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields:
    - giveaways.first_name
    - giveaways.last_name
    listen: {}
    row: 65
    col: 12
    width: 12
    height: 8
  - title: Giveaways by Position
    name: Giveaways by Position
    model: nhl_thesis
    explore: giveaways
    type: looker_column
    fields:
    - giveaways.primary_position
    - giveaways.total_giveaways
    sorts:
    - giveaways.total_giveaways desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - "#000000"
    font_size: 150%
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      giveaways.total_giveaways: "#006D75"
    series_labels:
      giveaways.total_giveaways: Total Giveaways
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Primary Position
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 65
    col: 0
    width: 12
    height: 8
  - title: Total Fantasy Points by Position
    name: Total Fantasy Points by Position
    model: nhl_thesis
    explore: game_skater_stats
    type: looker_pie
    fields:
    - player_info.primary_position
    - game_skater_stats.total_fantasy_points
    filters:
      game.date_date: 2 years
    sorts:
    - game_skater_stats.total_fantasy_points desc
    limit: 25
    column_limit: 50
    value_labels: labels
    label_type: labPer
    colors:
    - "#006D75"
    - "#000000"
    - "#666666"
    - "#EA7200"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_colors: {}
    hidden_fields:
    series_types: {}
    row: 40
    col: 0
    width: 12
    height: 9
  - title: Shots Missed by Player
    name: Shots Missed by Player
    model: nhl_thesis
    explore: missed_shots
    type: table
    fields:
    - missed_shots.first_name
    - missed_shots.last_name
    - missed_shots.full_name
    - missed_shots.primary_position
    - missed_shots.missed_shots
    - missed_shots.total_shots
    - missed_shots.percent_shots_missed
    sorts:
    - missed_shots.missed_shots desc
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields:
    - missed_shots.last_name
    - missed_shots.first_name
    listen: {}
    row: 40
    col: 12
    width: 12
    height: 9
  filters:
  # We can have suggestions via field_filter while still having a default value
  # - name: Player Name
  #   title: Player Name
  #   type: field_filter
  #   model: nhl_thesis
  #   explore: player_info
  #   field: player_info.full_name
  #   default_value: Brent Burns
  #   allow_multiple_values: true
  #   required: false
  - name: Historical Data
    title: Historical Data
    type: date_filter
    default_value: 2 years
    allow_multiple_values: true
    required: false
