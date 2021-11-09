# Azure-AzDevOps-Bootstrapper
This repository contains a bootstrapper for configuring an existing Azure DevOps account with a Kubernetes-hosted build agents. 

- Create your Azure DevOps organisation (you do not need a project)
- Go to the User Settings (top right hand corner)
- Select Personal Access Token
- Create a new token (Agent Pools - Read & Manage, Service Connections - Read, query and manage)
- Store the Personal Access Token in a safe place (_Do not publish this_)