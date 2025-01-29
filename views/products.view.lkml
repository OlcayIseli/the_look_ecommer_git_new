# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook_ecommerce_olcay.products` ;;
  #drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [category, department, count]
    # Link 1: Search on Google
    link: {
      label: "Search on Google"
      url: "http://www.google.com/search?q={{ value }}" # Dynamic URL with category
      icon_url: "http://google.com/favicon.ico" # Google icon
      # open_in_new_window: yes # Opens in a new tab
    }


  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Send customer a poke" # Text displayed for the action
      icon_url: "http://google.com/favicon.ico" # Icon for visual context
      url: "https://example.com/send_message" # External endpoint for the action

      # Static or dynamic parameters sent via URL
      param: {
        name: "id" # Parameter key
        value: "{{value}}" # Pass the dimension value dynamically
      }

      # Additional user input via form parameters
      form_param: {
        name: "message" # Key sent to the API
        type: string # Input type
        label: "Message" # Label shown to the user
        description: "This is the message that you want to send to the customer" # Optional description
      }

    }


  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: Total_cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  name,
  distribution_centers.name,
  distribution_centers.id,
  inventory_items.count,
  order_items.count
  ]
  }

}
