#  issue-tracker


Table of Contents

  * [1. WHAT IS IT ?!](#1-what-is-it-)
  * [2. INSTALLATION AND CONFIGURATION](#2-installation-and-configuration)
    * [2.1. Prerequisites](#21-prerequisites)
    * [2.2. Fetch the source](#22-fetch-the-source)
    * [2.3. run the boot-strap script](#23-run-the-boot-strap-script)
    * [2.4. Apply the db and issue create scirpts](#24-apply-the-db-and-issue-create-scirpts)
    * [2.5. Install the required Perl modules](#25-install-the-required-perl-modules)
    * [2.6. Start hacking](#26-start-hacking)
  * [3. ADDITIONAL DOCS](#3-additional-docs)


    

## 1. What is it ?!
A tool to handle multiple projects issues programmatically using txt files , xls files and PostgreSQL db as a source .

    

## 2. INSTALLATION AND CONFIGURATION


    

### 2.1. Prerequisites
The must have binaries are:
 bash, perl, zip

The nice to have are:
 tmux, vim ,ctags

The examples are for Ubuntu - use you OS package manager …

    # use your OS package manager … if you are not on Ubuntu 
    
    sudo apt-get autoclean
    sudo apt-get install --only-upgrade bash
    
    sudo apt-get install -y perl
    
    # optionally 
    sudo apt-get install -y excuberant-ctags
    sudo apt-get install -y 7z
    
    sudo apt-get upgrade

### 2.2. Fetch the source
Fetch the source from git hub as follows:

    # got to a dir you have write permissions , for example:
    cd ~ 
    
    # fetch the source
    git clone git@github.com:YordanGeorgiev/issue-tracker.git

### 2.3. run the boot-strap script
The bootstrap script will interpolate change the git deployment dir to a "product_instance_dir" ( your instance of the issue-tracker, having the same version as this one, but running on a different host with different owner - your )

    # run the bootstrap script : 
    bash issue-tracker/src/bash/issue-tracker/bootstrap-issue-tracker.sh
    
    # now go to your product instance dir
    cd /opt/csitea/issue-tracker/issue-tracker.0.1.8.dev.$USER
    

### 2.4. Apply the db and issue create scirpts
If you do not have the PostgreSQL installed check the instructions in the installations and configuratios section of the DevOps guide:
https://github.com/YordanGeorgiev/issue-tracker/blob/master/doc/md/issue-tracker-devops-guide.md#1-installations-and-configurations
If you do have it , apply the db and issue create scirpts as follows:

    bash src/bash/issue-tracker/issue-tracker.sh -a run-pgsql-scripts

### 2.5. Install the required Perl modules
Just run the prerequisites checker script which will provide you with copy pastable instructions

    sudo perl src/perl/issue_tracker/script/issue_tracker_preq_checker.pl
    
    # after installing all the modules check the perl syntax of the whole project:
    bash src/bash/issue-tracker/issue-tracker.sh -a check-perl-syntax

### 2.6. Start hacking
Start usage:

    doParseIniEnvVars cnf/ysg-issues.dev.doc-pub-host.cnf
    
    bash src/bash/issue-tracker/issue-tracker.sh -a txt-to-db
    bash src/bash/issue-tracker/issue-tracker.sh -a db-to-xls
    
    # now edit the files in the xls 
    bash src/bash/issue-tracker/issue-tracker.sh -a xls-to-db
    bash src/bash/issue-tracker/issue-tracker.sh -a db-to-txt
    export issues_order_by_attribute=start_time
    export issues_order_by_attribute=prio
    bash src/bash/issue-tracker/issue-tracker.sh -a db-to-txt

## 3. ADDITIONAL DOCS
Additonal docs could be found in the doc/md dir. 

    

