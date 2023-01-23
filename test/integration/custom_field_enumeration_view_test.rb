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

require File.expand_path('../test_helper', __dir__)

module ColoredEnumeration
  class CustomFieldEnumerationViewTest < ActionDispatch::IntegrationTest
    include ColoredEnumeration::AuthenticateUser
    include ColoredEnumeration::Enumerations

    fixtures :users

    def setup
      @custom_field = create_custom_field
    end

    test 'index view should have color fields' do
      log_user('admin', 'admin')
      get custom_field_enumerations_path(@custom_field)
      assert_select '.color-tag', 3
      assert_select 'input[value=?]', yellow
    end
  end
end
