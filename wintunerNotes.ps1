#install
Install-Module -Name WinTuner
#import
import-module WinTuner
#add source
dotnet nuget add source "https://api.nuget.org/v3/index.json" --name "nuget.org"
#then install winget-intune.cli via below
dotnet tool install --global SvRooij.Winget-Intune.Cli --version 0.9.1
#You can invoke the tool using the following command: wintuner

#view all packages with grid
Find-WinGetPackage "" | out-gridview

#to search for app
Search-WtWinGetPackage steam


#Example package to package app use add id from search
New-WtWingetPackage -PackageId "Valve.Steam" -PackageFolder "C:\path\to\packagestorage" 

#deploys based on built package - uses metadata from built package to input detection script, logo, etc.
Deploy-WtWin32App -PackageId "Valve.Steam" -RootPackageFolder "C:\path\to\packagestorage" -Version "2.10.91.91"
