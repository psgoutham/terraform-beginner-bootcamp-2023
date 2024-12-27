# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

Given a version number **MAJOR.MINOR.PATCH**, increment the:

-  **MAJOR** version when you make incompatible API changes
-  **MINOR** version when you add functionality in a backward compatible manner
-  **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the Terraform CLI
### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. 
So we need to refer to the install CLI instructions via Terraform documentation and
change the scripting for installation.

Click to [Install Terraform CLI](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

### Considerations for Linux distribution
This project is built against Ubuntu. Please consider checking your Linux distribution and change accordingly

How to check your Linux version/flavor

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.4 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash scripts
While fixing the Terraform CLI gpg deprecation issues we noticed the bash scripts steps were a considerable
amount of code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located at [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh)

- This will keep the Gitpod Task File ([gitpod.yml file](gitpod.yml)) tidy
- This allows us easier to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install Terraform

### Shebang

A Shebang tells the bash script what interpreter program will interpret the script. eg: `#!/bin/bash`

ChatGPT recommends that we use this format for bash: `#!/usr/bin/env bash`

https://en.wikipedia.org/wiki/Shebang_(Unix)

## Execution considerations

When executing the bash sript we can use the `./` shorthand notation to execute the bash script

eg. `./bin/install_terraform_cli.sh`

If we are using a script in gitpod.yml we need to point the script to a program to interpret it

eg. `source ./bin/install_terraform_cli.sh`

## Gitpod Lifecycle (before, init, command)

We need to be careful when using the init because it will not rerun if we restart an existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks

