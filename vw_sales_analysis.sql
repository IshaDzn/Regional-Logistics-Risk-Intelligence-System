CREATE OR REPLACE VIEW reporting.vw_sales_analysis
 AS
 SELECT f.order_id,
    f.order_item_id,
    c.customer_id,
    c.customer_fname,
    c.customer_lname,
    c.customer_segment,
    c.customer_city,
    c.customer_state,
    c.customer_country,
    p.product_name,
    cat.category_name,
    p.product_status,
    p.product_price,
    d.full_date AS order_date,
    d.month,
    d.quarter,
    d.year,
    g.market,
    g.order_region,
    g.order_country,
    g.order_state,
    g.order_city,
    sh.shipping_mode,
    os.order_status,
    f.order_item_quantity,
    f.sales,
    f.order_item_discount,
    f.order_item_total,
    f.order_item_product_price,
    f.benefit_per_order,
    f.order_profit_per_order,
    f.order_item_profit_ratio,
    f.days_for_shipping_real,
    f.days_for_shipment_scheduled,
    f.late_delivery_risk
   FROM warehouse.factorderitems f
     JOIN warehouse.dimcustomer c ON f.customer_key = c.customer_key
     JOIN warehouse.dimproduct p ON f.product_key = p.product_key
     JOIN warehouse.dimcategory cat ON p.category_key = cat.category_key
     JOIN warehouse.dimdate d ON f.order_date_key = d.date_key
     JOIN warehouse.dimgeography g ON f.geography_key = g.geography_key
     JOIN warehouse.dimshipping sh ON f.shipping_key = sh.shipping_key
     JOIN warehouse.dimorderstatus os ON f.order_status_key = os.order_status_key;
