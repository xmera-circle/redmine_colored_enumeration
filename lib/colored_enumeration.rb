# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021 Liane Hampe <liaham@xmera.de>, xmera.
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

# Extensions
require 'colored_enumeration/extensions/custom_field_enumeration_patch'
require 'colored_enumeration/extensions/enumeration_format_patch'
require 'colored_enumeration/extensions/issue_custom_field_patch'
require 'colored_enumeration/extensions/custom_field_value_patch'
require 'colored_enumeration/extensions/base_format_patch'

# Hooks
require 'colored_enumeration/hooks/view_layouts_base_hook_listener'

# Overrides
require 'colored_enumeration/overrides/custom_field_enumerations_controller_patch'
require 'colored_enumeration/overrides/issues_helper_patch'
