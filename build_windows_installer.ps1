#! powershell

Push-Location $env:TEMP

# Download embeddable python version 3.9.13
Invoke-WebRequest -UseBasicParsing https://www.python.org/ftp/python/3.9.13/python-3.9.13-embed-amd64.zip -OutFile empy-3.9.13-amd64.zip
New-Item -Path sources -ItemType directory -Force

# Extract the archive
Expand-Archive empy-3.9.13-amd64.zip sources\python39 -Force

# Adapt the path variable to allow for pip
'import site' | Out-File -FilePath sources\python39\python39._pth -Append -Encoding utf8

# Download pip and execute it
Invoke-WebRequest -UseBasicParsing https://bootstrap.pypa.io/get-pip.py -OutFile get-pip.py
.\sources\python39\python.exe get-pip.py

# Use pip to install the latest version of datalad-gooey
.\sources\python39\python.exe -m pip install 'git+https://github.com/datalad/datalad-gooey.git@main'

Pop-Location
