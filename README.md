# BEE - bash-email-extractor (a simple Bash File Splitter and Email Address Extractor)

## Description
This Bash script is designed to split large files in a specified folder and extract email addresses from smaller files. It provides a convenient way to process large data files that may contain email addresses and separate them into manageable chunks while also removing duplicate email addresses.

# How to Use
Clone the repository to your local machine:
<pre>
  git clone https://github.com/rinalluc/bash-email-extractor.git
  cd bash-email-extractor
</pre>

Ensure you have Bash installed on your system.

Make the script executable:

<pre>
  chmod +x bee.sh
</pre>

Run the script:

`./bee.sh`

Follow the on-screen prompts to enter the folder to process and the output file path.

## Input Requirements
The script expects the user to provide an existing input folder containing the files to be processed.
The maximum allowed file size for processing is set to 20,000,000 bytes (approx. 20 MB). Files larger than this size will be split into smaller chunks.
The script uses regular expressions to identify email addresses in the files. It looks for patterns in the form of "user@example.com."
## Output
The script will create the output file specified by the user. The output file will contain a list of unique email addresses extracted from the input files, with duplicates removed.

## Note
The script uses the grep command to extract email addresses, so make sure to provide input files that are text-based and contain email addresses in the expected format.
## Cleanup
The script will remove temporary files generated during the process, including the temp.tmp file used to store intermediate email addresses.
If the script splits any large files during the process, it will remove the splitted files after processing.
## Disclaimer
This script is provided as-is and may not cover all possible edge cases. It's essential to test the script with sample data and review the output to ensure it meets your requirements.

Feel free to contribute to the repository by creating pull requests or submitting issues for bug fixes or improvements.

Happy file splitting and email address extracting! 😄
