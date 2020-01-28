FROM mcr.microsoft.com/windows:1903
LABEL maintainer="jbfreels@terragotech.com"

WORKDIR /app
COPY TerraGo_Publisher_for_Raster.exe /app

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Start-Process -FilePath \
    c:\app\TerraGo_Publisher_for_Raster.exe -ArgumentList \
    @('/S', '/v', '/qn') -PassThru | Wait-Process; \
    Remove-Item c:\app\TerraGo_Publisher_for_Raster.exe -Force

# PUB4R.xml is used to set the concurrent license server
# set <licenseServer> tag to the IP of your license server
RUN New-Item -Path 'C:\ProgramData\TerraGo Technologies\TerraGo Publisher for Raster' -ItemType 'directory'

COPY ["assets/PUB4R.xml", "C:/ProgramData/TerraGo Technologies/TerraGo Publisher for Raster/" ]
