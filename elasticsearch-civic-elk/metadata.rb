name 'elasticsearch-civic-elk'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures elasticsearch-civic-elk'
long_description 'Installs/Configures elasticsearch-civic-elk'
version '0.1.0'

depends 'elasticsearch', '>= 3.0.4'
depends 'java'
depends 'kibana5'
depends 'chef_nginx'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/elasticsearch-civic-elk/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/elasticsearch-civic-elk' if respond_to?(:source_url)
