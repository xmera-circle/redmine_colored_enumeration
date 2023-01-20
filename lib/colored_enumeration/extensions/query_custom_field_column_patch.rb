# frozen_string_literal: true

# This file is part of the Plugin Redmine Colored Enumeration.
#
# Copyright (C) 2021 - 2022 Liane Hampe <liaham@xmera.de>, xmera.
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

require File.expand_path 'app/models/query', Rails.root

module ColoredEnumeration
  module Extensions
    module QueryCustomFieldColumnPatch
      def self.included(base)
        base.include(InstanceMethods)
      end

      module InstanceMethods
        def color_map
          @color_map ||= custom_field.color_map
        end

        ##
        # Extends the css classes with a html data attribute holding the
        # color code if any.
        #
        # In case there is no CustomFieldEnumeration the
        # default css classes are returned.
        #
        # @overrides QueryCustomFieldColumn#css_classes
        #
        def html_attributes(issue)
          return { class: css_classes } unless custom_field.field_format == 'enumeration'

          val = value_object(issue)
          color = color_map[val&.value.to_i]
          return { class: css_classes } unless color

          { class: css_classes,
            data: { color: color } }
        end
      end
    end
  end
end
