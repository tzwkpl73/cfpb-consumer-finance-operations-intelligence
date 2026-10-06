CREATE SCHEMA IF NOT EXISTS analytics;

CREATE OR REPLACE VIEW analytics.overall_monthly_kpis AS
SELECT
  DATE_TRUNC('month', date_received)::date AS month_start,
  COUNT(*) AS complaint_count,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE timely_response_flag IS TRUE)
    / NULLIF(COUNT(*) FILTER (WHERE timely_response_flag IS NOT NULL), 0),
    2
  ) AS timely_response_rate
FROM analytics.complaints_clean
GROUP BY 1;

CREATE OR REPLACE VIEW analytics.monthly_product_kpis AS
SELECT
  DATE_TRUNC('month', date_received)::date AS month_start,
  product,
  COUNT(*) AS complaint_count,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE timely_response_flag IS TRUE)
    / NULLIF(COUNT(*) FILTER (WHERE timely_response_flag IS NOT NULL), 0),
    2
  ) AS timely_response_rate
FROM analytics.complaints_clean
WHERE product IS NOT NULL
GROUP BY 1, 2;

CREATE OR REPLACE VIEW analytics.monthly_issue_kpis AS
SELECT
  DATE_TRUNC('month', date_received)::date AS month_start,
  product,
  issue,
  COUNT(*) AS complaint_count
FROM analytics.complaints_clean
WHERE issue IS NOT NULL
GROUP BY 1, 2, 3;

CREATE OR REPLACE VIEW analytics.state_product_kpis AS
SELECT
  state,
  product,
  COUNT(*) AS complaint_count,
  ROUND(
    100.0 * COUNT(*) FILTER (WHERE timely_response_flag IS TRUE)
    / NULLIF(COUNT(*) FILTER (WHERE timely_response_flag IS NOT NULL), 0),
    2
  ) AS timely_response_rate
FROM analytics.complaints_clean
WHERE state IS NOT NULL
  AND product IS NOT NULL
GROUP BY 1, 2;
