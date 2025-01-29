
view: derived_table_sample_2 {
  derived_table: {
    sql: SELECT
          order_items.order_id AS order_items_order_id,
          order_items.status AS order_items_status,
          COUNT(*) AS order_items_count
      FROM `thelook_ecommerce_olcay.order_items` AS order_items
      GROUP BY
          1,
          2
      ORDER BY 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_order_id {
    type: number
    sql: ${TABLE}.order_items_order_id ;;
  }

  dimension: order_items_status {
    type: string
    sql: ${TABLE}.order_items_status ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.order_items_count ;;
  }

  set: detail {
    fields: [
      order_items_order_id,
      order_items_status,
      order_items_count
    ]
  }
}
