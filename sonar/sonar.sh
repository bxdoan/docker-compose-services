#!/bin/bash
# Then run sonar scanner
echo "sonar.projectKey=atlas
sonar.sources=atlas,tasks
sonar.exclusions=atlas/views/**
sonar.host.url=http://localhost:9000
sonar.login=818dcbd8120261125c5790ca4eec93af9bec7f21
sonar.python.coverage.reportPaths=coverage.xml
" > sonar-project-dn.properties

export PATH="~/Repo/sonar-scanner/bin/:$PATH"
sonar-scanner -D project.settings=sonar-project-dn.properties