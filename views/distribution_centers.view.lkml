# The name of this view in Looker is "Distribution Centers"
view: distribution_centers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook_ecommerce_olcay.distribution_centers` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Distribution Center Geom" in Explore.

  dimension: distribution_center_geom {
    type: string
    sql: ${TABLE}.distribution_center_geom ;;
  }

  dimension: geo_point {
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude};;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, products.count]
  }
}
