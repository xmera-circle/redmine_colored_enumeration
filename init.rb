# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021-2023 Liane Hampe <liaham@xmera.de>, xmera Solutions GmbH.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA

require File.expand_path('lib/colored_enumeration', __dir__)

Redmine::Plugin.register :redmine_colored_enumeration do
  name 'Colored Enumeration'
  author 'Liane Hampe'
  description 'Background color for custom field enumeration values'
  version '0.1.3'
  url 'https://circle.xmera.de/projects/redmine-colored-enumeration'
  author_url 'http://xmera.de'

  requires_redmine version_or_higher: '4.2.1'
  requires_redmine_plugin :redmine_base_deface, version_or_higher: '1.6.2'
  requires_redmine_plugin :advanced_plugin_helper, version_or_higher: '0.4.0'
end

RedmineColoredEnumeration.setup
