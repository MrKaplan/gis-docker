# 📌 Project Backlog — Docker ARM64 GIS Stack

This document gathers project ideas to be developed upon the GIS stack defined for this repository.
The goal of this backlog is to:
* Serve as a technical and conceptual reference
* Allow the selection of anchor projects to validate the stack
* Evolve ideas in an incremental and reusable way

---

## 1. Flood & Inundation Zone Monitoring

**Description**
Automatic detection of flood events based on satellite imagery and temporal analysis.

**Core Components**
* Sentinel-2
* NDWI
* Automatic Vectorization
* WebGIS Publication

**Development Hooks**
* Threshold-based automatic alerts
* Comparison with historical flood data
* Integration with precipitation data
* Flood severity classification

---

## 2. Burnt Area Detection

**Description**
Identification and mapping of burnt areas following forest fires.

**Core Components**
* Sentinel-2 / Landsat
* NBR / dNDVI
* Pre- and Post-event analysis

**Development Hooks**
* Fire severity calculation
* Integration with multi-year history
* Comparison between different fire events
* Baseline for regeneration projects

---

## 3. Agricultural Drought Observatory

**Description**
Continuous monitoring of water stress in agricultural areas.

**Core Components**
* Multitemporal NDVI
* Agricultural Parcels (Parcelário)
* Time Series

**Development Hooks**
* Anomaly analysis against historical averages
* Temporal dashboards
* Crop comparison
* Agricultural alert system

---

## 4. Urban Heat Islands

**Description**
Identification of urban zones with higher thermal risk using environmental proxies.

**Core Components**
* NDVI
* Land Use
* Optional: Landsat Surface Temperature

**Development Hooks**
* Cross-referencing with socio-economic data
* Impact assessment of green spaces
* Urban planning support

---

## 5. Urban Walkability

**Description**
Assessment of pedestrian accessibility and urban space quality.

**Core Components**
* Pedestrian networks
* Isochrones
* Urban services

**Development Hooks**
* Walkability score by neighborhood
* Public transport integration
* New facility simulation

---

## 6. Hiking & Cycling Trails

**Description**
Planning of optimized routes for soft mobility.

**Core Components**
* Road/Path network
* Slope / Gradient
* DEM (Digital Elevation Model)

**Development Hooks**
* Slope penalty algorithms
* Classification by effort level
* GPX Export

---

## 7. Water Quality Monitoring (Remote Proxy)

**Description**
Detection of changes in water bodies based on spectral indices.

**Core Components**
* NDWI
* Time Series

**Development Hooks**
* Anomalous event detection
* Comparison between reservoirs
* Integration with in-situ data

---

## 8. Daily Environmental Scraping

**Description**
Automatic collection of external environmental data with spatial storage.

**Core Components**
* Cronjobs
* Python
* Temporal PostGIS

**Development Hooks**
* Simple dashboards
* Public API
* Correlation with satellite data

---

## 9. Agricultural Abandonment

**Description**
Identification of agricultural areas with progressive loss of activity.

**Core Components**
* Multi-year NDVI
* Trend analysis

**Development Hooks**
* Classification by abandonment speed
* Cross-referencing with environmental factors
* Support for public policy

---

## 10. Interactive Urban Atlas

**Description**
WebGIS platform for visualization of urban planning information.

**Core Components**
* QGIS Server
* WMS/WFS
* Official layers

**Development Hooks**
* Advanced query tools
* Data export features
* Cadastre integration

---

## 11. Spatial Alert System

**Description**
Transformation of GIS analyses into events and alerts.

**Core Components**
* Cronjobs
* Spatial rules
* Event database

**Development Hooks**
* Notification API
* Alert history
* Event dashboards

---

## 12. Post-Fire Vegetation Regeneration (10 Years)

**Description**
Analysis of vegetation recovery over a decade following forest fires.

**Core Components**
* Sentinel-2 + Landsat
* NDVI / NBR
* Long time series

**Development Hooks**
* Recovery curves per pixel or polygon
* Regeneration dynamics classification
* Time-to-recovery (partial/complete)
* Cross-referencing with slope, soil, and aspect
* Comparison between different fires
* WebGIS Time Slider

---

## 13. Personal GIS as a Service

**Description**
Using the stack as a base platform for multiple mini GIS projects.

**Core Components**
* Reproducible Docker Stack
* Isolated projects by folder

**Development Hooks**
* Project templates
* Simple multi-tenancy
* Technical showcase
* Base for freelancing or research

---

*This backlog is a living document and should evolve as the stack and project goals mature.*
