# Bug Bounty Recon Automation Script

This Bash script automates the reconnaissance process for bug bounty programs by scanning directories for `roots.txt` files, which should contain domains of interest. For each domain found, it performs subdomain discovery and filters live domains, then identifies webservers running on various ports and excludes common error codes like 404 and 403. The results are aggregated into respective files and notifications are sent for both new findings and overall results.

## Prerequisites

Before running this script, ensure you have the following tools installed and accessible in your system's PATH:

- **subfinder**: Subdomain discovery tool.
- **dnsx**: Tool for DNS queries and filtering live domains.
- **httpx**: HTTP toolkit for webserver identification.
- **anew**: A tool for appending new unique elements to a file without duplicates.
- **notify**: Command-line tool to send notifications across various platforms.

These tools are essential for the script to function correctly. Please refer to each tool's official documentation for installation instructions.

## Setup

1. **Clone the Repository**: Clone this repository to your local machine or simply download the Bash script.

```bash
   git clone https://github.com/yourusername/your-repo-name.git
```
2. **Set the Base Directory**: Edit the script to set baseDir to the directory where your program directories are located. Each program directory should contain a roots.txt file with domains to scan.
```bash
   baseDir="/opt/BugBounty"
```

## Usage
```bash
   ./recon.sh
```
The script will iterate through each directory under baseDir, looking for roots.txt files to process. Results will be saved in resolveddomains.txt and webservers.txt within each program's directory.

## Output
```
resolveddomains.txt: Contains all live domains found during the recon process.
webservers.txt: Lists webservers and their respective ports that did not return a 404 or 403 status code.
```

## Notifications
Notifications are sent through the notify tool for both the completion of recon for each program and new subdomain discoveries. Ensure notify is correctly configured to receive these alerts.

## Execution Time
The script measures and prints the execution time upon completion, helping you gauge the efficiency of your recon process.