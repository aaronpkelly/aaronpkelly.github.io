
Table of Contents
=================

   * [Purpose](#purpose)
   * [My current CI/CD pipeline](#my-current-cicd-pipeline)
   * [Tool-specific information](#tool-specific-information)
      * [Ansible](#ansible)
      * [Chef](#chef)
      * [Jenkins](#jenkins)
         * [Viewing all Jenkins credentials](#viewing-all-jenkins-credentials)
      * [Puppet](#puppet)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# Purpose
All my automation related knowledge

# My current CI/CD pipeline

publishing:
- codecommit -> buildspec.yml pushes:
-- source (+ dockerfile if a runnable) to Github/lab
-- also publishes a library to package repo (github packages) if source is also a library

running:
- DockerHub scans github and Autobuilds docker image
-- - image used with a service which runs docker (Cloud9)
- gitpod.io to preview webapp (free linux terminal)

# Tool-specific information

## Ansible
Extremely simple automation over ssh.

I've tried it a while ago and it seemed to work well.

## Chef

"Automation for developers". Haven't really used it.

## Jenkins

Job scheduler. Used it a lot at work!

### Viewing all Jenkins credentials

This will display in _plaintext_ all credentials stored in the Jenkins
Credential manager. Apparently it's a favourite script amongst Jenkins admins:
```
import com.cloudbees.plugins.credentials.CredentialsProvider
import com.cloudbees.plugins.credentials.Credentials
import com.cloudbees.plugins.credentials.domains.Domain
import jenkins.model.Jenkins
def indent = { String text, int indentationCount ->
  def replacement = "\t" * indentationCount
  text.replaceAll("(?m)^", replacement)
}

Jenkins.get().allItems().collectMany{ CredentialsProvider.lookupStores(it).toList()}.unique().forEach { store ->
  Map<Domain, List<Credentials>> domainCreds = [:]
  store.domains.each { domainCreds.put(it, store.getCredentials(it))}
  if (domainCreds.collectMany{ it.value}.empty) {
    return
  }
  def shortenedClassName = store.getClass().name.substring(store.getClass().name.lastIndexOf(".") + 1)
  println "Credentials for store context: ${store.contextDisplayName}, of type $shortenedClassName"
  domainCreds.forEach { domain , creds ->
    println indent("Domain: ${domain.name}", 1)
    creds.each { cred ->
      cred.properties.each { prop, val ->
        println indent("$prop = \"$val\"", 2)
      }
      println indent("-----------------------", 2)
    }
  }
}
```

## Puppet

Automation for IT administrators
