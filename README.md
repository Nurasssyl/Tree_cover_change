# Tree Cover Change in Kazakhstan (2020–2024)

This project analyzes tree cover change across Kazakhstan's districts between 2020 and 2024 using Google Earth Engine data and R.

## Overview

- Source data: Dynamic World V1 (GEE)  
- Resolution: 250m  
- Analysis level: ADM2 (districts)  
- Metric: Relative % change in average tree cover probability

## Highlights

🔼 Top growth districts:  
- Nura (Astana): +77.3%  
- Glubokoe (East KZ): +64.9%  
- Shemonaikha (East KZ): +59.2%

🔽 Most loss districts:  
- Mamlyut (North KZ): −57.9%  
- Magzhan Zhumabaev (North KZ): −56.5%  
- Kyzylzhar (North KZ): −49.4%

## How to run

Make sure the following files are available locally:
- Tree cover rasters for 2020 and 2024
- Shapefile of Kazakhstan ADM2 boundaries (2024)

Then run [`trees.r`](trees.r) in R.

## Visualization

The choropleth map uses a diverging palette:
- Red for loss  
- Yellow for no change  
- Green for gain
