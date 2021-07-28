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

module ColoredEnumeration
  module Hooks
    include Redmine::Hook

    class ViewIssuesIndexBottomHookListener < Redmine::Hook::ViewListener

      def view_issues_index_bottom(context = {})
        controller = context[:controller]
        return unless /Issues/.match?(controller.class.name.to_s)
        query = context[:query] || []
        issues = context[:issues] || []

        return if issues.blank? || query.blank?

        columns = custom_field_columns(query)
        ids = custom_field_ids(columns)
        cfv = custom_field_values(issues, ids)
        ecfv = enumeration_custom_fields(cfv)
        issue_mapping = issue_map(ecfv)
        render_with_javascript(issue_mapping, controller) if issue_mapping
      end

      def render_with_javascript(issue_mapping, controller)
        controller.send(
          :render_to_string,
          { partial: 'hooks/enumeration_badges',
            locals: { issue_mapping: issue_mapping } }
        ).html_safe
      end

      def custom_field_columns(query)
        return unless query.column_names

        query.column_names.select { |name| name.match('cf_') }
      end

      def custom_field_ids(columns)
        return unless columns

        ids = columns.map do |col|
          col.to_s.scan(Regexp.new('cf_(\d+)'))
        end
        ids.flatten.map(&:to_i) unless ids.flatten.blank?
      end

      def custom_field_values(issues, ids)
        return unless ids

        cfvs = issues.map do |issue|
          issue.custom_field_values.select { |cfv| ids.include? cfv.custom_field_id }
        end
        cfvs.flatten
      end

      def enumeration_custom_fields(cfv)
        return if cfv.blank?

        cfv.select { |field| field.custom_field.field_format == 'enumeration' }
      end

      def issue_map(ecfv)
        return if ecfv.blank?

        group = ecfv.group_by { |cfv| cfv.customized.id }
        group.keys.each_with_object({}) do |id, hash|
          collect = {}
          group[id].each do |cfv|
            color = assign_color(cfv)
            collect.merge!(cfv.custom_field_id => color)
          end
          hash[id] = collect
        end
      end

      def assign_color(cfv)
        cfv.cast_color(cfv.value)
      end
    end
  end
end
