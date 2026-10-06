-- Expected result for the completed portfolio build:
-- raw rows: 18,216,229
-- clean 2020-2025 rows: 11,209,668
-- duplicate complaint IDs: 0

-- 1. Confirm raw and clean record counts.
SELECT 'raw_cfpb_complaints' AS dataset, COUNT(*) AS row_count
FROM public.raw_cfpb_complaints
UNION ALL
SELECT 'complaints_clean_2020_2025', COUNT(*)
FROM analytics.complaints_clean;

-- 2. Confirm the clean model contains one row per Complaint ID.
SELECT
  COUNT(*) AS rows_in_clean_model,
  COUNT(DISTINCT complaint_id) AS distinct_complaint_ids,
  COUNT(*) - COUNT(DISTINCT complaint_id) AS duplicate_complaint_ids
FROM analytics.complaints_clean;

-- 3. Check required analytical fields for missing values.
SELECT
  COUNT(*) FILTER (WHERE date_received IS NULL) AS missing_date_received,
  COUNT(*) FILTER (WHERE product IS NULL) AS missing_product,
  COUNT(*) FILTER (WHERE issue IS NULL) AS missing_issue,
  COUNT(*) FILTER (WHERE timely_response_flag IS NULL) AS missing_timely_response
FROM analytics.complaints_clean;

-- 4. Confirm the date scope.
SELECT
  MIN(date_received) AS first_date,
  MAX(date_received) AS last_date,
  COUNT(DISTINCT EXTRACT(YEAR FROM date_received)) AS years_covered
FROM analytics.complaints_clean;

-- 5. Inspect timely-response values before using the rate in reporting.
SELECT timely_response_flag, COUNT(*) AS complaint_count
FROM analytics.complaints_clean
GROUP BY 1
ORDER BY 1 NULLS LAST;
