# Consumer Financial Operations & Risk Intelligence

**[View the interactive Tableau Public dashboard](https://public.tableau.com/app/profile/taige.zhu1321/viz/Book1_17913192948350/Dashboard1)**

## Project overview

This independent portfolio project turns the CFPB Consumer Complaint Database into an operations and risk-monitoring workflow. I used PostgreSQL to clean, validate, and aggregate complaint data, then built an interactive Tableau dashboard for decision-makers.

The project focuses on three business questions:

1. How did consumer complaint volume change from 2020 through 2025?
2. Which financial products and complaint issues account for the greatest operational attention?
3. How consistently were complaints reported as receiving a timely response?

## Results at a glance

| Metric | Result |
| --- | ---: |
| Raw CFPB complaint records ingested | 18.2M |
| Clean analytics records, 2020–2025 | 11.2M |
| KPI datasets exported for Tableau | 4 |
| Duplicate complaint IDs in clean model | 0 |

## Dashboard

The Tableau Public dashboard contains:

- Monthly consumer complaint trend
- Complaint volume by financial product
- Top 10 consumer complaint issues
- Timely response rate by product

**[Open the dashboard](https://public.tableau.com/app/profile/taige.zhu1321/viz/Book1_17913192948350/Dashboard1)**

## Tech stack

- PostgreSQL 18
- SQL: data modeling, data-quality checks, KPI views, and CSV exports
- Tableau Public: interactive dashboard design and publishing
- CFPB Consumer Complaint Database

## Repository structure

```text
.
├── docs/
│   ├── dashboard_guide.md
│   ├── data_dictionary.md
│   └── methodology.md
├── sql/
│   ├── 00_import_raw_data.psql
│   ├── 01_create_clean_model.sql
│   ├── 02_create_kpi_views.sql
│   ├── 03_data_quality_checks.sql
│   └── 04_export_for_tableau.psql
└── README.md
```

## Reproduction outline

1. Download the CFPB Consumer Complaint Database CSV.
2. Create a PostgreSQL database and run `sql/00_import_raw_data.psql`, supplying the source CSV path.
3. Run `sql/01_create_clean_model.sql`, `sql/02_create_kpi_views.sql`, and `sql/03_data_quality_checks.sql` in order.
4. Update the export paths in `sql/04_export_for_tableau.psql` and run it through `psql`.
5. Connect Tableau to the four exported CSV files and reproduce the dashboard using `docs/dashboard_guide.md`.

The raw CFPB file and Tableau exports are intentionally not included in this repository because of their size. The source data is publicly available from the [Consumer Financial Protection Bureau](https://www.consumerfinance.gov/data-research/consumer-complaints/).

## Important interpretation note

Complaint volume is an operational signal, not a measure of a company’s quality, legality, fraud rate, or customer satisfaction. Findings should be interpreted alongside customer base size, product mix, reporting behavior, and other context.

## Author

Taige Zhu — independent portfolio analysis
