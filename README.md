fc2-paas-installer
==================

## What's this? 
Installation of cloudfoundry PaaS for fi content 2.

It reconfigures a pre-installed Cloud Foundry release with a new domain and password. It embeds the Web Administration console, which is also reconfigured.

## Usage
 * FI-Content context (using pre-packaged image)
  * instantiate a VM with fc2-paas-template
  * SSH into the VM
  * ./fc2-paas-installer/install.sh '\<your_domain\>' '\<your_password\>'
 * From a blank environment
  * Install Cloud Foundry using cf_nise_bosh installer
  * Install Web Admin console
  * Install UAA Client (cf-uuac)
  * Clone this repository and execute the script

## References
 * https://github.com/cloudfoundry/cf-release
 * https://github.com/cloudfoundry-incubator/admin-ui
 * https://github.com/nttlabs/nise_bosh
 * https://github.com/yudai/cf_nise_installer
 * https://github.com/cloudfoundry/cf-uaac


