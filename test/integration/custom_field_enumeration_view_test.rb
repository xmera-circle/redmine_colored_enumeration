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

require File.expand_path('../test_helper', __dir__)

module ColoredEnumeration
  class CustomFieldEnumerationViewTest < ActionDispatch::IntegrationTest
    include ColoredEnumeration::AuthenticateUser

    fixtures :users

    def setup
      @custom_field = IssueCustomField.generate!({ 
        field_format: 'enumeration'
      })
      enumerations.each do |_key, values|
        @custom_field.enumerations.build(values)
        @custom_field.save
      end
    end

    test 'index view should have color fields' do
      log_user('admin', 'admin')
      get custom_field_enumerations_path(@custom_field)
      assert_select '.color-tag', 3
      assert_select 'input[value=?]', yellow
    end

    private

    def enumerations
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