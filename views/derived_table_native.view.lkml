# If necessary, uncomment the line below to include explore_source.
# include: "the_look_ecommerce_olcay_gittt.model.lkml"

view: derived_table_native {
  derived_table: {
    explore_source: order_items {
      column: country { field: users.country }
      column: city { field: users.city }
      column: traffic_source { field: users.traffic_source }
      column: count { field: users.count }
    }
  }
  dimension: country {
    description: ""
  }
  dimension: city {
    description: ""
  }
  dimension: traffic_source {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}
