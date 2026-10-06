# Data dictionary

## Analysis-ready table: `analytics.complaints_clean`

| Field | Type | Definition |
| --- | --- | --- |
| `complaint_id` | bigint | Unique CFPB complaint identifier. |
| `date_received` | date | Date the CFPB received the complaint. |
| `date_sent_to_company` | date | Date the complaint was sent to the company. |
| `product` | text | Financial product named in the complaint. |
| `sub_product` | text | More detailed product category, when available. |
| `issue` | text | Consumer-reported issue category. |
| `sub_issue` | text | More detailed issue category, when available. |
| `company` | text | Company named in the source record. |
| `state` | text | Consumer state, when supplied. |
| `submitted_via` | text | Submission channel, such as web or phone. |
| `company_response_to_consumer` | text | Response category captured by CFPB. |
| `timely_response_flag` | boolean | `TRUE` for source value `Yes`, `FALSE` for `No`, otherwise null. |

## Tableau export datasets

| File | Grain | Purpose |
| --- | --- | --- |
| `overall_monthly_kpis.csv` | Month | Complaint trend and overall timely-response rate. |
| `monthly_product_kpis.csv` | Month × product | Product volume and response performance. |
| `monthly_issue_kpis.csv` | Month × product × issue | Issue concentration and ranking. |
| `state_product_kpis.csv` | State × product | Geographic/product comparisons. |
