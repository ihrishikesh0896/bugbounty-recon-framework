#!/bin/bash
baseDir="/opt/BugBounty"
part_start=$(date +%s)
if [[ -d "$baseDir" ]]; then
    for dir in "$baseDir"/*/; do
        if [[ -f "${dir}roots.txt" ]]; then
            programName=$(basename "$dir")
            echo "Recon started for $programName."
            echo "Grabbing and Filtering Live Domains for $programName:"
            subfinder -dL "${dir}roots.txt" -silent | dnsx -silent | anew -q "${dir}resolveddomains.txt" | notify -silent -bulk -id all
            echo "Finding webservers for $programName:"
            httpx -mc 404,403 -l "${dir}resolveddomains.txt" -silent -t 75 -ports 66,80,81,443,445,457,1080,1100,1241,1352,1433,1434,1521,1944,2301,3000,3128,3306,4000,4001,4002,4100,5000,5432,5800,5801,5802,6346,6347,7001,7002,8080,8443,8888,30821 | anew "${dir}webservers.txt" | notify -silent -bulk -id new-subs
            echo "Recon completed for $programName."
        else 
            programName=$(basename "$dir")
            echo "No roots.txt found for $programName."
        fi
    done
else
    echo "Directory '$baseDir' does not exist!"
fi
part_end=$(date +%s)
part_execution_time=$((part_end - part_start))
echo "Execution time for the specific part: $part_execution_time seconds"
