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

    class ViewLayoutsBaseHookListener < Redmine::Hook::ViewListener

      def view_layouts_base_html_head(context={})
        return unless /Issues/.match? (context[:controller].class.name.to_s)

        meta = "\n".html_safe + stylesheet_link_tag('colored_data_fields.css', plugin: :redmine_colored_enumeration) +
        "\n".html_safe + javascript_include_tag('colored_data_fields.js', plugin: :redmine_colored_enumeration)
        meta
      end
    end
  end
end
