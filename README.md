# raster2pdf-windowscore
Docker Windows Core container example running TerraGo Publisher for Raster

This project will outline installing and running TerraGo Publisher For Raster in a Docker Windows Server Core container.

## Setup
1. Copy `TerraGo_Publisher_for_Raster.exe` in to the root of this project
2. Build image
`docker build -t raster2pdf .`
4. Verify
`docker run --rm raster2pdf raster2pdf --version`

## Sample data
You can download some sample GeoTIFF files from [here](https://download.osgeo.org/geotiff/samples/).  I've included two files from the `/usgs/` folder with this project that are copied to `c:\app\data`...

## Running
Open a PowerShell window and execute...
`docker run -it --rm -v "$(pwd)\data:c:\app\data" raster2pdf`
