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

module ColoredEnumeration
  module Extensions
    module EnumerationFormatPatch
      def self.included(base)
        base.include(InstanceMethods)
        base.multiple_supported = false
      end

      module InstanceMethods
        ##
        # Strips the color of a custom field value.
        #
        # @note Given a multi value field the first color will be taken.
        #
        # @return [String] A hex color string.
        #
        def cast_color(custom_field, value, customized = nil)
          casted_value = value_object(custom_field, value, customized)
          return casted_value&.color || '' unless casted_value.is_a? Array

          colors = casted_value&.map(&:color)
          colors.first || ''
        end

        def value_object(custom_field, value, customized)
          cast_value(custom_field, value, customized)
        end
      end
    end
  end
end
