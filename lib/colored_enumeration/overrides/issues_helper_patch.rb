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

module ColoredEnumeration
  module Overrides
    module IssuesHelperPatch
      def self.prepended(base)
        base.prepend(InstanceMethods)
      end

      module InstanceMethods
        ##
        # Add javascript data attribute with color information.
        #
        # @override IssuesHelper#render_half_width_custom_fields_rows
        #
        def render_half_width_custom_fields_rows(issue)
          values = issue.visible_custom_field_values.reject { |value| value.custom_field.full_width_layout? }
          return if values.empty?

          half = (values.size / 2.0).ceil
          issue_fields_rows do |rows|
            values.each_with_index do |value, i|
              m = (i < half ? :left : :right)
              rows.send(m,
                        custom_field_name_tag(value.custom_field),
                        custom_field_value_tag(value),
                        row_html_args(value))
            end
          end
        end

        def row_html_args(value)
          return { class: value.custom_field.css_classes } unless cast_color(value).present?

          { class: value.custom_field.css_classes,
            data: { color: value.cast_color(value.value) } }
        end

        def cast_color(value)
          value.cast_color(value.value)
        end
      end
    end
  end
end
