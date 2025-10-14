import subprocess # Must import subprocess
import requests

# Have prompt message
def switch_proxy(): # Create a function
    print(subprocess.run( # Use your shell run the file
        ['/usr/bin/bash', './random-switch.sh'], # The second file path required is the path to the random-switch.sh file.
        capture_output=True,
        text=True
    ).stdout)

# No Prompt message
# def switch_proxy():
#     subprocess.run(
#         ['/usr/bin/bash', './random-switch.sh'],  # The second path required is the path to the random-switch.sh file.
#         capture_output=True,
#         text=True
#     )

if __name__ == '__main__':
    for i in range(3):
        switch_proxy()  # Randomly change node
        print(requests.get("https://ifconfig.me/").text)
