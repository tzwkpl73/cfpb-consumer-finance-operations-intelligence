# Methodology and limitations

## Data scope

- Source: CFPB Consumer Complaint Database
- Analysis period: January 1, 2020 through December 31, 2025
- Raw data imported: 18,216,229 records
- Clean analytics model: 11,209,668 records

## Transformation approach

1. Imported the CFPB CSV into PostgreSQL as a raw staging table.
2. Limited the analysis to complaints received during 2020–2025.
3. Standardized blank text values to null.
4. Retained one row per complaint ID.
5. Converted timely-response values to a boolean field.
6. Built reusable KPI views for time, product, issue, and state analysis.

## Quality controls

- Counted raw and clean records.
- Checked that complaint IDs were unique in the clean model.
- Audited missing values for date, product, issue, and timely response.
- Verified the minimum and maximum dates in the analysis model.

## Interpretation guardrails

- Complaint volume does not represent a company’s total customers, market share, customer satisfaction, fraud rate, or legal liability.
- A high complaint count may reflect scale, product mix, customer awareness, reporting behavior, or other factors not measured here.
- Timely-response rate is based on the value recorded in the source data and should not be interpreted as customer satisfaction or resolution quality.
