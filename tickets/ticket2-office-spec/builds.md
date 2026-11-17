# Hardware Builds and Workload Analysis

## Accountant
* **Load:** Heavy spreadsheets, continuous ERP/accounting software usage all day, multiple tabs, background backups.
* **Bottleneck:** Memory (RAM) and CPU for data processing; relies heavily on Windows[span_42](start_span)[span_42](end_span)[span_43](start_span)[span_43](end_span).
* **Trade-off:** Chose 16 GB RAM instead of 32 GB to stay within budget, relying on fast NVMe swapping capacity[span_44](start_span)[span_44](end_span).
* **Total Cost:** ~611,400 KZT (details in `budget.csv`)[span_45](start_span)[span_45](end_span).

## Sales Manager
* **Load:** CRM in a browser, 30–40 tabs open simultaneously, Excel sheets, and frequent video calls (4+ hours a day)[span_46](start_span)[span_46](end_span).
* **Bottleneck:** Memory (RAM) due to numerous browser tabs and active communication apps[span_47](start_span)[span_47](end_span).
* **Trade-off:** Selected Ryzen 5 7600 with 32 GB RAM to prevent browser tab freezing during customer calls[span_48](start_span)[span_48](end_span).
* **Total Cost:** ~646,310 KZT (details in `budget.csv`).

## Web Developer
* **Load:** Running local containers, multiple virtual machines, code editors (VS Code), and numerous browser debugging windows simultaneously[span_49](start_span)[span_49](end_span).
* **Bottleneck:** CPU multi-threading and high-speed NVMe storage IOPS.
* **Trade-off:** Upgraded to Ryzen 7 7700 and Samsung 990 EVO Plus fast SSD to handle intensive compilation workloads.
* **Total Cost:** ~829,380 KZT (details in `budget.csv`).

## Designer
* **Load:** Handling large vector files, image manipulation, graphic software, and high-resolution display output.
* **Bottleneck:** GPU processing, color accuracy, display resolution, and RAM capacity.
* **Trade-off:** Invested in a high-quality 27-inch 2K IPS monitor (Xiaomi A27Qi) and 32 GB RAM while maintaining a balanced processor choice.
* **Total Cost:** ~867,410 KZT (details in `budget.csv`).

*(Grand Total across all four builds: ~2,954,500 KZT — strictly under the 3,000,000 KZT limit)*[span_50](start_span)[span_50](end_span)[span_51](start_span)[span_51](end_span)
