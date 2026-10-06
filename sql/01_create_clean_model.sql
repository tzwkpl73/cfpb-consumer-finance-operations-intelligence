-- Creates an analysis-ready 2020-2025 complaint model.
-- DISTINCT ON retains one row per Complaint ID if a duplicate exists upstream.

CREATE SCHEMA IF NOT EXISTS analytics;

DROP TABLE IF EXISTS analytics.complaints_clean;

CREATE TABLE analytics.complaints_clean AS
SELECT DISTINCT ON (complaint_id)
  complaint_id,
  date_received,
  date_sent_to_company,
  NULLIF(TRIM(product), '') AS product,
  NULLIF(TRIM(sub_product), '') AS sub_product,
  NULLIF(TRIM(issue), '') AS issue,
  NULLIF(TRIM(sub_issue), '') AS sub_issue,
  NULLIF(TRIM(company), '') AS company,
  NULLIF(TRIM(state), '') AS state,
  NULLIF(TRIM(submitted_via), '') AS submitted_via,
  NULLIF(TRIM(company_response_to_consumer), '') AS company_response_to_consumer,
  CASE
    WHEN LOWER(TRIM(timely_response)) = 'yes' THEN TRUE
    WHEN LOWER(TRIM(timely_response)) = 'no' THEN FALSE
    ELSE NULL
  END AS timely_response_flag
FROM public.raw_cfpb_complaints
WHERE date_received >= DATE '2020-01-01'
  AND date_received < DATE '2026-01-01'
  AND complaint_id IS NOT NULL
ORDER BY complaint_id, date_sent_to_company DESC NULLS LAST;

ALTER TABLE analytics.complaints_clean
  ADD CONSTRAINT complaints_clean_pkey PRIMARY KEY (complaint_id);

CREATE INDEX complaints_clean_date_received_idx
  ON analytics.complaints_clean (date_received);

CREATE INDEX complaints_clean_product_idx
  ON analytics.complaints_clean (product);

CREATE INDEX complaints_clean_issue_idx
  ON analytics.complaints_clean (issue);

ANALYZE analytics.complaints_clean;
