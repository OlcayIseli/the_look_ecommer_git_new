view: q1_table {
  sql_table_name: `olcayiseli-sandbox.thelook_ecommerce_olcay.q1_table` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension: measure {
    type: number
    sql: ${TABLE}.Measure ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }
  measure: count {
    type: count
  }
}
