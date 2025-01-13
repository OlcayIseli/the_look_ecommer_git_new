# If necessary, uncomment the line below to include explore_source.
# include: "the_look_ecommerce_olcay_gittt.model.lkml"

view: user_derived_table {
  derived_table: {
    explore_source: order_items {
      column: country { field: users.country }
      column: traffic_source { field: users.traffic_source }
      column: count { field: users.count }
    }
  }
  dimension: country {
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
