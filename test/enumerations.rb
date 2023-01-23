# frozen_string_literal: true

# This file is part of the Plugin Redmine Table Calculation.
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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

module ColoredEnumeration
  ##
  # Provide user login test
  #
  module Enumerations
    def create_custom_field
      custom_field = IssueCustomField.generate!(
        { field_format: 'enumeration' }
      )
      issue_custom_field_enumerations.each do |_key, values|
        custom_field.enumerations.build(values)
        custom_field.save!
      end
      custom_field
    end

    def issue_custom_field_enumerations
      {
        '1': { color: yellow, name: 'value1' },
        '2': { color: green, name: 'value2' },
        '3': { color: red, name: 'value3' }
      }
    end

    def yellow
      '#ffff00'
    end

    def green
      '#008000'
    end

    def red
      '#ff0000'
    end
  end
end
