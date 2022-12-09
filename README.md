Installs/Configures hcl-logicmonitor

# Requirements

## Platform:

* redhat centos

## Cookbooks:

# Attributes
### hcl-logicmonitor::default
|Key|Type|Description|Default|
|--- |--- |--- |--- |
|['hcl-logicmonitor']['lgmuser']['user']|String|User Name|lgmuser|
|['hcl-logicmonitor']['lgmuser']['group']|String|Group Name|lgmuser|
|['hcl-logicmonitor']['lgmuser']['url']|String|Path of the artifactory|https://artifactory-prod.hclint.global/artifactory/linux-generic/logic-monitor/logicmonitor_hcl_ssh.tgz|

# Recipes

* hcl-logicmonitor::default

# License and Maintainer

Maintainer:: HCL (<parmy@hcl.com>)

License:: All rights reserved
